package com.example.pozhiloyproject.models.completedOrder;

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
public class CompletedDetailOrderList {
    @Id
    UUID id;

    @OneToMany(cascade = CascadeType.ALL)
    List<CompletedDetailOrderInfo> detailOrderInfos;

    int mainOrAlternative;

    boolean isSelected;

    @OneToMany(cascade = CascadeType.ALL)
    List<CompletedDetailDateByWorkbench> detailDateByWorkbench;

    public static void compareIsSelectedMainOrAlternative(List<CompletedDetailOrderList> detailOrderLists) {
        Comparator<CompletedDetailOrderList> comparator = Comparator.comparing(CompletedDetailOrderList::getMainOrAlternative);
        detailOrderLists.sort(comparator);
    }

    public static void removeIf(List<CompletedDetailOrderList> detailOrderLists) {
        detailOrderLists.removeIf(x-> !x.isSelected);
    }
}
