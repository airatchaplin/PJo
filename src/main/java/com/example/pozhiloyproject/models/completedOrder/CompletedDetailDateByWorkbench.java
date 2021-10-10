package com.example.pozhiloyproject.models.completedOrder;

import com.example.pozhiloyproject.models.DetailDateByWorkbench;
import com.example.pozhiloyproject.models.WorkBench;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Entity
@Table
@Getter
@Setter
public class CompletedDetailDateByWorkbench {
    @Id
    UUID id;

    @ManyToOne
    WorkBench workBench;

    LocalDateTime detailDateStart;
    LocalDateTime detailDateEnd;
    boolean isSetting;
    int priority;

    public static List<CompletedDetailDateByWorkbench> comparePriority(List<CompletedDetailDateByWorkbench> detailDateByWorkbenches) {
        Comparator<CompletedDetailDateByWorkbench> comparator = Comparator.comparing(CompletedDetailDateByWorkbench::getPriority);
        detailDateByWorkbenches.sort(comparator);
        return detailDateByWorkbenches;
    }

}
