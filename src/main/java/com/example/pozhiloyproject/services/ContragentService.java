package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.Contragent;
import com.example.pozhiloyproject.repository.ContragentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * Сервис контрагентов
 */
@Service
public class ContragentService {

    /**
     * Репозиторий контрагентов
     */
    @Autowired
    ContragentRepository contragentRepository;

    /**
     * Получить список всех контрагентов
     *
     * @return Список всех контрагентов
     */
    public List<Contragent> getAllContragents() {
        return contragentRepository.findAll();
    }

    /**
     * Получить контрагента по наименованию
     *
     * @param name Наименование контрагента
     * @return Контрагент
     */
    public Contragent getOneContragentByName(String name) {
        return contragentRepository.findByName(name);
    }

    /**
     * Получить контрагента по id
     *
     * @param id Идентификатор контрагента
     * @return Контрагент
     */
    public Contragent getOneContragentById(UUID id) {
        Optional<Contragent> contragent = contragentRepository.findById(id);
        return contragent.orElse(new Contragent());
    }

    /**
     * Сохранение контрагента
     *
     * @param contragent Контрагент
     */
    public void saveContragent(Contragent contragent) {
        contragentRepository.save(contragent);
    }

    /**
     * Удаление контаргента
     *
     * @param contragent Контрагент
     */
    public void deleteContragent(Contragent contragent) {
        contragentRepository.delete(contragent);
    }

    /**
     * Проверка при доавлении контрагента
     *
     * @param name Наименование контрагента
     * @return Результат
     */
    public boolean checkContragent(String name) {
        Contragent findByNameContragent = getOneContragentByName(name);
        return findByNameContragent != null;
    }

    /**
     * Проверка при изменении контрагента
     *
     * @param id   Идентификатор контрагента
     * @param name Наименование контрагента
     * @return Результат
     */
    public boolean checkContragent(UUID id, String name) {
        Contragent currentContragent = getOneContragentById(id);
        Contragent findByNameContragent = getOneContragentByName(name);
        if (currentContragent.equals(findByNameContragent)) {
            return false;
        } else if (findByNameContragent != null && !currentContragent.equals(findByNameContragent)) {
            return true;
        } else if (findByNameContragent == null) {
            return false;
        }
        return false;
    }
}
