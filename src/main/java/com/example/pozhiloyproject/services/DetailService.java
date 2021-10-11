package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.dto.DetailDto;
import com.example.pozhiloyproject.dto.DetailInfoDto;
import com.example.pozhiloyproject.dto.DetailListDto;
import com.example.pozhiloyproject.dto.WorkBenchDto;
import com.example.pozhiloyproject.helper.Db;
import com.example.pozhiloyproject.models.*;
import com.example.pozhiloyproject.repository.DetailRepository;
import com.example.pozhiloyproject.repository.WorkBenchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.format.DateTimeFormatter;
import java.util.*;


/**
 * Сервис деталей
 */
@Service
public class DetailService {

    /**
     * Репозиторий деталей
     */
    @Autowired
    DetailRepository detailRepository;

    @Autowired
    WorkBenchRepository workBenchRepository;

    /**
     * Подключение к бд
     */
    @Autowired
    Db db;

    /**
     * Сервис типов операций
     */
    @Autowired
    TypeOperationService typeOperationService;

    public List<DetailDto> getAllDetails() {
        List<Map<String, Object>> rows = db.call("select details.id   as detailId,\n" +
                "       details.name as detailName,\n" +
                "       m.id         as matetialId,\n" +
                "       m.name       as materialName,\n" +
                "       m.thickness\n" +
                "from details\n" +
                "         left join materials m on details.material_id = m.id");
        List<DetailDto> detailDtos = new ArrayList<>();
        DetailDto detailDto;
        for (Map<String, Object> row : rows) {
            detailDto = new DetailDto();
            detailDto.setId((UUID) row.get("detailId"));
            detailDto.setName((String) row.get("detailName"));
            detailDto.setMaterialName(String.valueOf(row.get("materialName")));
            detailDto.setMaterialThickness((Double) row.get("thickness"));
            detailDtos.add(detailDto);
        }
        return detailDtos;
    }

    /**
     * Получить DetailDto по id
     *
     * @param id Идентификатор детали
     * @return DetailDto
     */
    public DetailDto getDetailDtoById(UUID id) {
        Optional<Detail> detail = detailRepository.findById(id);
        return setAttributesDetailDto(detail.orElse(new Detail()));
    }

    /**
     * Получить Detail по id
     *
     * @param id Идентификатор детали
     * @return Detail
     */
    public Detail getDetailById(UUID id) {
        Optional<Detail> detail = detailRepository.findById(id);
        return detail.orElse(new Detail());
    }

    /**
     * Получить Detail по наименованию
     *
     * @param name Наименование детали
     * @return Detail
     */
    public Detail getDetailByName(String name) {
        return detailRepository.findByName(name);
    }

    /**
     * Сохранение детали
     *
     * @param detail Деталь
     */
    public void saveDetail(Detail detail) {
        detailRepository.save(detail);
    }

    /**
     * Удаление детали
     *
     * @param detail Деталь
     */
    public void deleteDetail(Detail detail) {
        detailRepository.delete(detail);
    }

    /**
     * Установить поля для DetailDto
     *
     * @param detail Деталб
     * @return DetailDto
     */
    public DetailDto setAttributesDetailDto(Detail detail) {
        DetailDto detailDto = new DetailDto();
        detailDto.setId(detail.getId());
        detailDto.setName(detail.getName());
        detailDto.setMaterialId(detail.getMaterial().getId());
        detailDto.setMaterialName(detail.getMaterial().getName());
        detailDto.setMaterialThickness(detail.getMaterial().getThickness());
        detailDto.setTimePacking(detail.getTimePacking());


        List<DetailListDto> detailListDtos = new ArrayList<>();
        List<DetailInfoDto> detailInfoDtos = new ArrayList<>();

        for (int i = 0; i < detail.getDetailLists().size(); i++) {
            DetailListDto detailListDto = new DetailListDto();
            detailListDto.setId(detail.getDetailLists().get(i).getId());
            detailListDto.setMainOrAlternative(detail.getDetailLists().get(i).getMainOrAlternative());

            List<DetailInfo> detailInfos = detail.getDetailLists().get(i).getDetailInfos();
            for (int j = 0; j < detailInfos.size(); j++) {
                DetailInfoDto detailInfoDto = new DetailInfoDto();
                detailInfoDto.setId(detailInfos.get(j).getId());
                detailInfoDto.setPriority(detailInfos.get(j).getPriority());
                detailInfoDto.setComment(detailInfos.get(j).getComment());
                detailInfoDto.setTimeWork(detailInfos.get(j).getTimeWork());

                WorkBenchDto workBenchDto = new WorkBenchDto();
                workBenchDto.setId(detailInfos.get(j).getWorkBenches().getId());
                workBenchDto.setName(detailInfos.get(j).getWorkBenches().getName());
                String format = detailInfos.get(j).getWorkBenches().getDateEndDetail().format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss"));
                workBenchDto.setDateEndDetail(format);
                workBenchDto.setPriority(detailInfos.get(j).getPriority());
                workBenchDto.setTypeOperation(detailInfos.get(j).getWorkBenches().getTypeOperation().getName());
                workBenchDto.setCurrentThickness(detailInfos.get(j).getWorkBenches().getCurrentThickness());

                detailInfoDto.setWorkBenchDto(workBenchDto);
                detailInfoDtos.add(detailInfoDto);

            }
            detailListDto.setDetailInfoDtos(detailInfoDtos);
            detailInfoDtos = new ArrayList<>();
            detailListDtos.add(detailListDto);
        }
        detailDto.setDetailListDtos(detailListDtos);
        List<DetailListDto> detailList = detailDto.getDetailListDtos();
        for (DetailListDto detailListDto : detailList) {
            DetailInfoDto.comparePriority(detailListDto.getDetailInfoDtos());
        }
        return detailDto;
    }

    /**
     * Проверка при доавлении контрагента
     *
     * @param name Наименование контрагента
     * @return Результат
     */
    public boolean checkDetail(String name) {
        Detail findByNameDetail = getDetailByName(name);
        return findByNameDetail != null;
    }

    public DetailList getDetailLists(List<String> workBenchId, List<String> timeWork, List<String> comment, int mainOrAlternative) {
        List<WorkBench> workBenches = new ArrayList<>();
        for (String id : workBenchId) {
            if (!id.equals("Выберите станок")) {
                Optional<WorkBench> workBench = workBenchRepository.findById(UUID.fromString(id));
                workBenches.add(workBench.orElse(new WorkBench()));
            }
        }
        List<DetailInfo> detailInfos = new ArrayList<>();
        for (int i = 0; i < workBenches.size(); i++) {
            DetailInfo detailInfo = new DetailInfo();
            detailInfo.setId(UUID.randomUUID());
            detailInfo.setTimeWork(timeWork.get(i));
            if (!comment.isEmpty()) {
                detailInfo.setComment(comment.get(i));
            }
            detailInfo.setPriority(i);
            detailInfo.setWorkBenches(workBenches.get(i));
            detailInfos.add(detailInfo);
//            detailInfoService.saveDetailInfo(detailInfo);

        }
        DetailList detailList = new DetailList();
        detailList.setId(UUID.randomUUID());
        detailList.setDetailInfos(detailInfos);
        detailList.setMainOrAlternative(mainOrAlternative);
        return detailList;
    }
}
