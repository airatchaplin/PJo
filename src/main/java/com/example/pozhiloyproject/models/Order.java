package com.example.pozhiloyproject.models;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;
import java.util.UUID;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    private UUID id;
    private int numberOrder;
    @ManyToOne
    private Contragent objectName;
    @ManyToOne
    private Manager manager;

    @ManyToMany(cascade = CascadeType.ALL)
    private List<DetailInfo> detailInfos;


    private LocalDateTime dateStart;
    private LocalDateTime dateEnd;

    private String comment;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public int getNumberOrder() {
        return numberOrder;
    }

    public void setNumberOrder(int numberOrder) {
        this.numberOrder = numberOrder;
    }

    public Contragent getObjectName() {
        return objectName;
    }

    public void setObjectName(Contragent objectName) {
        this.objectName = objectName;
    }

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }

    public List<DetailInfo> getDetailInfos() {
        return detailInfos;
    }

    public void setDetailInfos(List<DetailInfo> detailInfos) {
        this.detailInfos = detailInfos;
    }

    public LocalDateTime getDateStart() {
        return dateStart;
    }

    public LocalDateTime getDateEnd() {
        return dateEnd;
    }

    public void setDateStart(LocalDateTime dateStart) {
        this.dateStart = dateStart;
    }

    public void setDateEnd(LocalDateTime dateEnd) {
        this.dateEnd = dateEnd;
    }





    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
