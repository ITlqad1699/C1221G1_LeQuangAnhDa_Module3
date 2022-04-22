package repository.impl.employee_repository_impl;

import model.employee.Position;
import repository.BaseRepository;
import repository.iget_type_interface.IPositionRepository;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostionRepository implements IPositionRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_POSITION = "SELECT*FROM vi_tri";
    @Override
    public List<Position> getPosition() {
        List<Position> positions = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_POSITION);
            Position position;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                position = new Position();
                position.setPositionlId(resultSet.getInt("ma_vi_tri"));
                position.setPosition(resultSet.getString("ten_vi_tri"));
                positions.add(position);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return positions;
        }
    }
}
