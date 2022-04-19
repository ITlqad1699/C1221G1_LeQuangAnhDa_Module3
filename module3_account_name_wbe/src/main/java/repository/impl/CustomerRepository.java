package repository.impl;

import model.Customer;
import repository.BaseRepository;
import repository.ICustomerRepository;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
        BaseRepository baseRepository = new BaseRepository();
        private final String SELECT_ALL_CUSTOMERS = "SELECT*FROM khach_hang";
    @Override
    public List<Customer> selectAll() {
        List<Customer> customers = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_ALL_CUSTOMERS);
            Customer customer;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                customer = new Customer();
                customer.setId(resultSet.getInt("ma_khach_hang"));
                customer.setName(resultSet.getString("ho_ten"));
                customer.setBirthDay(resultSet.getString("ngay_sinh"));
                customer.setGender(resultSet.getInt("gioi_tinh"));
                customer.setCitizenId(resultSet.getInt("so_cmnd"));
                customer.setNumberPhone(resultSet.getInt("so_dien_thoai"));
                customer.setEmail(resultSet.getString("email"));
                customer.setAddress(resultSet.getString("dia_chi"));
                customer.setCustomerTypeId(resultSet.getInt("ma_loai_khach"));
                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return customers;
    }
}
