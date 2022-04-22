package repository.impl.service_repository_impl;

import model.service.RentalType;
import repository.BaseRepository;
import repository.iget_type_interface.IRentalTypeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentalTypeRepository implements IRentalTypeRepository {
    private static final String SELECT_RENTAL_TYPE = "SELECT*FROM kieu_thue";
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<RentalType> getRentalType() {
        List<RentalType> rentalTypes = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_RENTAL_TYPE);
            RentalType rentalType;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                rentalType = new RentalType();
                rentalType.setRentalTypeId(resultSet.getInt("ma_kieu_thue"));
                rentalType.setRentalType(resultSet.getString("ten_kieu_thue"));
                rentalTypes.add(rentalType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return rentalTypes;
    }
}
