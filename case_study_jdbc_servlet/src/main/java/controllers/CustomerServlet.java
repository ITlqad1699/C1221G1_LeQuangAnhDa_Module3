package controllers;

import model.Customer;
import service.ICustomerService;
import service.impl.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    ICustomerService customerService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createNewCustomer(request, response);
                break;
            case "edit":
                editCustomer(request,response);
                break;
            case "delete":
                try {
                    deleteCustomer(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String birthDay = request.getParameter("birthDay");
        Integer gender = Integer.valueOf(request.getParameter("gender"));
        Integer citizenId = Integer.valueOf(request.getParameter("citizenId"));
        Integer numberPhone = Integer.valueOf(request.getParameter("numberPhone"));
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Integer customerTypeId = Integer.valueOf(request.getParameter("customerTypeId"));
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.selectCustomer(id);
        Map<String, String> map;
        if (customer != null) {
            customer.setName(name);
            customer.setEmail(email);
            customer.setBirthDay(birthDay);
            customer.setGender(gender);
            customer.setCitizenId(citizenId);
            customer.setNumberPhone(numberPhone);
            customer.setAddress(address);
            customer.setCustomerTypeId(customerTypeId);
            map = customerService.updateUser(customer);
            if (map.isEmpty()) {
                response.sendRedirect("/customer");
            } else {
                request.setAttribute("erro", map);
                request.getRequestDispatcher("furama_resort/customer/create.jsp").forward(request, response);
            }
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        customerService.deleteCustomer(id);
        response.sendRedirect("/customer");
    }

    private void createNewCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String birthDay = request.getParameter("birthDay");
        Integer gender = Integer.valueOf(request.getParameter("gender"));
        Integer citizenId = Integer.valueOf(request.getParameter("citizenId"));
        Integer numberPhone = Integer.valueOf(request.getParameter("numberPhone"));
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Integer customerTypeId = Integer.valueOf(request.getParameter("customerTypeId"));
        Integer id = null;
        Customer customer = new Customer(id, name, birthDay, gender, citizenId, numberPhone, email, address, customerTypeId);
        System.out.println(customer);
        Map<String, String> mapCreate = customerService.createCustomer(customer);
        if (mapCreate.isEmpty()) {
            response.sendRedirect("/customer");
        } else {
            request.setAttribute("erro", mapCreate);
            request.getRequestDispatcher("furama_resort/customer/create.jsp").forward(request, response);
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request,response);
                break;
            case "search":
                searchCustomer(request, response);
                break;
            default:
                showListCustomer(request, response);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.selectCustomer(id);
        request.setAttribute("customer",customer);
        request.getRequestDispatcher("furama_resort/customer/edit.jsp").forward(request,response);
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
        String searching = request.getParameter("search");
        List<Customer> customers = customerService.search(searching);
        request.setAttribute("cutomers", customers);
        try {
            request.getRequestDispatcher("furama_resort/customer/customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("furama_resort/customer/create.jsp").forward(request, response);
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customers = customerService.selectAllCustomer();
        request.setAttribute("cutomers", customers);
        try {
            request.getRequestDispatcher("furama_resort/customer/customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
