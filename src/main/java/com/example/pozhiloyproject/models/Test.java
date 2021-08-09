package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;
import org.aspectj.weaver.ast.ITestVisitor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Getter
@Setter
@Table(name = "test")
public class Test {
    public String test;
    @Id
    public Long id;

}
