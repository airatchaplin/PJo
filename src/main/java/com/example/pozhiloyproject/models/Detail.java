package com.example.pozhiloyproject.models;

import java.util.ArrayList;
import javax.persistence.*;
import java.util.List;
import java.util.UUID;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "details")
public class Detail {

  @Id
  @Getter
  @Setter
  UUID id;

  @Getter
  @Setter
  String name;

  @ManyToOne
  @Getter
  @Setter
  Material material;

  @OneToMany
  @Getter
  @Setter
  List<TimeWorkDetail> timeWorkDetails;

  @ManyToMany
  @Getter
  @Setter
  List<WorkBench> workBenches;



  //    @ManyToOne(cascade = CascadeType.ALL)
//    Order order;

//  public UUID getId() {
//    return id;
//  }
//
//  public void setId(UUID id) {
//    this.id = id;
//  }
//
//  public String getName() {
//    return name;
//  }
//
//  public void setName(String name) {
//    this.name = name;
//  }
//
//  public List<WorkBench> getWorkBenches() {
//    return workBenches;
//  }
//
//  public void setWorkBenches(List<WorkBench> workBenches) {
//    this.workBenches = workBenches;
//  }
//
//  public Material getMaterial() {
//    return material;
//  }
//
//  public void setMaterial(Material material) {
//    this.material = material;
//  }
//
//  public List<TimeWorkDetail> getTimeWorkDetails() {
//    return timeWorkDetails;
//  }
//
//  public void setTimeWorkDetails(List<TimeWorkDetail> timeWorkDetails) {
//    this.timeWorkDetails = timeWorkDetails;
//  }
//
//
}
