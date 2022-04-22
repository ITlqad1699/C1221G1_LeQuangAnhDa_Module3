package service.impl.customer_impl;

import model.customer.Customer;
import repository.ICustomerRepository;
import repository.impl.customer_repository_impl.CustomerRepository;
import service.ICustomerService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    ICustomerRepository iCustomerRepository = new CustomerRepository();

    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customers = iCustomerRepository.selectAll();
        return customers;
    }

    @Override
    public Map<String, String> createCustomer(Customer customer) {
        Map<String, String> map = new HashMap<>();
        if(customer.getCustomerCode() == null){
            map.put("customerCode","customer code is null");
        }else if(!customer.getCustomerCode().matches("^KH-\\d{4}$")){
            map.put("customerCode","invalid customer code ");
        } else {
            iCustomerRepository.save(customer);
        }
        return map;
    }

    @Override
    public Customer selectCustomer(Integer id) {
        return iCustomerRepository.select(id);
    }

    @Override
    public void deleteCustomer(Integer id) throws SQLException {
            iCustomerRepository.delete(id);
    }

    @Override
    public List<Customer> search(String searching) {
        return iCustomerRepository.search(searching);
    }

    @Override
    public Map<String, String> updateCustomer(Customer customer) throws SQLException {
        Map<String, String> map = new HashMap<>();
        iCustomerRepository.update(customer);
        return map;
    }

}
