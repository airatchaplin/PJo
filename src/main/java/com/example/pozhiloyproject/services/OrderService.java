package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.Detail;
import com.example.pozhiloyproject.models.DetailInfo;
import com.example.pozhiloyproject.models.Order;
import com.example.pozhiloyproject.models.WorkBench;
import com.example.pozhiloyproject.repository.OrderRepository;
import com.example.pozhiloyproject.repository.WorkBenchRepository;

import java.time.LocalDate;
import java.util.ArrayList;

import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class OrderService {

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    WorkBenchRepository workBenchRepository;

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    public void saveOrder(Order order) {
        orderRepository.save(order);
    }

    public Order findOneOrder(int numberOrder) {
        return orderRepository.findByNumberOrder(numberOrder);
    }

    public void deleteOrderByNumberOrder(Order order) {
        orderRepository.delete(order);
    }


      public void raschet(int numberOrder) {

    Order order = orderRepository.findByNumberOrder(numberOrder);
    List<DetailInfo> detailInfos = order.getDetailInfos();
    LocalDateTime dateOrderStart = detailInfos.get(0).getDetail().getWorkBenches().get(0).getDateEndDetail();
    LocalDateTime dateOrderEnd = null;

    LocalDateTime dateDetailInfoStart = null;
    LocalDateTime dateDetailInfoEnd = null;

      for (int i = 0; i < detailInfos.size(); i++) {
        List<Boolean> isCalculated =new ArrayList<>();
        WorkBench workBench = null;
        LocalDateTime dateTimeWorkbench = null;
        Boolean isCalc = null;



        for (int j = 0; j < detailInfos.get(i).getDetail().getWorkBenches().size(); j++) {

          isCalc= detailInfos.get(i).getIsCalculated().get(j);

          if (isCalc.equals(false)) {

              dateDetailInfoStart = detailInfos.get(i).getDetail().getWorkBenches().get(j).getDateEndDetail();



            workBench = detailInfos.get(i).getDetail().getWorkBenches().get(j);

            LocalDateTime dateStart = LocalDateTime.parse(workBench.getDateEndDetail().toLocalDate() + "T08:30");
            LocalDateTime dateEnd = LocalDateTime.parse(workBench.getDateEndDetail().toLocalDate() + "T16:30");

            int countDetail = order.getDetailInfos().get(i).getCount();
            dateTimeWorkbench = workBench.getDateEndDetail();
            while (countDetail != 0) {
              String[] minSec = detailInfos.get(i).getDetail().getTimeWorkDetails().get(j).getTimeWork().split(",");
              String min = minSec[0];
              if (minSec.length>1) {

                String sec = minSec[1];

                if (!dateTimeWorkbench.plusMinutes(Long.parseLong(min)).plusSeconds(Long.parseLong(sec))
                    .isAfter(dateEnd)) {
                  dateTimeWorkbench = dateTimeWorkbench.plusMinutes(Long.parseLong(min));
                  dateTimeWorkbench = dateTimeWorkbench.plusSeconds(Long.parseLong(sec));
                  countDetail--;
                } else {
                  dateEnd = dateEnd.plusDays(1);
                  dateStart = dateStart.plusDays(1);
                  dateTimeWorkbench = dateStart;
                }
              }else{
                if (!dateTimeWorkbench.plusMinutes(Long.parseLong(min))
                    .isAfter(dateEnd)) {
                  dateTimeWorkbench = dateTimeWorkbench.plusMinutes(Long.parseLong(min));

                  countDetail--;
                } else {
                  dateEnd = dateEnd.plusDays(1);
                  dateStart = dateStart.plusDays(1);
                  dateTimeWorkbench = dateStart;
                }
              }


            }
            detailInfos.get(i).setDateStart(dateDetailInfoStart);
            detailInfos.get(i).setDateEnd(dateTimeWorkbench);

            isCalculated.add(true);
            if (detailInfos.size()-1 == i && detailInfos.get(i).getDetail().getWorkBenches().size() - 1 == j){
              dateOrderEnd = dateTimeWorkbench;
              order.setDateStart( dateOrderStart);
              order.setDateEnd(dateOrderEnd);
            }

            workBench.setDateEndDetail(dateTimeWorkbench);
            workBenchRepository.save(workBench);
          }

        }



        if (!isCalculated.isEmpty()) {
          detailInfos.get(i).setIsCalculated(isCalculated);

        }
    }

    orderRepository.save(order);
  }
//    public void raschet(int numberOrder) {
//        Order order = orderRepository.findByNumberOrder(numberOrder);
//
//        LocalDateTime dateOrderStart;
//        LocalDateTime dateOrderEnd;
//
//        List<DetailInfo> detailInfosList = order.getDetailInfos();
//
//        for (int i = 0; i < detailInfosList.size(); i++) {
//
//            detailInfosList.get(i).getDetail().
//
//        }
//    }


}
