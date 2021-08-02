package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.util.Set;
import java.util.UUID;

@Entity
@Table(name = "roles")
@Getter
@Setter
public class Role implements GrantedAuthority {

    @Id
    private UUID id;

    private String name;

    @Transient
    @ManyToMany(mappedBy = "roles")
    private Set<Manager> users;


    @Override
    public String getAuthority() {
        return getName();
    }
}
