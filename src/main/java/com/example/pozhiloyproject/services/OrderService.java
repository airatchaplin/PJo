package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.DetailInfo;
import com.example.pozhiloyproject.models.Order;
import com.example.pozhiloyproject.models.WorkBench;
import com.example.pozhiloyproject.repository.OrderRepository;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class OrderService {

    @Autowired
    OrderRepository orderRepository;

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    public void saveOrder(Order order) {
        orderRepository.save(order);
    }

    public Order findOneOrder(int numberOrder) {
        return orderRepository.findByNumberOrder(numberOrder);
    }

    public void deleteOrderByNumberOrder(int numberOrder) {
        Order order = orderRepository.findByNumberOrder(numberOrder);
        orderRepository.delete(order);
    }

    public void raschet(int numberOrder) {
        LocalDateTime dateStart = LocalDateTime.parse("2021-07-22T08:00");
        LocalDateTime dateEnd = LocalDateTime.parse("2021-07-22T17:00");
        Order order = orderRepository.findByNumberOrder(numberOrder);
        List<DetailInfo> detailInfos = order.getDetailInfos();
        for (int i = 0; i < detailInfos.size(); i++) {
            LocalDateTime dateTimeStartForCalculation = dateStart;
            LocalDateTime dateTimeEndForCalculation = dateEnd;

            WorkBench workBench = detailInfos.get(i).getDetail().getWorkBenches().get(i);
            int countDetail = order.getDetailInfos().get(i).getCount();
            LocalDateTime dateTimeWorkbench = workBench.getDateEndDetail();
            while (countDetail != 0) {
                String[] minSec = detailInfos.get(i).getDetail().getTimeWorkDetails().get(i).getTimeWork().split(",");
                String min = minSec[0];
                String sec = minSec[1];

                dateTimeWorkbench = dateTimeWorkbench.plusMinutes(Long.parseLong(min));
                dateTimeWorkbench = dateTimeWorkbench.plusSeconds(Long.parseLong(sec));
                countDetail--;
                if (dateTimeWorkbench.isAfter(dateTimeEndForCalculation) || dateTimeWorkbench.isEqual(dateTimeEndForCalculation)) {
                    dateTimeWorkbench = dateTimeStartForCalculation;
                    dateTimeWorkbench = dateTimeWorkbench.plusDays(1);
                    dateTimeEndForCalculation = dateTimeEndForCalculation.plusDays(1);
                    dateTimeStartForCalculation = dateTimeStartForCalculation.plusDays(1);
                }

            }
        }
    }
}
