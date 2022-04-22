package service.impl.employee_impl;

import model.employee.Employee;
import repository.IEmployeeRepository;
import repository.impl.employee_repository_impl.EmployeerRepository;
import service.IEmployeeService;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.OffsetDateTime;
import java.time.Period;
import java.time.ZoneOffset;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeService implements IEmployeeService {
    private final String REGEX_NUMBER_PHONE = "^((84\\+91)||(84\\+90)||(091)||(090))\\d{7}$";
    private final String REGEX_EMAIL = "^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)$";
    private final String REGEX_CITIZENID = "\\d{9,12}";
    private final String REGEX_NAME = "^\\p{Lu}\\p{Ll}+( \\p{Lu}\\p{Ll}+)*$";
    private final String DATE_TIME_FORMAT_REGEX = "^\\d{4}-\\d{2}-\\d{2}$";
    IEmployeeRepository iEmployeeRepository = new EmployeerRepository();

    @Override
    public List<Employee> selectAllEmployee() {
        return iEmployeeRepository.selectAll();
    }

    @Override
    public Map<String, String> createEmployee(Employee employee) {
        Map<String, String> error = new HashMap<>();
        if (employee.getName().equals("")) {
            error.put("name", "name is not null");
        } else if (!employee.getName().matches(REGEX_NAME)) {
            error.put("name", "invalid name: ");
        }
        if (employee.getNumberPhone().equals("")) {
            error.put("numberPhone", "number phone is not null");
        } else if (!(employee.getNumberPhone().matches(REGEX_NUMBER_PHONE))) {
            error.put("numberPhone", "invalid number phone: 091(7) or 091(7) or (84)+90(7) or (84)+91(7)");
        }
        if (employee.getCitizenId().equals("")) {
            error.put("citizenId", "citizenId is not null");
        } else if (!employee.getCitizenId().matches(REGEX_CITIZENID)) {
            error.put("citizenId", "invalid citizenId: \n" +
                    "at least 9 numbers\n" +
                    "\n and " +
                    "12 numbers at most");
        }
        if (employee.getEmail().equals("")) {
            error.put("email", "email is not null");
        } else if (!(employee.getEmail().matches(REGEX_EMAIL))) {
            error.put("email", "invalid email: example(lqad123@gmail.com) ");
        }
        if (employee.getSalary() < 0) {
            error.put("salary", "salary must be positive");
        }
        if (employee.getBirthDay().equals("")) {
            error.put("birthDay", "birth day is not null");
        } else if (!employee.getBirthDay().matches(DATE_TIME_FORMAT_REGEX)) {
            error.put("birthDay", "invalid day foramt: DD/MM/YYYY");
        } else {
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
            Date birthdayDate = null;
            Date current = new Date();
            try {
                // check date > current date
                birthdayDate = fmt.parse(employee.getBirthDay());
                if (birthdayDate != null && birthdayDate.compareTo(new Date()) > 0) {
                    error.put("birthDay", "must be past");
                }
                // check age > 18
                OffsetDateTime startOdt = birthdayDate.toInstant().atOffset(ZoneOffset.UTC);
                OffsetDateTime endOdt = current.toInstant().atOffset(ZoneOffset.UTC);
                int years = Period.between(startOdt.toLocalDate(), endOdt.toLocalDate()).getYears();
                System.out.println(years);
                if (years < 18) {
                    error.put("birthDay", "must be > 18 year old");
                }
            } catch (ParseException e) {
                e.printStackTrace();
                error.put("birthDay", "invalid day foramt: DD/MM/YYYY");
            }
        }
        if (employee.getAddress().equals("")) {
            error.put("address", "address is not null");
        }
        if (error.isEmpty()) {
            iEmployeeRepository.save(employee);
        }
        return error;
    }

    @Override
    public List<Employee> searhEmployee(String searchName, String searchCitizenID, String searchNumberPhone) {
        return iEmployeeRepository.searchField(searchName, searchCitizenID, searchNumberPhone);
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
        Map<String, String> error = new HashMap<>();
        if (employee.getName().equals("")) {
            error.put("name", "name is not null");
        } else if (!employee.getName().matches(REGEX_NAME)) {
            error.put("name", "invalid name: ");
        }
        if (employee.getNumberPhone().equals("")) {
            error.put("numberPhone", "number phone is not null");
        } else if (!(employee.getNumberPhone().matches(REGEX_NUMBER_PHONE))) {
            error.put("numberPhone", "invalid number phone: 091(7) or 091(7) or (84)+90(7) or (84)+91(7)");
        }
        if (employee.getCitizenId().equals("")) {
            error.put("citizenId", "citizenId is not null");
        } else if (!employee.getCitizenId().matches(REGEX_CITIZENID)) {
            error.put("citizenId", "invalid citizenId: \n" +
                    "at least 9 numbers\n" +
                    "\n and " +
                    "12 numbers at most");
        }
        if (employee.getEmail().equals("")) {
            error.put("email", "email is not null");
        } else if (!(employee.getEmail().matches(REGEX_EMAIL))) {
            error.put("email", "invalid email: example(lqad123@gmail.com) ");
        }
        if (employee.getSalary() < 0) {
            error.put("salary", "salary must be positive");
        }
        if (employee.getBirthDay().equals("")) {
            error.put("birthDay", "birth day is not null");
        } else if (!employee.getBirthDay().matches(DATE_TIME_FORMAT_REGEX)) {
            error.put("birthDay", "invalid day foramt: DD/MM/YYYY");
        } else {
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
            Date birthdayDate = null;
            Date current = new Date();
            try {
                // check date > current date
                birthdayDate = fmt.parse(employee.getBirthDay());
                if (birthdayDate != null && birthdayDate.compareTo(new Date()) > 0) {
                    error.put("birthDay", "must be past");
                }
                // check age > 18
                OffsetDateTime startOdt = birthdayDate.toInstant().atOffset(ZoneOffset.UTC);
                OffsetDateTime endOdt = current.toInstant().atOffset(ZoneOffset.UTC);
                int years = Period.between(startOdt.toLocalDate(), endOdt.toLocalDate()).getYears();
                System.out.println(years);
                if (years < 18) {
                    error.put("birthDay", "must be > 18 year old");
                }
            } catch (ParseException e) {
                e.printStackTrace();
                error.put("birthDay", "invalid day foramt: DD/MM/YYYY");
            }
        }
        if (employee.getAddress().equals("")) {
            error.put("address", "address is not null");
        }
        if (error.isEmpty()) {
            iEmployeeRepository.update(employee);
        }
        return error;
    }
}
