package service.impl.service_impl;

import model.service.RentalType;
import repository.iget_type_interface.IRentalTypeRepository;
import repository.impl.service_repository_impl.RentalTypeRepository;
import service.iget_type.IRentalTypeService;

import java.util.List;

public class RentalTypeService implements IRentalTypeService {
    IRentalTypeRepository iRentalTypeRepository = new RentalTypeRepository();
    @Override
    public List<RentalType> getRentalType() {
        return iRentalTypeRepository.getRentalType();
    }
}
