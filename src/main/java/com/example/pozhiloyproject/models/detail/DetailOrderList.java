package com.example.pozhiloyproject.models.detail;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Entity
@Table
@Getter
@Setter
public class DetailOrderList {

    @Id
    UUID id;

    @OneToMany(cascade = CascadeType.ALL)
    List<DetailOrderInfo> detailOrderInfos;

    int mainOrAlternative;

    boolean isSelected;

    @OneToMany(cascade = CascadeType.ALL)
    List<DetailDateByWorkbench> detailDateByWorkbench;


    public static void compareIsSelectedMainOrAlternative(List<DetailOrderList> detailOrderLists) {
        Comparator<DetailOrderList> comparator = Comparator.comparing(DetailOrderList::getMainOrAlternative);
        detailOrderLists.sort(comparator);
    }

    public static void removeIf(List<DetailOrderList> detailOrderLists) {
        detailOrderLists.removeIf(x-> !x.isSelected);
    }
}
