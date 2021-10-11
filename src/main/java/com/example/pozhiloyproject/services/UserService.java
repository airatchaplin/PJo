package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.Role;
import com.example.pozhiloyproject.models.User;
import com.example.pozhiloyproject.repository.RoleRepository;
import com.example.pozhiloyproject.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Сервис пользователей
 */
@Service
public class UserService implements UserDetailsService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    RoleRepository roleRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("Пользователь не найден");
        }
        return user;
    }

    /**
     * Получение аунтифицированного пользователя
     *
     * @return Ползователь
     */
    public User getUserWeb() {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return getUserById(user.getId());
    }

    /**
     * Сохранение пользователя
     *
     * @param user Ползователь
     */
    public void saveUser(User user) {
        userRepository.save(user);
    }

    /**
     * Получение пользователя по логину
     *
     * @param username Логин
     * @return Ползователь
     */
    public User getByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    /**
     * Получение всех пользователей
     *
     * @return Список всех пользователей
     */
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    /**
     * Получение всех менеджеров
     *
     * @return Список всех менеджеров
     */
    public List<User> getManagers() {
        List<User> users = userRepository.findAll();
        users.removeIf(x -> x.getRoles().get(0).getName().equals("ROLE_ADMIN"));
        return users;
    }

    /**
     * Получение всех экономистов
     *
     * @return Список всех экономистов
     */
    public List<User> getAdmins() {
        List<User> users = userRepository.findAll();
        users.removeIf(x -> x.getRoles().get(0).getName().equals("ROLE_USER"));
        return users;
    }

    /**
     * Обновление права у пользователей
     *
     * @param id   Список идентификаторов пользователей
     * @param role Список обновленных прав
     */
    public void updateRolesAllUsers(List<String> id, List<String> role) {
        User user;
        for (int i = 0; i < id.size(); i++) {
            user = getUserById(UUID.fromString(id.get(i)));
            List<Role> roles = new ArrayList<>();
            roles.add(roleRepository.findByName(role.get(i)));
            user.setRoles(roles);
            userRepository.save(user);
        }
    }

    /**
     * Получение пользователя по id
     *
     * @param id Идентификатор пользователя
     * @return Пользователь
     */
    public User getUserById(UUID id) {
        Optional<User> user = userRepository.findById(id);
        return user.orElse(new User());
    }

    /**
     * Удаление пользователя
     *
     * @param user Пользователь
     */
    public void deleteUser(User user) {
        userRepository.delete(user);
    }

    /**
     * Проверка логина при добавлении поьзователя
     *
     * @param username Логин
     * @return Результат
     */
    public boolean checkUsername(String username) {
        User user = userRepository.findByUsername(username);
        return user != null;
    }
}
