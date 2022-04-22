package controllers;

import model.customer.Customer;
import model.customer.CustomerType;
import model.employee.Devision;
import model.employee.Employee;
import model.employee.Level;
import model.employee.Position;
import service.IEmployeeService;
import service.iget_type.IDevisionService;
import service.iget_type.IPositionService;
import service.iget_type.IlevelService;
import service.impl.employee_impl.DevisionService;
import service.impl.employee_impl.EmployeeService;
import service.impl.employee_impl.LevelService;
import service.impl.employee_impl.PositionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    IEmployeeService iEmployeeService = new EmployeeService();
    IlevelService ilevelService = new LevelService();
    IDevisionService iDevisionService = new DevisionService();
    IPositionService iPositionService = new PositionService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createEmployee(request, response);
                break;
            case "edit":
                try {
                    editEmployee(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "delete":
                try {
                    deleteEmployee(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;

        }
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthDay = request.getParameter("birthDay");
        String citizenId = request.getParameter("citizenId");
        Double salary = -1.0;
        try {
            salary = Double.valueOf(request.getParameter("salary"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        String numberPhone = request.getParameter("numberPhone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Integer positionlId = -1;
        try {
            positionlId = Integer.valueOf(request.getParameter("positions"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        Integer levelId = -1;
        try {
            levelId = Integer.valueOf(request.getParameter("levels"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        Integer devisionId = -1;
        try{
            devisionId =  Integer.valueOf(request.getParameter("devisions"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        Employee employee = new Employee(id, name, birthDay, citizenId, salary, numberPhone, email, address, positionlId, levelId, devisionId);
        Map<String, String> map;
        if (employee != null) {
            map = iEmployeeService.updateEmployee(employee);
            if (map.isEmpty()) {
                response.sendRedirect("/employee");
            } else {
                List<Level> levels = ilevelService.getLevel();
                List<Position> positions = iPositionService.getPosition();
                List<Devision> devisions = iDevisionService.getDevision();
                request.setAttribute("levels", levels);
                request.setAttribute("positions", positions);
                request.setAttribute("devisions", devisions);
                request.setAttribute("erro", map);
                request.getRequestDispatcher("view_furama_resort/employee/edit.jsp").forward(request, response);
            }
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        iEmployeeService.deleteEmployee(id);
        response.sendRedirect("/employee");
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Integer id = null;
        String name = request.getParameter("name");
        String birthDay = request.getParameter("birthDay");
        String citizenId = request.getParameter("citizenId");
        Double salary = -1.0;
        try {
            salary = Double.valueOf(request.getParameter("salary"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        String numberPhone = request.getParameter("numberPhone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Integer positionlId = -1;
        try {
            positionlId = Integer.valueOf(request.getParameter("positions"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        Integer levelId = -1;
        try {
           levelId = Integer.valueOf(request.getParameter("levels"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        Integer devisionId = -1;
        try{
            devisionId =  Integer.valueOf(request.getParameter("devisions"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        Employee employee = new Employee(id, name, birthDay, citizenId, salary, numberPhone, email, address, positionlId, levelId, devisionId);
        Map<String, String> mapCreate = iEmployeeService.createEmployee(employee);
        if (mapCreate.isEmpty()) {
            response.sendRedirect("/employee");
        } else {
            List<Level> levels = ilevelService.getLevel();
            List<Position> positions = iPositionService.getPosition();
            List<Devision> devisions = iDevisionService.getDevision();
            request.setAttribute("levels", levels);
            request.setAttribute("positions", positions);
            request.setAttribute("devisions", devisions);
            request.setAttribute("erro", mapCreate);
            request.getRequestDispatcher("view_furama_resort/employee/create.jsp").forward(request, response);
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
                searchEmployee(request, response);
                break;
            default:
                showListEmployee(request, response);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = iEmployeeService.selectEmployee(id);
        List<Level> levels = ilevelService.getLevel();
        List<Position> positions = iPositionService.getPosition();
        List<Devision> devisions = iDevisionService.getDevision();
        request.setAttribute("levels", levels);
        request.setAttribute("positions", positions);
        request.setAttribute("devisions", devisions);
        request.setAttribute("employee",employee);
        request.getRequestDispatcher("view_furama_resort/employee/edit.jsp").forward(request,response);
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) {
        String searchName = request.getParameter("search_name");
        String searchCitizenID = request.getParameter("search_citizen_id");
        String searchNumberPhone = request.getParameter("search_phone_numder");
        List<Employee> employees = iEmployeeService.searhEmployee(searchName,searchCitizenID,searchNumberPhone);
        request.setAttribute("employees", employees);
        try {
            request.getRequestDispatcher("view_furama_resort/employee/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Level> levels = ilevelService.getLevel();
        List<Position> positions = iPositionService.getPosition();
        List<Devision> devisions = iDevisionService.getDevision();
        request.setAttribute("levels", levels);
        request.setAttribute("positions", positions);
        request.setAttribute("devisions", devisions);
        request.getRequestDispatcher("view_furama_resort/employee/create.jsp").forward(request, response);
    }
    private void showListEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employees = iEmployeeService.selectAllEmployee();
        List<Level> levels = ilevelService.getLevel();
        List<Position> positions = iPositionService.getPosition();
        List<Devision> devisions = iDevisionService.getDevision();
        request.setAttribute("levels", levels);
        request.setAttribute("positions", positions);
        request.setAttribute("devisions", devisions);
        request.setAttribute("employees", employees);
        try {
            request.getRequestDispatcher("view_furama_resort/employee/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
