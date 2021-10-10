package com.example.pozhiloyproject.helper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component
public class Db {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public void execute(String sql){
        try {
            jdbcTemplate.execute(sql);
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
    }

    public List<Map<String, Object>> call(String sql){
        List<Map<String, Object>> maps = new ArrayList<>();
        try {
             maps = jdbcTemplate.queryForList(sql);
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
        return maps;
    }

}
