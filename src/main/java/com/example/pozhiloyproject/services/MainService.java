package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.dto.StatisticsDto;
import com.example.pozhiloyproject.helper.Db;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class MainService {

    @Autowired
    Db db;

    @Autowired
    OrderService orderService;

    public List<StatisticsDto> getStatistics(String localDateTime, String workbenchName) {
        List<StatisticsDto> statisticsDtoList = new LinkedList<>();
        List<Map<String, Object>> call = db.call(String.format("select w.name,\n" +
                "       extract('day' from detail_date_start) day_start,\n" +
                "       extract('day' from detail_date_end)   day_end,\n" +
                "       dd.detail_date_start::time            date_start_time,\n" +
                "       dd.detail_date_end ::time             date_end_time,\n" +
                "       d.name                                detailName,\n" +
                "       o.id                                  details_order_id\n" +
                "from detail_date_by_workbench dd\n" +
                "         left join workbench w on dd.work_bench_id = w.id\n" +
                "         left join detail_order_list_detail_date_by_workbench dolddbw\n" +
                "                   on dd.id = dolddbw.detail_date_by_workbench_id\n" +
                "         left join detail_order_list dol on dolddbw.detail_order_list_id = dol.id\n" +
                "         left join detail_order_detail_order_lists dodol on dol.id = dodol.detail_order_lists_id\n" +
                "         left join detail_order d on dodol.detail_order_id = d.id\n" +
                "         left join details_order o on d.id = o.detail_order_id\n" +
                "         left join orders_details_orders odo on d.id = odo.order_id\n" +
                "         left join orders o2 on odo.order_id = o2.id\n" +
                "where extract('month' from detail_date_start) notnull\n" +
                "  and extract('month' from detail_date_start) = %2$s\n" +
                "  and w.name = '%1$s'\n" +
                "order by 2, 3, 4", workbenchName, localDateTime));

        for (Map<String, Object> stringObjectMap : call) {
            statisticsDtoList.add(setStatistics(stringObjectMap));
        }
        return statisticsDtoList;
    }

    private StatisticsDto setStatistics(Map<String, Object> stringObjectMap) {
        StatisticsDto statisticsDto = new StatisticsDto();
        statisticsDto.setDayStart(String.valueOf(stringObjectMap.get("day_start")));
        statisticsDto.setDayEnd(String.valueOf(stringObjectMap.get("day_end")));
        statisticsDto.setDetailName(String.valueOf(stringObjectMap.get("detailName")));
        statisticsDto.setDateStartTime(String.valueOf(stringObjectMap.get("date_start_time")));
        statisticsDto.setDateEndTime(String.valueOf(stringObjectMap.get("date_end_time")));
        statisticsDto.setOrderNumber(String.valueOf(getOrderByDetailsOrderId(String.valueOf(stringObjectMap.get("details_order_id")))));
        return statisticsDto;
    }

    public int getOrderByDetailsOrderId(String id) {
        List<Map<String, Object>> details_order_id = db.call(String.format("select o.number_order from details_order\n" +
                "join orders_details_orders odo on details_order.id = odo.details_orders_id\n" +
                "join orders o on odo.order_id = o.id\n" +
                "where odo.details_orders_id = '%1$s'", id));
        return (int) details_order_id.get(0).get("number_order");
    }

    public Map<String, StatisticsDto> getDayMap() {
        Map<String, StatisticsDto> oneDay = new HashMap<>();
        oneDay.put("Гибочный пресс с ЧПУ 1,5м (ЧПУ маленький)", new StatisticsDto());
        oneDay.put("Гибочный пресс с ЧПУ 3м (ЧПУ большой)", new StatisticsDto());
        oneDay.put("Гильотина", new StatisticsDto());
        oneDay.put("Комбинированный станок ГЕКА", new StatisticsDto());
        oneDay.put("Координатно-пробивной пресс ( координатка)", new StatisticsDto());
        oneDay.put("Линеарно-прокатный станок (прокатка)", new StatisticsDto());
        oneDay.put("Ручные станки", new StatisticsDto());
        oneDay.put("Станок лазерной резки (лазер)", new StatisticsDto());
        oneDay.put("Фрезерно-гравировальный станок 3D", new StatisticsDto());
        return oneDay;
    }
}
