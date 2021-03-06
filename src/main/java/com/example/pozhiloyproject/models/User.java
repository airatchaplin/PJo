package com.example.pozhiloyproject.models;

import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

/**
 * Пользователь
 */
@Entity
@Table(name = "users")
@Getter
@Setter
public class User implements UserDetails {

    /**
     * Id
     */
    @Id
    private UUID id;

    /**
     * Имя
     */
    private String name;

    /**
     * Фамилия
     */
    private String fio;

    /**
     * Отчество
     */
    private String lastName;

    /**
     * Фамилия И.О.
     */
    private String fio_i_o;

    /**
     * Логин
     */
    String username;

    /**
     * Пароль
     */
    String password;

    /**
     * Фильтр страницы деталей
     */
    String filter_details;

    /**
     * Фильтр страницы станков
     */
    String filter_workbenches;

    @ManyToMany(fetch = FetchType.EAGER)
    private List<Role> roles;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

}
