package controllers;

import model.customer.Customer;
import model.customer.CustomerType;
import service.ICustomerService;
import service.iget_type.ICustomerTypeService;
import service.impl.customer_impl.CustomerService;
import service.impl.customer_impl.CustomerTypeService;
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
    ICustomerTypeService iCustomerTypeService = new CustomerTypeService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createNewCustomer(request, response);
                break;
            case "edit":
                try {
                    editCustomer(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
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

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        String name = request.getParameter("name");
        String birthDay = request.getParameter("birthDay");
        Integer gender = -1;
        Integer customerTypeId = -1;
        try{
            gender = Integer.valueOf(request.getParameter("gender"));
        } catch (NumberFormatException e){
            e.printStackTrace();
        }
        String  numberPhone = request.getParameter("numberPhone");
        String  citizenId = request.getParameter("citizenId");
        try{
            customerTypeId = Integer.valueOf(request.getParameter("customerTypeId"));
        }catch (NumberFormatException e){
            e.printStackTrace();
        }
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int id = Integer.parseInt(request.getParameter("id"));
        String customerCode = request.getParameter("customerCode");
        Customer customer = new Customer(id,name,birthDay,gender,citizenId,numberPhone,email,address,customerTypeId,customerCode);
        Map<String, String> map;
        if (customer != null) {
            map = customerService.updateCustomer(customer);
            if (map.isEmpty()) {
                response.sendRedirect("/customer");
            } else {
                List<CustomerType> customerTypes = iCustomerTypeService.getCustomerType();
                request.setAttribute("customerType", customerTypes);
                request.setAttribute("erro", map);
                request.getRequestDispatcher("view_furama_resort/customer/edit.jsp").forward(request, response);
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
        System.out.println(birthDay);
        Integer gender = -1;
        Integer customerTypeId = -1;
        String  numberPhone = request.getParameter("numberPhone");
        String  citizenId = request.getParameter("citizenId");
        try{
            gender = Integer.valueOf(request.getParameter("gender"));
        } catch (NumberFormatException e){
            e.printStackTrace();
        }

        try{
            customerTypeId = Integer.valueOf(request.getParameter("customerTypeId"));
        }catch (NumberFormatException e){
            e.printStackTrace();
        }
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Integer id = null;
        String customerCode = request.getParameter("customerCode");
        Customer customer = new Customer(id, name, birthDay, gender, citizenId, numberPhone, email, address, customerTypeId,customerCode);
        Map<String, String> mapCreate = customerService.createCustomer(customer);
        if (mapCreate.isEmpty()) {
            response.sendRedirect("/customer");
        } else {
            List<CustomerType> customerTypes = iCustomerTypeService.getCustomerType();
            request.setAttribute("customerType", customerTypes);
            request.setAttribute("erro", mapCreate);
            request.getRequestDispatcher("view_furama_resort/customer/create.jsp").forward(request, response);
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
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
        List<CustomerType> customerTypes = iCustomerTypeService.getCustomerType();
        request.setAttribute("customerType", customerTypes);
        request.setAttribute("customer",customer);
        request.getRequestDispatcher("view_furama_resort/customer/edit.jsp").forward(request,response);
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
        String searching = request.getParameter("search");
        List<Customer> customers = customerService.search(searching);
        request.setAttribute("cutomers", customers);
        try {
            request.getRequestDispatcher("view_furama_resort/customer/customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CustomerType> customerTypes = iCustomerTypeService.getCustomerType();
        request.setAttribute("customerType", customerTypes);
        request.getRequestDispatcher("view_furama_resort/customer/create.jsp").forward(request, response);
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customers = customerService.selectAllCustomer();
        request.setAttribute("cutomers", customers);
        List<CustomerType> customerTypes = iCustomerTypeService.getCustomerType();
        request.setAttribute("customerType", customerTypes);
        try {
            request.getRequestDispatcher("view_furama_resort/customer/customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
