package service;

import model.employee.Employee;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IEmployeeService {
    List<Employee> selectAllEmployee();

    Map<String, String> createEmployee(Employee employee);

    List<Employee> searhEmployee(String searchName, String searchCitizenID, String searchNumberPhone);

    void deleteEmployee(Integer id) throws SQLException;

    Employee selectEmployee(int id);

    Map<String, String> updateEmployee(Employee employee) throws SQLException;
}
