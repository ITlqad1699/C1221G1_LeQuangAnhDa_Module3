package service.impl.customer_impl;

import model.customer.CustomerType;
import repository.iget_type_interface.ICustomertypeRepository;
import repository.impl.customer_repository_impl.CustomerTypeRepository;
import service.iget_type.ICustomerTypeService;

import java.util.List;

public class CustomerTypeService implements ICustomerTypeService {
    ICustomertypeRepository iCustomertypeRepository = new CustomerTypeRepository();
    @Override
    public List<CustomerType> getCustomerType() {
        return iCustomertypeRepository.getType();
    }
}
