package service;

import model.service.RentalType;
import model.service.Service;
import model.service.ServiceType;

import java.util.List;
import java.util.Map;

public interface IServiceService {
    List<Service> selectAllService();

    Map<String, String> createService(Service service);
}
