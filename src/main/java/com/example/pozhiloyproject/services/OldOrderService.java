package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.helper.Db;
import com.example.pozhiloyproject.models.*;
import com.example.pozhiloyproject.models.detail.*;
import com.example.pozhiloyproject.models.oldOrder.*;
import com.example.pozhiloyproject.repository.OldOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class OldOrderService {

    @Autowired
    OldOrderRepository oldOrderRepository;

    @Autowired
    OldDetailOrderListService oldDetailOrderListService;

    @Autowired
    OldDetailOrderService oldDetailOrderService;

    @Autowired
    OrderService orderService;

    @Autowired
    DetailOrderListService detailOrderListService;

    @Autowired
    DetailOrderService detailOrderService;

    @Autowired
    OldWorkBenchService oldWorkBenchService;

    @Autowired
    WorkBenchService workBenchService;

    @Autowired
    Db db;

    public void saveOldOrder(OldOrder oldOrder) {
        oldOrderRepository.save(oldOrder);
    }

    public void fillOldOrderByOrder(Order order) {
        OldOrder oldOrder = new OldOrder();
        oldOrder.setId(order.getId());
        oldOrder.setNumberOrder(order.getNumberOrder());
        oldOrder.setObjectName(order.getObjectName());
        oldOrder.setManager(order.getManager());
        oldOrder.setEconomist(order.getEconomist());
        oldOrder.setPainting(order.getPainting());
        oldOrder.setPacking(order.getPacking());
        oldOrder.setComment(order.getComment());
        oldOrder.setCalculated(false);
        oldOrder.setDateStartOrder(null);
        oldOrder.setDateEndOrder(null);

        List<DetailsOrder> detailsOrders = order.getDetailsOrders();
        List<OldDetailsOrder> oldDetailsOrders = new ArrayList<>();
        for (DetailsOrder detailsOrder : detailsOrders) {
            OldDetailsOrder oldDetailsOrder = new OldDetailsOrder();
            oldDetailsOrder.setId(detailsOrder.getId());
            oldDetailsOrder.setCount(detailsOrder.getCount());
            oldDetailsOrder.setIncrement(detailsOrder.getIncrement());

            DetailOrder detailOrder = detailsOrder.getDetailOrder();
            OldDetailOrder oldDetailOrder = new OldDetailOrder();
            oldDetailOrder.setId(detailOrder.getId());
            oldDetailOrder.setName(detailOrder.getName());
            oldDetailOrder.setMaterial(detailOrder.getMaterial());
            oldDetailOrder.setTimePacking(detailOrder.getTimePacking());

            List<DetailOrderList> detailOrderLists = detailOrder.getDetailOrderLists();
            List<OldDetailOrderList> oldDetailOrderLists = new ArrayList<>();

            for (DetailOrderList detailOrderList : detailOrderLists) {
                OldDetailOrderList oldDetailOrderList = new OldDetailOrderList();
                oldDetailOrderList.setId(detailOrderList.getId());
                oldDetailOrderList.setSelected(false);
                oldDetailOrderList.setMainOrAlternative(detailOrderList.getMainOrAlternative());

                List<DetailOrderInfo> detailOrderInfos = detailOrderList.getDetailOrderInfos();
                List<OldDetailOrderInfo> oldDetailOrderInfos = new ArrayList<>();

                for (DetailOrderInfo detailOrderInfo : detailOrderInfos) {
                    OldDetailOrderInfo oldDetailOrderInfo = new OldDetailOrderInfo();
                    oldDetailOrderInfo.setId(detailOrderInfo.getId());
                    oldDetailOrderInfo.setComment(detailOrderInfo.getComment());
                    oldDetailOrderInfo.setPriority(detailOrderInfo.getPriority());
                    oldDetailOrderInfo.setSetting(false);
                    oldDetailOrderInfo.setTimeWork(detailOrderInfo.getTimeWork());

                    WorkBench workBenches = detailOrderInfo.getWorkBenches();
                    OldWorkBench oldWorkBench = new OldWorkBench();
                    oldWorkBench.setId(UUID.randomUUID());
                    oldWorkBench.setName(workBenches.getName());
                    oldWorkBench.setCurrentThickness(workBenches.getCurrentThickness());
                    oldWorkBench.setDateEndDetail(workBenches.getDateEndDetail());
                    oldWorkBench.setTypeOperation(workBenches.getTypeOperation());
                    oldWorkBench.setIdWorkbench(workBenches.getId());

                    oldWorkBenchService.saveOldWorkBench(oldWorkBench);
                    oldDetailOrderInfo.setWorkBenches(oldWorkBench);

                    oldDetailOrderInfos.add(oldDetailOrderInfo);
                }

                oldDetailOrderList.setDetailOrderInfos(oldDetailOrderInfos);
                List<DetailDateByWorkbench> detailDateByWorkbenches = detailOrderList.getDetailDateByWorkbench();
                List<OldDetailDateByWorkbench> oldDetailDateByWorkbenches = new ArrayList<>();

                for (DetailDateByWorkbench detailDateByWorkbench : detailDateByWorkbenches) {
                    OldDetailDateByWorkbench oldDetailDateByWorkbench = new OldDetailDateByWorkbench();
                    oldDetailDateByWorkbench.setId(detailDateByWorkbench.getId());
                    oldDetailDateByWorkbench.setDetailDateStart(detailDateByWorkbench.getDetailDateStart());
                    oldDetailDateByWorkbench.setDetailDateEnd(detailDateByWorkbench.getDetailDateEnd());
                    oldDetailDateByWorkbench.setPriority(detailDateByWorkbench.getPriority());
                    oldDetailDateByWorkbench.setSetting(false);
                    oldDetailDateByWorkbench.setWorkBench(detailDateByWorkbench.getWorkBench());
                    oldDetailDateByWorkbenches.add(oldDetailDateByWorkbench);
                }
                oldDetailOrderList.setDetailDateByWorkbench(oldDetailDateByWorkbenches);
                oldDetailOrderLists.add(oldDetailOrderList);
                oldDetailOrderListService.saveOldDetailOrderList(oldDetailOrderList);
            }

            oldDetailOrder.setDetailOrderLists(oldDetailOrderLists);
            oldDetailsOrder.setDetailOrder(oldDetailOrder);
            oldDetailsOrders.add(oldDetailsOrder);
            oldDetailOrderService.saveOldDetailOrder(oldDetailOrder);
        }
        oldOrder.setDetailsOrders(oldDetailsOrders);
        oldOrder.setOrderId(order.getId());
        saveOldOrder(oldOrder);
    }

    public void fillOrderByOldOrder(UUID orderId, Order order) {
        OldOrder oldOrder = oldOrderRepository.findByOrderId(orderId);
        order.setCalculated(false);
        order.setDateStartOrder(null);
        order.setDateEndOrder(null);
        order.setDateStartFirstPackage(null);
        order.setDateEndFirstPackage(null);

        order.setDateStartSecondPackage(null);
        order.setDateEndSecondPackage(null);

        order.setDateStartPainting(null);
        order.setDateEndPainting(null);
        order.setDateEnd(null);

        List<OldDetailsOrder> oldDetailsOrders = oldOrder.getDetailsOrders();
        List<DetailsOrder> detailsOrders = new ArrayList<>();
        for (OldDetailsOrder oldDetailsOrder : oldDetailsOrders) {


            DetailsOrder detailsOrder = new DetailsOrder();
            detailsOrder.setId(oldDetailsOrder.getId());
            detailsOrder.setCount(oldDetailsOrder.getCount());
            detailsOrder.setIncrement(oldDetailsOrder.getIncrement());

            OldDetailOrder oldDetailOrder = oldDetailsOrder.getDetailOrder();
            DetailOrder detailOrder = new DetailOrder();
            detailOrder.setId(oldDetailOrder.getId());
            detailOrder.setName(oldDetailOrder.getName());
            detailOrder.setMaterial(oldDetailOrder.getMaterial());
            detailOrder.setTimePacking(oldDetailOrder.getTimePacking());

            List<OldDetailOrderList> oldDetailOrderLists = oldDetailOrder.getDetailOrderLists();
            List<DetailOrderList> detailOrderLists = new ArrayList<>();

            for (OldDetailOrderList oldDetailOrderList : oldDetailOrderLists) {
                DetailOrderList detailOrderList = new DetailOrderList();
                detailOrderList.setId(oldDetailOrderList.getId());
                detailOrderList.setSelected(false);
                detailOrderList.setMainOrAlternative(oldDetailOrderList.getMainOrAlternative());

                List<OldDetailOrderInfo> oldDetailOrderInfos = oldDetailOrderList.getDetailOrderInfos();
                List<DetailOrderInfo> detailOrderInfos = new ArrayList<>();

                for (OldDetailOrderInfo oldDetailOrderInfo : oldDetailOrderInfos) {
                    DetailOrderInfo detailOrderInfo = new DetailOrderInfo();
                    detailOrderInfo.setId(oldDetailOrderInfo.getId());
                    detailOrderInfo.setComment(oldDetailOrderInfo.getComment());
                    detailOrderInfo.setPriority(oldDetailOrderInfo.getPriority());
                    detailOrderInfo.setSetting(false);
                    detailOrderInfo.setTimeWork(oldDetailOrderInfo.getTimeWork());

                    OldWorkBench oldWorkBench = oldDetailOrderInfo.getWorkBenches();
                    WorkBench workBench = workBenchService.getOneWorkBenchById(oldWorkBench.getIdWorkbench());
                    workBench.setDateEndDetail(oldWorkBench.getDateEndDetail());
                    workBench.setCurrentThickness(oldWorkBench.getCurrentThickness());
                    detailOrderInfo.setWorkBenches(workBench);

                    detailOrderInfos.add(detailOrderInfo);
                }

                detailOrderList.setDetailOrderInfos(detailOrderInfos);
                List<OldDetailDateByWorkbench> oldDetailDateByWorkbenches = oldDetailOrderList.getDetailDateByWorkbench();
                List<DetailDateByWorkbench> detailDateByWorkbenches = new ArrayList<>();

                for (OldDetailDateByWorkbench oldDetailDateByWorkbench : oldDetailDateByWorkbenches) {
                    DetailDateByWorkbench detailDateByWorkbench = new DetailDateByWorkbench();
                    detailDateByWorkbench.setId(oldDetailDateByWorkbench.getId());
                    detailDateByWorkbench.setDetailDateStart(oldDetailDateByWorkbench.getDetailDateStart());
                    detailDateByWorkbench.setDetailDateEnd(oldDetailDateByWorkbench.getDetailDateEnd());
                    detailDateByWorkbench.setPriority(oldDetailDateByWorkbench.getPriority());
                    detailDateByWorkbench.setSetting(false);
                    detailDateByWorkbench.setWorkBench(oldDetailDateByWorkbench.getWorkBench());
                    detailDateByWorkbenches.add(detailDateByWorkbench);
                }
                detailOrderList.setDetailDateByWorkbench(detailDateByWorkbenches);

                detailOrderLists.add(detailOrderList);
                detailOrderListService.saveDetailOrderList(detailOrderList);
            }

            detailOrder.setDetailOrderLists(detailOrderLists);
            detailsOrder.setDetailOrder(detailOrder);
            detailsOrders.add(detailsOrder);
            detailOrderService.saveDetailOrder(detailOrder);

        }
        order.setDetailsOrders(detailsOrders);
        orderService.saveOrder(order);
    }

    public void deleteOldOrder(int numberOrder) {
        oldOrderRepository.delete(oldOrderRepository.findByNumberOrder(numberOrder));
    }


    public void deleteOldOrder(UUID id) {
        OldOrder oldOrder = oldOrderRepository.findById(id).orElse(new OldOrder());

        List<OldDetailsOrder> detailsOrders = oldOrder.getDetailsOrders();
        for (int i = 0; i < detailsOrders.size(); i++) {
            OldDetailOrder detailOrder = detailsOrders.get(i).getDetailOrder();
            List<OldDetailOrderList> detailOrderLists = detailOrder.getDetailOrderLists();
            for (int j = 0; j <detailOrderLists.size() ; j++) {
                OldDetailOrderList oldDetailOrderList = detailOrderLists.get(j);

                for (OldDetailOrderInfo detailOrderInfo : oldDetailOrderList.getDetailOrderInfos()) {
                    OldWorkBench workBenches = detailOrderInfo.getWorkBenches();
                    oldWorkBenchService.deleteOldWorkBench(workBenches);
                }
                oldDetailOrderListService.deleteOldDetailOrderList(oldDetailOrderList);
            }
        }
        oldOrderRepository.delete(oldOrder);
    }
}
