package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.util.Set;
import java.util.UUID;

/**
 * Права
 */
@Entity
@Table(name = "roles")
@Getter
@Setter
public class Role implements GrantedAuthority {

    /**
     * Id
     */
    @Id
    private UUID id;

    /**
     * Наименование
     */
    private String name;

    /**
     * Список прав
     */
    @Transient
    @ManyToMany(mappedBy = "roles")
    private Set<User> users;

    /**
     * Права
     */
    @Override
    public String getAuthority() {
        return getName();
    }
}
