package repository.impl.employee_repository_impl;

import model.employee.Devision;
import model.employee.Position;
import repository.BaseRepository;
import repository.iget_type_interface.IDevisionRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DevisionRepository implements IDevisionRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_DEVISION = "SELECT*FROM bo_phan";
    @Override
    public List<Devision> getDevision() {
        List<Devision> devisions = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_DEVISION);
            Devision devision;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                devision = new Devision();
                devision.setDevisionId(resultSet.getInt("ma_bo_phan"));
                devision.setDevision(resultSet.getString("ten_bo_phan"));
                devisions.add(devision);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return devisions;
        }
    }
}
