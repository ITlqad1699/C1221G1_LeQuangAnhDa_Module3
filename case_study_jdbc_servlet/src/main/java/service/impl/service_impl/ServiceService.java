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
        Map<String, String> erro = new HashMap<>();
        if(service.getServiceCode().equals("")){
            erro.put("serviceCode","service code is not null");
        } else if(!service.getServiceCode().matches("^DV-\\d{4}$")){
            erro.put("serviceCode","invalid service code");
        }
        if(service.getArea()<0){
            erro.put("area","area must be positive");
        }
        if(service.getFloorNum()<0){
            erro.put("floorNum","numbers of floor must be positive");
        }
        if(service.getSwimmingPoolArea()<0){
            erro.put("swimmingPoolArea","swimmingPoolArea must be positive");
        }
        if(service.getCost()<0){
            erro.put("cost","cost must be positive");
        }
        if(service.getMaxPeople()<0){
            erro.put("maxPeople", " number of people must be positive");
        }
        if(erro.isEmpty()){
            iServiceRepository.save(service);
        }
        return erro;
    }

}
