package repository.impl;

import model.Customer;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    BaseRepository baseRepository = new BaseRepository();
    private final String SELECT_ALL_CUSTOMERS = "SELECT*FROM khach_hang";
    private final String INSERT_CUSTOMERS_SQL = "INSERT INTO khach_hang" + "  (ho_ten, ngay_sinh, gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) VALUES " +
            " (?, ?, ?,?,?,?,?,?);";
    private final String SELECT_CUSTOMERS_BY_ID = "SELECT*FROM khach_hang WHERE ma_khach_hang=?";
    private final String DELETE_CUSTOMER_SQL = "DELETE FROM khach_hang where ma_khach_hang = ?;";
    private final String SEARCH_CUSTOMER_SQL = "SELECT*FROM khach_hang WHERE ho_ten like ? OR dia_chi like ?";
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

    @Override
    public void save(Customer customer) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(INSERT_CUSTOMERS_SQL);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getBirthDay());
            preparedStatement.setInt(3, customer.getGender());
            preparedStatement.setInt(4, customer.getCitizenId());
            preparedStatement.setInt(5, customer.getNumberPhone());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setInt(8, customer.getCustomerTypeId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public Customer select(Integer id) {
        Customer customer = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_CUSTOMERS_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                customer = new Customer();
                customer.setId(id);
                customer.setName(resultSet.getString("ho_ten"));
                customer.setBirthDay(resultSet.getString("ngay_sinh"));
                customer.setGender(resultSet.getInt("gioi_tinh"));
                customer.setCitizenId(resultSet.getInt("so_cmnd"));
                customer.setNumberPhone(resultSet.getInt("so_dien_thoai"));
                customer.setEmail(resultSet.getString("email"));
                customer.setAddress(resultSet.getString("dia_chi"));
                customer.setCustomerTypeId(resultSet.getInt("ma_loai_khach"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return customer;
    }

    @Override
    public boolean delete(Integer id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = baseRepository.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_CUSTOMER_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public List<Customer> search(String searching) {
        PreparedStatement preparedStatement = null;
        List<Customer> customers = new ArrayList<>();
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SEARCH_CUSTOMER_SQL);
            preparedStatement.setString(1,"%"+searching+"%");
            preparedStatement.setString(2,"%"+searching+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            Customer customer;
            while (resultSet.next()){
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
        }
        return customers;
    }

    @Override
    public boolean update(Customer customer) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = baseRepository.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
}

