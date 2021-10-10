package com.example.pozhiloyproject.models.completedOrder;

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
public class CompletedDetailOrderInfo {

    @Id
    private UUID id;

    /**
     * Время
     */
    private String timeWork;

    @ManyToOne
    private WorkBench workBenches;

    private String comment;

    private int priority;

    boolean isSetting;

    public static List<CompletedDetailOrderInfo> comparePriority(List<CompletedDetailOrderInfo> detailInfos) {
        Comparator<CompletedDetailOrderInfo> comparator = Comparator.comparing(CompletedDetailOrderInfo::getPriority);
        detailInfos.sort(comparator);
        return detailInfos;
    }
}
