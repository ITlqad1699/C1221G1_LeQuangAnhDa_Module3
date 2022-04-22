package service;

import model.customer.Customer;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<Customer> selectAllCustomer();

    Map<String, String> createCustomer(Customer customer);

    Customer selectCustomer(Integer id);

    void deleteCustomer(Integer id) throws SQLException;

    List<Customer> search(String searching);

    Map<String, String> updateCustomer(Customer customer) throws SQLException;


}
