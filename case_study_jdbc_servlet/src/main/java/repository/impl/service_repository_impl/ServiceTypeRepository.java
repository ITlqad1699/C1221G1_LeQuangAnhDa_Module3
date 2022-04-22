package repository.impl.service_repository_impl;

import model.service.ServiceType;
import repository.BaseRepository;
import repository.iget_type_interface.IServiceTypeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceTypeRepository implements IServiceTypeRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_SERVICE_TYPE = "SELECT*FROM loai_dich_vu";
    @Override
    public List<ServiceType> getServiceType() {
        List<ServiceType> serviceTypes = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_SERVICE_TYPE);
            ServiceType serviceType;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                serviceType = new ServiceType();
                serviceType.setServiceTypeId(resultSet.getInt("ma_loai_dich_vu"));
                serviceType.setServiceType(resultSet.getString("ten_loai_dich_vu"));
                serviceTypes.add(serviceType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return serviceTypes;
    }
}
