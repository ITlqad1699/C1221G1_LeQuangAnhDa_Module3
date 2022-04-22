package service.impl.service_impl;

import model.service.Service;
import repository.IServiceRepository;
import repository.impl.service_repository_impl.ServiceRepository;
import service.IServiceService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceService implements IServiceService {
    IServiceRepository iServiceRepository = new ServiceRepository();

    @Override
    public List<Service> selectAllService() {
        return iServiceRepository.selectAll();
    }

    @Override
    public Map<String, String> createService(Service service) {
        Map<String, String> map = new HashMap<>();
        iServiceRepository.save(service);
        return map;
    }

}
