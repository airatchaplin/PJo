package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.dto.DetailDto;
import com.example.pozhiloyproject.dto.TimeWorkDetailDto;
import com.example.pozhiloyproject.dto.WorkBenchDto;
import com.example.pozhiloyproject.helper.Db;
import com.example.pozhiloyproject.models.*;
import com.example.pozhiloyproject.repository.DetailRepository;
import com.example.pozhiloyproject.repository.TypeOperationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.time.Clock;
import java.time.LocalDateTime;
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

    /**
     * Сервис времени деталей
     */
    @Autowired
    TimeWorkDetailService timeWorkDetailService;

    public List<DetailDto> getAllDetails() {
        List<Map<String, Object>> rows = db.call("select details.id   as detailId,\n" +
                "       details.name as detailName,\n" +
                "       details.length,\n" +
                "       details.width,\n" +
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
            detailDto.setWidth((String) row.get("width"));
            detailDto.setLength((String) row.get("length"));
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
        detailDto.setMaterialName(detail.getMaterial().getName());
        detailDto.setMaterialThickness(detail.getMaterial().getThickness());
        detailDto.setLength(detail.getLength());
        detailDto.setWidth(detail.getWidth());

        List<Map<String, Object>> mapList = db.call("select w.id, w.name, w.date_end_detail, t.name as type_operation_name, dwb.priority from details left join details_work_benches dwb on details.id = dwb.detail_id left join workbench w on dwb.work_benches_id = w.id left join type_operation t on w.type_operation_id = t.id where detail_id = '" + detail.getId() + "'");
        List<Map<String, Object>> mapList2 = db.call("select detail_id,time_work_details_id,priority,time_work from details_time_work_details left join timeworkdetail t on t.id = details_time_work_details.time_work_details_id where detail_id = '" + detail.getId() + "'");

        List<WorkBenchDto> workBenchDtos = new ArrayList<>();
        List<TimeWorkDetailDto> timeWorkDetailsDtos = new ArrayList<>();
        WorkBenchDto workBenchDto;
        TimeWorkDetailDto timeWorkDetailDto;
        for (int i = 0; i < mapList.size(); i++) {
            DateTimeFormatter dtf = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
            LocalDateTime localDateTime = LocalDateTime.parse(mapList.get(i).get("date_end_detail").toString().replace(" ", "T"), dtf);
            workBenchDto = new WorkBenchDto();
            workBenchDto.setId((UUID) mapList.get(i).get("id"));
            workBenchDto.setName(String.valueOf(mapList.get(i).get("name")));
            workBenchDto.setDateEndDetail(localDateTime);
            workBenchDto.setPriority((Integer) mapList.get(i).get("priority"));
            workBenchDto.setTypeOperation(String.valueOf(mapList.get(i).get("type_operation_name")));
            workBenchDtos.add(workBenchDto);
            timeWorkDetailDto = new TimeWorkDetailDto();
            timeWorkDetailDto.setId((UUID) mapList2.get(i).get("time_work_details_id"));
            timeWorkDetailDto.setTimeWork(String.valueOf(mapList2.get(i).get("time_work")));
            timeWorkDetailDto.setPriority((Integer) mapList2.get(i).get("priority"));
            timeWorkDetailsDtos.add(timeWorkDetailDto);
        }
        detailDto.setWorkBenchDtos(WorkBenchDto.compareWorkBenchesPriority(workBenchDtos));
        detailDto.setTimeWorkDetailsDtos(TimeWorkDetailDto.compare(timeWorkDetailsDtos));
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
