package repository.impl.employee_repository_impl;

import model.employee.Employee;
import repository.BaseRepository;
import repository.IEmployeeRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeerRepository implements IEmployeeRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_ALL_EMPLOYEES = "SELECT*FROM nhan_vien";
    private static final String INSERT_INTO_EMPLOYEE = "insert into nhan_vien "  + "(ho_ten, ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) VALUES " +
            "(?, ?, ?,?,?,?,?,?,?,?);";
    private static final String DELETE_EMPLOYEE_SQL = "DELETE FROM nhan_vien where ma_nhan_vien = ?;";
    private static final String SELECT_EMPLOYEE_BY_ID = "SELECT*FROM nhan_vien where ma_nhan_vien = ?; ";
    private static final String UPDATE_EMPLOYEE_SQL = "UPDATE nhan_vien SET ho_ten =?,ngay_sinh=?,so_cmnd=?,luong=?,so_dien_thoai=?,email=?,dia_chi=?,ma_vi_tri=?,ma_trinh_do=?,ma_bo_phan=? where ma_nhan_vien=?;";
    private static final  String SEARCH_EMPLOYEE = "SELECT*FROM nhan_vien where ho_ten like ? and  so_cmnd like ? and so_dien_thoai like ? ";
    @Override
    public List<Employee> selectAll() {
        List<Employee> employees = new ArrayList<>();
        PreparedStatement preparedStatement= null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_ALL_EMPLOYEES);
            Employee employee = null;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                employee = new Employee();
                employee.setId(resultSet.getInt("ma_nhan_vien"));
                employee.setName(resultSet.getString("ho_ten"));
                employee.setBirthDay(resultSet.getString("ngay_sinh"));
                employee.setCitizenId(resultSet.getString("so_cmnd"));
                employee.setSalary(resultSet.getDouble("luong"));
                employee.setNumberPhone(resultSet.getString("so_dien_thoai"));
                employee.setEmail(resultSet.getString("email"));
                employee.setAddress(resultSet.getString("dia_chi"));
                employee.setPositionlId(resultSet.getInt("ma_vi_tri"));
                employee.setLevelId(resultSet.getInt("ma_trinh_do"));
                employee.setDevisionId(resultSet.getInt("ma_bo_phan"));
                employees.add(employee);
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
        return employees;
    }

    @Override
    public void save(Employee employee) {
            PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(INSERT_INTO_EMPLOYEE);
            preparedStatement.setString(1,employee.getName());
            preparedStatement.setString(2,employee.getBirthDay());
            preparedStatement.setString(3,employee.getCitizenId());
            preparedStatement.setDouble(4,employee.getSalary());
            preparedStatement.setString(5,employee.getNumberPhone());
            preparedStatement.setString(6,employee.getEmail());
            preparedStatement.setString(7,employee.getAddress());
            preparedStatement.setInt(8,employee.getPositionlId());
            preparedStatement.setInt(9,employee.getLevelId());
            preparedStatement.setInt(10,employee.getDevisionId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public Employee select(Integer id) {
        Employee employee = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_EMPLOYEE_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                employee = new Employee();
                employee.setId(id);
                employee.setName(resultSet.getString("ho_ten"));
                employee.setBirthDay(resultSet.getString("ngay_sinh"));
                employee.setCitizenId(resultSet.getString("so_cmnd"));
                employee.setSalary(resultSet.getDouble("luong"));
                employee.setNumberPhone(resultSet.getString("so_dien_thoai"));
                employee.setEmail(resultSet.getString("email"));
                employee.setAddress(resultSet.getString("dia_chi"));
                employee.setPositionlId(resultSet.getInt("ma_vi_tri"));
                employee.setLevelId(resultSet.getInt("ma_trinh_do"));
                employee.setDevisionId(resultSet.getInt("ma_bo_phan"));
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
        return employee;
    }

    @Override
    public boolean delete(Integer id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = baseRepository.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_EMPLOYEE_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public List<Employee> search(String searching) {
        return null;
    }

    @Override
    public void update(Employee employee) throws SQLException {
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE_SQL);) {
            preparedStatement.setString(1,employee.getName());
            preparedStatement.setString(2,employee.getBirthDay());
            preparedStatement.setString(3,employee.getCitizenId());
            preparedStatement.setDouble(4,employee.getSalary());
            preparedStatement.setString(5,employee.getNumberPhone());
            preparedStatement.setString(6,employee.getEmail());
            preparedStatement.setString(7,employee.getAddress());
            preparedStatement.setInt(8,employee.getPositionlId());
            preparedStatement.setInt(9,employee.getLevelId());
            preparedStatement.setInt(10,employee.getDevisionId());
            preparedStatement.setInt(11,employee.getId());
            preparedStatement.executeUpdate();
        }

    }

    @Override
    public List<Employee> searchField(String searchName, String searchCitizenID, String searchNumberPhone) {
        PreparedStatement preparedStatement = null;
        List<Employee> employees = new ArrayList<>();
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SEARCH_EMPLOYEE);
            preparedStatement.setString(1, "%" + searchName + "%");
            preparedStatement.setString(2, "%" + searchCitizenID + "%");
            preparedStatement.setString(3, "%" + searchNumberPhone + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            Employee employee;
            while (resultSet.next()) {
                employee = new Employee();
                employee.setId(resultSet.getInt("ma_nhan_vien"));
                employee.setName(resultSet.getString("ho_ten"));
                employee.setBirthDay(resultSet.getString("ngay_sinh"));
                employee.setCitizenId(resultSet.getString("so_cmnd"));
                employee.setSalary(resultSet.getDouble("luong"));
                employee.setNumberPhone(resultSet.getString("so_dien_thoai"));
                employee.setEmail(resultSet.getString("email"));
                employee.setAddress(resultSet.getString("dia_chi"));
                employee.setPositionlId(resultSet.getInt("ma_vi_tri"));
                employee.setLevelId(resultSet.getInt("ma_trinh_do"));
                employee.setDevisionId(resultSet.getInt("ma_bo_phan"));
                employees.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return employees;
    }
}
