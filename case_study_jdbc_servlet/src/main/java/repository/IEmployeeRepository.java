package repository;

import model.employee.Employee;

import java.util.List;

public interface IEmployeeRepository  extends ICRUDRepository<Employee>{

    List<Employee> searchField(String searchName, String searchCitizenID, String searchNumberPhone);
}
