package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.dto.DetailDto;
import com.example.pozhiloyproject.dto.DetailInfoDto;
import com.example.pozhiloyproject.dto.WorkBenchDto;
import com.example.pozhiloyproject.helper.Db;
import com.example.pozhiloyproject.models.*;
import com.example.pozhiloyproject.repository.DetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        Detail detail = detailRepository.findById(id).orElseThrow();
        return setAttributesDetailDto(detail);
    }

    /**
     * Получить Detail по id
     *
     * @param id Идентификатор детали
     * @return Detail
     */
    public Detail getDetailById(UUID id) {
        return detailRepository.findById(id).orElseThrow();
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

        List<DetailInfoDto> detailInfoDtos = new ArrayList<>();

        for (int i = 0; i < detail.getDetailInfos().size(); i++) {
            DetailInfoDto detailInfoDto = new DetailInfoDto();
            detailInfoDto.setId(detail.getDetailInfos().get(i).getId());
            detailInfoDto.setComment(detail.getDetailInfos().get(i).getComment());
            detailInfoDto.setTimeWork(detail.getDetailInfos().get(i).getTimeWork());
            detailInfoDto.setPriority(detail.getDetailInfos().get(i).getPriority());

            WorkBenchDto workBenchDto = new WorkBenchDto();
            workBenchDto.setId(detail.getDetailInfos().get(i).getWorkBenches().getId());
            workBenchDto.setName(detail.getDetailInfos().get(i).getWorkBenches().getName());
            workBenchDto.setDateEndDetail(detail.getDetailInfos().get(i).getWorkBenches().getDateEndDetail());
            workBenchDto.setPriority(detail.getDetailInfos().get(i).getPriority());
            workBenchDto.setTypeOperation(detail.getDetailInfos().get(i).getWorkBenches().getTypeOperation().getName());
            workBenchDto.setCurrentThickness(detail.getDetailInfos().get(i).getWorkBenches().getCurrentThickness());

            detailInfoDto.setWorkBenchDto(workBenchDto);
            detailInfoDtos.add(detailInfoDto);
        }
        DetailInfoDto.comparePriority(detailInfoDtos);
        detailDto.setDetailInfoDtos(detailInfoDtos);

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
}
