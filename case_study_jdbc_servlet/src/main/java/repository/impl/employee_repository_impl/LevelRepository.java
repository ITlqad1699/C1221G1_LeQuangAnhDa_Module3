package repository.impl.employee_repository_impl;

import model.employee.Level;
import repository.BaseRepository;
import repository.iget_type_interface.ILevelRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LevelRepository implements ILevelRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_LEVEL = "SELECT*FROM trinh_do";

    @Override
    public List<Level> getLevel() {
        List<Level> levels = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_LEVEL);
            Level level;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                level = new Level();
                level.setLevelId(resultSet.getInt("ma_trinh_do"));
                level.setLevel(resultSet.getString("ten_trinh_do"));
                levels.add(level);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return levels;
        }
    }
}