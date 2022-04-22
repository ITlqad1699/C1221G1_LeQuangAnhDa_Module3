package repository.impl.service_repository_impl;

import model.service.RentalType;
import model.service.Service;
import model.service.ServiceType;
import repository.BaseRepository;
import repository.IServiceRepository;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepository implements IServiceRepository {
    private static final String SELECT_ALL_SERVICE = "SELECT*FROM dich_vu";
    private static final String INSERT_SERVICE_SQL = "INSERT INTO dich_vu" + "  (code_dich_vu,ten_dich_vu, dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,ma_kieu_thue,ma_loai_dich_vu) VALUES " +
            " (?, ?, ?,?,?,?,?,?,?,?,?);";
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<Service> selectAll() {
        List<Service> services = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_ALL_SERVICE);
            Service service;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                service = new Service();
                service.setServiceId(resultSet.getInt("ma_dich_vu"));
                service.setServiceCode(resultSet.getString("code_dich_vu"));
                service.setName(resultSet.getString("ten_dich_vu"));
                service.setArea(resultSet.getDouble("dien_tich"));
                service.setCost(resultSet.getDouble("chi_phi_thue"));
                service.setMaxPeople(resultSet.getInt("so_nguoi_toi_da"));
                service.setRoomStandard(resultSet.getString("tieu_chuan_phong"));
                service.setOther(resultSet.getString("mo_ta_tien_nghi_khac"));
                service.setSwimmingPoolArea(resultSet.getDouble("dien_tich_ho_boi"));
                service.setFloorNum(resultSet.getInt("so_tang"));
                service.setRentalTypeId(resultSet.getInt("ma_kieu_thue"));
                service.setServiceTypeId(resultSet.getInt("ma_loai_dich_vu"));
                services.add(service);
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
        return services;
    }

    @Override
    public void save(Service service) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(INSERT_SERVICE_SQL);
            preparedStatement.setString(1, service.getServiceCode());
            preparedStatement.setString(2, service.getName());
            preparedStatement.setDouble(3,service.getArea());
            preparedStatement.setDouble(4,service.getCost());
            preparedStatement.setInt(5,service.getMaxPeople());
            preparedStatement.setString(6, service.getRoomStandard());
            preparedStatement.setString(7, service.getOther());
            preparedStatement.setDouble(8,service.getSwimmingPoolArea());
            preparedStatement.setInt(9,service.getFloorNum());
            preparedStatement.setInt(10,service.getRentalTypeId());
            preparedStatement.setInt(11,service.getServiceTypeId());
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
    public Service select(Integer id) {
        return null;
    }

    @Override
    public boolean delete(Integer id) throws SQLException {
        return false;
    }

    @Override
    public List<Service> search(String searching) {
        return null;
    }

    @Override
    public void update(Service service) throws SQLException {

    }
}
