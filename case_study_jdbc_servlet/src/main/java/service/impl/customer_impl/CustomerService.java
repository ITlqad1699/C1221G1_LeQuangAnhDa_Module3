package service.impl.customer_impl;

import model.customer.Customer;
import repository.ICustomerRepository;
import repository.impl.customer_repository_impl.CustomerRepository;
import service.ICustomerService;

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

public class CustomerService implements ICustomerService {
    ICustomerRepository iCustomerRepository = new CustomerRepository();
    private final String REGEX_CUSTOMER_CODE = "^KH-\\d{4}$";
    private final String REGEX_NUMBER_PHONE = "^((84\\+91)||(84\\+90)||(091)||(090))\\d{7}$";
    private final String REGEX_EMAIL = "^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)$";
    private final String REGEX_CITIZENID = "\\d{9,12}";
    private final String REGEX_NAME = "^\\p{Lu}\\p{Ll}+( \\p{Lu}\\p{Ll}+)*$";
    private final String DATE_TIME_FORMAT_REGEX = "^\\d{4}-\\d{2}-\\d{2}$";

    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customers = iCustomerRepository.selectAll();
        return customers;
    }

    @Override
    public Map<String, String> createCustomer(Customer customer) {
        Map<String, String> error = new HashMap<>();
        if (customer.getName().equals("")) {
            error.put("name", "name is not null");
        } else if (!customer.getName().matches(REGEX_NAME)) {
            error.put("name", "invalid name: ");
        }
        if (customer.getCustomerCode().equals("")) {
            error.put("customerCode", "customer code is not null");
        } else if (!customer.getCustomerCode().matches(REGEX_CUSTOMER_CODE)) {
            error.put("customerCode", "invalid customer code: KH-XXXX ");
        }
        if (customer.getNumberPhone().equals("")) {
            error.put("numberPhone", "number phone is not null");
        } else if (!(customer.getNumberPhone().matches(REGEX_NUMBER_PHONE))) {
            error.put("numberPhone", "invalid number phone: 091(7) or 091(7) or (84)+90(7) or (84)+91(7)");
        }
        if (customer.getCitizenId().equals("")) {
            error.put("citizenId", "citizenId is not null");
        } else if (!customer.getCitizenId().matches(REGEX_CITIZENID)) {
            error.put("citizenId", "invalid citizenId: \n" +
                    "at least 9 numbers\n" +
                    "\n and " +
                    "12 numbers at most");
        }
        if (customer.getEmail().equals("")) {
            error.put("email", "email is not null");
        } else if (!(customer.getEmail().matches(REGEX_EMAIL))) {
            error.put("email", "invalid email: example(lqad123@gmail.com) ");
        }
        if (customer.getBirthDay().equals("")) {
            error.put("birthDay", "birth day is not null");
        } else if (!customer.getBirthDay().matches(DATE_TIME_FORMAT_REGEX)) {
            error.put("birthDay", "invalid day foramt: DD/MM/YYYY");
        } else {
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
            Date birthdayDate = null;
            Date current = new Date();
            try {
                // check date > current date
                birthdayDate = fmt.parse(customer.getBirthDay());
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
        if (error.isEmpty()) {
            iCustomerRepository.save(customer);
        }
        return error;
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
        Map<String, String> error = new HashMap<>();
        if (customer.getName().equals("")) {
            error.put("name", "name is not null");
        } else if (!customer.getName().matches(REGEX_NAME)) {
            error.put("name", "invalid name: ");
        }
        if (customer.getCustomerCode().equals("")) {
            error.put("customerCode", "customer code is not null");
        } else if (!customer.getCustomerCode().matches(REGEX_CUSTOMER_CODE)) {
            error.put("customerCode", "invalid customer code: KH-XXXX ");
        }
        if (customer.getNumberPhone().equals("")) {
            error.put("numberPhone", "number phone i" +
                    "s not null");
        } else if (!(customer.getNumberPhone().matches(REGEX_NUMBER_PHONE))) {
            error.put("numberPhone", "invalid number phone: 091(7) or 091(7) or (84)+90(7) or (84)+91(7)");
        }
        if (customer.getCitizenId().equals("")) {
            error.put("citizenId", "citizenId is not null");
        } else if (!customer.getCitizenId().matches(REGEX_CITIZENID)) {
            error.put("citizenId", "invalid citizenId: \n" +
                    "at least 9 numbers\n" +
                    "\n and " +
                    "12 numbers at most");
        }
        if (customer.getEmail().equals("")) {
            error.put("email", "email is not null");
        } else if (!(customer.getEmail().matches(REGEX_EMAIL))) {
            error.put("email", "invalid email: example(lqad123@gmail.com) ");
        }
        if (customer.getBirthDay().equals("")) {
            error.put("birthDay", "birth day is not null");
        } else if (!customer.getBirthDay().matches(DATE_TIME_FORMAT_REGEX)) {
            error.put("birthDay", "invalid day foramt: DD/MM/YYYY");
        } else {
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
            Date birthdayDate = null;
            Date current = new Date();
            try {
                // check date > current date
                birthdayDate = fmt.parse(customer.getBirthDay());
                if (birthdayDate != null && birthdayDate.compareTo(new Date()) > 0) {
                    error.put("birthDay", "MUST BE PAST ");
                }
                // check age > 18
                OffsetDateTime startOdt = birthdayDate.toInstant().atOffset(ZoneOffset.UTC);
                OffsetDateTime endOdt = current.toInstant().atOffset(ZoneOffset.UTC);
                int years = Period.between(startOdt.toLocalDate(), endOdt.toLocalDate()).getYears();
                System.out.println(years);
                if (years < 18) {
                    error.put("birthDay", "MUST BE > 18 YEAR OLD");
                }
            } catch (ParseException e) {
                e.printStackTrace();
                error.put("birthDay", "invalid day foramt: DD/MM/YYYY");
            }
        }
        if (error.isEmpty()) {
            iCustomerRepository.update(customer);
        }
        return error;
    }

}
