package service.impl.employee_impl;

import model.employee.Employee;
import repository.IEmployeeRepository;
import repository.impl.employee_repository_impl.EmployeerRepository;
import service.IEmployeeService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeService  implements IEmployeeService {
    IEmployeeRepository iEmployeeRepository = new EmployeerRepository();
    @Override
    public List<Employee> selectAllEmployee() {
        return iEmployeeRepository.selectAll();
    }

    @Override
    public Map<String, String> createEmployee(Employee employee) {
        Map<String, String> map = new HashMap<>();
        iEmployeeRepository.save(employee);
        return map ;
    }

    @Override
    public List<Employee> searhEmployee(String searchName, String searchCitizenID, String searchNumberPhone) {
        return iEmployeeRepository.searchField(searchName,searchCitizenID,searchNumberPhone);
    }

    @Override
    public void deleteEmployee(Integer id) throws SQLException {
        iEmployeeRepository.delete(id);
    }

    @Override
    public Employee selectEmployee(int id) {
        return iEmployeeRepository.select(id);
    }

    @Override
    public Map<String, String> updateEmployee(Employee employee) throws SQLException {
        Map<String, String> map = new HashMap<>();
        iEmployeeRepository.update(employee);
        return map;
    }
}
