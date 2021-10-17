package com.example.pozhiloyproject.models.oldOrder;

import com.example.pozhiloyproject.models.detail.DetailOrderList;
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
public class OldDetailOrderList {

    @Id
    UUID id;

    @OneToMany(cascade = CascadeType.ALL)
    List<OldDetailOrderInfo> detailOrderInfos;

    int mainOrAlternative;

    boolean isSelected;

    @OneToMany(cascade = CascadeType.ALL)
    List<OldDetailDateByWorkbench> detailDateByWorkbench;


    public static void compareIsSelectedMainOrAlternative(List<DetailOrderList> detailOrderLists) {
        Comparator<DetailOrderList> comparator = Comparator.comparing(DetailOrderList::getMainOrAlternative);
        detailOrderLists.sort(comparator);
    }

}
