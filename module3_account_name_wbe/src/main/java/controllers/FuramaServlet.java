package controllers;

import model.Customer;
import service.impl.CustomerService;
import service.ICustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FuramaServlet",urlPatterns = {"/furama","/"})
public class FuramaServlet extends HttpServlet {
    ICustomerService customerService = new CustomerService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "customer":
                break;
            case "employee":
                break;
            case "contract":
                break;
            case "service":
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "customer":
                    showListCustomer(request,response);
                break;
            case "employee":
                break;
            case "contract":
                break;
            case "service":
                break;
            default:
                request.getRequestDispatcher("furama_resort/list.jsp").forward(request,response);
        }
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customers = customerService.selectAllCustomer();
        request.setAttribute("cutomers",customers);
        try {
            request.getRequestDispatcher("furama_resort/view_customer.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
