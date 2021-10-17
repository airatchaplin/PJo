package com.example.pozhiloyproject.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class DetailOrderListDto {

    UUID id;

    List<DetailOrderInfoDto> detailOrderInfos;

    int mainOrAlternative;

    boolean isSelected;

    List<DetailDateByWorkbenchDto> detailDateByWorkbench;

    public static void compareIsSelectedMainOrAlternative(List<DetailOrderListDto> detailOrderLists) {
        Comparator<DetailOrderListDto> comparator = Comparator.comparing(DetailOrderListDto::getMainOrAlternative);
        detailOrderLists.sort(comparator);
    }

    public static void removeIf(List<DetailOrderListDto> detailOrderLists) {
        detailOrderLists.removeIf(x-> !x.isSelected);
    }
}
