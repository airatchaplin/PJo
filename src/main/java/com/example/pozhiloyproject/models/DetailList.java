package com.example.pozhiloyproject.models;

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
public class DetailList {

    @Id
    UUID id;

    @OneToMany(cascade = CascadeType.ALL)
    List<DetailInfo> detailInfos;

    int mainOrAlternative;

    boolean isSelected;

//    @OneToMany(cascade = CascadeType.ALL)
//    List<DetailDateByWorkbench> detailDateByWorkbench;


    public static void compareIsSelectedMainOrAlternative(List<DetailList> detailLists) {
        Comparator<DetailList> comparator = Comparator.comparing(DetailList::getMainOrAlternative);
        detailLists.sort(comparator);
    }

    public static void removeIf(List<DetailList> detailLists) {
        detailLists.removeIf(x-> !x.isSelected);
    }

}
