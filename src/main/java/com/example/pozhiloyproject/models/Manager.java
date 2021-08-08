package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.Collection;
import java.util.List;
import java.util.Set;
import java.util.UUID;

@Entity
@Table(name = "managers")
@Getter
@Setter
public class Manager {

    @Id
    private UUID id;

    private String name;

    private String fio;

    private String lastName;

    private String fio_i_o;



}
