package service.impl.service_impl;

import model.service.ServiceType;
import repository.iget_type_interface.IServiceTypeRepository;
import repository.impl.service_repository_impl.ServiceTypeRepository;
import service.iget_type.IServiceTypeService;

import java.util.List;

public class ServiceTypeService implements IServiceTypeService {
    IServiceTypeRepository iServiceTypeRepository = new ServiceTypeRepository();

    @Override
    public List<ServiceType> getServiceType() {
        return iServiceTypeRepository.getServiceType();
    }
}
