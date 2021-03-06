package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.dto.WorkBenchDto;
import com.example.pozhiloyproject.helper.Db;
import com.example.pozhiloyproject.models.WorkBench;
import com.example.pozhiloyproject.repository.WorkBenchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * Сервис станков
 */
@Service
public class WorkBenchService {

    @Autowired
    WorkBenchRepository workBenchRepository;

    @Autowired
    Db db;

    @Autowired
    DetailService detailService;

    /**
     * Сохранение станка
     *
     * @param workBench Станок
     */
    public void save(WorkBench workBench) {
        workBenchRepository.save(workBench);
    }

    /**
     * Получение всех станков
     *
     * @return Список всех станков
     */
    public List<WorkBenchDto> getAllWorkBench() {
        List<Map<String, Object>> rows = db.call("select workbench.id   as workbenchId,\n" +
                "       workbench.name as workbenchName,\n" +
                "       date_end_detail,\n" +
                "       towb.name      as typeOperationId,\n" +
                "       current_thickness,\n" +
                "       time_work_adjustment\n" +
                "from workbench\n" +
                "         left join type_operation towb on workbench.type_operation_id = towb.id");
        List<WorkBenchDto> workBenchDtos = new ArrayList<>();

        WorkBenchDto workBenchDto;
        for (Map<String, Object> row : rows) {
            workBenchDto = new WorkBenchDto();
            workBenchDto.setId((UUID) row.get("workbenchId"));
            workBenchDto.setName(String.valueOf(row.get("workbenchName")));
            LocalDateTime parse = LocalDateTime.parse(row.get("date_end_detail").toString().replace(" ", "T"));
            workBenchDto.setDateEndDetail(parse.format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")));
            workBenchDto.setTypeOperation(String.valueOf(row.get("typeOperationId")));
            workBenchDto.setCurrentThickness((Double) row.get("current_thickness"));
            workBenchDto.setTimeWorkAdjustment(String.valueOf(row.get("time_work_adjustment")));
            workBenchDtos.add(workBenchDto);
        }
        return workBenchDtos;
    }

    public WorkBenchDto getWorkBenchDtoById(UUID id) {
        List<Map<String, Object>> rows = db.call(String.format("select workbench.id   as workbenchId,\n" +
                "       workbench.name as workbenchName,\n" +
                "       date_end_detail,\n" +
                "       towb.name      as typeOperationId,\n" +
                "       current_thickness," +
                "       time_work_adjustment\n" +
                "from workbench\n" +
                "         left join type_operation towb on workbench.type_operation_id = towb.id\n" +
                "\n" +
                "where workbench.id = '%1$s'", id));
        WorkBenchDto workBenchDto = null;
        for (Map<String, Object> row : rows) {
            workBenchDto = new WorkBenchDto();
            workBenchDto.setId((UUID) row.get("workbenchId"));
            workBenchDto.setName(String.valueOf(row.get("workbenchName")));
            LocalDateTime parse = LocalDateTime.parse(row.get("date_end_detail").toString().replace(" ", "T"));
            workBenchDto.setDateEndDetail(parse.format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")));
            workBenchDto.setTypeOperation(String.valueOf(row.get("typeOperationId")));
            workBenchDto.setCurrentThickness((Double) row.get("current_thickness"));
            workBenchDto.setTimeWorkAdjustment(String.valueOf(row.get("time_work_adjustment")));
        }
        return workBenchDto;
    }

    /**
     * Получение станка по наименованию
     *
     * @param name Наименование станка
     * @return Станок
     */
    public WorkBench getOneWorkBenchByName(String name) {
        return workBenchRepository.findByName(name);
    }

    /**
     * Получение станка по наименованию
     *
     * @param id Идентификатор станка
     * @return Станок
     */
    public WorkBench getOneWorkBenchById(UUID id) {
        Optional<WorkBench> workBench = workBenchRepository.findById(id);
        return workBench.orElse(new WorkBench());
    }

    /**
     * Удаление станка
     *
     * @param workBench Станок
     */
    public void deleteWorkBench(WorkBench workBench) {
        workBenchRepository.delete(workBench);
    }

    /**
     * Получение станков по фильтру типа операции
     *
     * @param id Идентификатор типа операции
     * @return Список станков
     */
    public List<WorkBench> getWorkBenchesFilterOperationName(UUID id) {
        return workBenchRepository.findByWorkBenchesFilterOperationName(id);
    }

    /**
     * Проверка при добавлении станка
     *
     * @param name Наименование станка
     * @return Результат
     */
    public boolean checkAddWorkBench(String name) {
        WorkBench findWorkBench = getOneWorkBenchByName(name);
        return findWorkBench != null;
    }

    /**
     * Проверка при добавлении станка
     *
     * @param name Наименование станка
     * @return Результат
     */
    public boolean checkAddWorkBench(UUID id, String name) {
        WorkBench currentWorkBench = getOneWorkBenchById(id);
        WorkBench findWorkBench = getOneWorkBenchByName(name);
        if (currentWorkBench.equals(findWorkBench)) {
            return false;
        } else if (findWorkBench != null && !findWorkBench.equals(currentWorkBench)) {
            return true;
        } else if (findWorkBench == null) {
            return false;
        }
        return false;
    }

    public List<WorkBenchDto> getUniqueWorkBench(UUID detailId) {
        List<Map<String, Object>> rows = db.call("select workbench.id   as workbenchId,\n" +
                "       workbench.name as workbenchName,\n" +
                "       date_end_detail,\n" +
                "       towb.name      as typeOperationId,\n" +
                "       current_thickness\n" +
                "from workbench\n" +
                "         left join type_operation towb on workbench.type_operation_id = towb.id");
        List<WorkBenchDto> workBenchDtos = new ArrayList<>();

        WorkBenchDto workBenchDto;
        for (Map<String, Object> row : rows) {
            workBenchDto = new WorkBenchDto();
            workBenchDto.setId((UUID) row.get("workbenchId"));
            workBenchDto.setName(String.valueOf(row.get("workbenchName")));
            LocalDateTime parse = LocalDateTime.parse(row.get("date_end_detail").toString().replace(" ", "T"));
            workBenchDto.setDateEndDetail(parse.format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")));
            workBenchDto.setTypeOperation(String.valueOf(row.get("typeOperationId")));
            workBenchDto.setCurrentThickness((Double) row.get("current_thickness"));
            workBenchDtos.add(workBenchDto);
        }
//        DetailDto detailDto = detailService.getDetailDtoById(detailId);
//        for (int i = 0; i < detailDto.getDetailInfoDtos().size(); i++) {
//            int finalI = i;
//            workBenchDtos.removeIf(x->x.getId().equals(detailDto.getDetailInfoDtos().get(finalI).getWorkBenchDto().getId()));
//
//        }
        return workBenchDtos;
    }
}
