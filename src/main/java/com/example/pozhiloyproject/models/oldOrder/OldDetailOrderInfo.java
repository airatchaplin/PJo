package com.example.pozhiloyproject.models.oldOrder;

import com.example.pozhiloyproject.models.DetailInfo;
import com.example.pozhiloyproject.models.WorkBench;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Entity
@Table
@Getter
@Setter
public class OldDetailOrderInfo {

    @Id
    private UUID id;

    /**
     * Время
     */
    private String timeWork;

    @ManyToOne
    private OldWorkBench workBenches;

    private String comment;

    private int priority;

    boolean isSetting;

    public static List<DetailInfo> comparePriority(List<DetailInfo> detailInfos) {
        Comparator<DetailInfo> comparator = Comparator.comparing(DetailInfo::getPriority);
        detailInfos.sort(comparator);
        return detailInfos;
    }
}
