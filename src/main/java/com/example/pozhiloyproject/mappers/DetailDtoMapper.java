package com.example.pozhiloyproject.mappers;

import com.example.pozhiloyproject.dto.DetailDto;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

@Component
public class DetailDtoMapper implements RowMapper<DetailDto> {
    @Override
    public DetailDto mapRow(ResultSet resultSet, int i) throws SQLException {
//        DetailDto detailDto = new DetailDto((UUID) resultSet.getString(1),
//                resultSet.getString(2),
//                resultSet.getArray(3),
//                resultSet.getArray(4),
//                resultSet.getString(5),
//                resultSet.getString(6));
//        return detailDto;
        return null;
    }
}
