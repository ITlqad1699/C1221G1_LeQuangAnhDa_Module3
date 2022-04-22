package repository.impl.customer_repository_impl;

import model.customer.CustomerType;
import repository.BaseRepository;
import repository.iget_type_interface.ICustomertypeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements ICustomertypeRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final  String SELECT_ALL_CUSTOMER_TYPE ="SELECT*FROM loai_khach";
    @Override
    public List<CustomerType> getType() {
        List<CustomerType> customerTypes = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_ALL_CUSTOMER_TYPE);
            CustomerType customerType;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                customerType = new CustomerType();
                customerType.setCustomerTypeId(resultSet.getInt("ma_loai_khach"));
                customerType.setCustomerType(resultSet.getString("ten_loai_khach"));
                customerTypes.add(customerType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerTypes;
    }
}
