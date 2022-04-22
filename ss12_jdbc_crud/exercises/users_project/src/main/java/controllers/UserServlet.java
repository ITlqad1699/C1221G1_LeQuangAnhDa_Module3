package controllers;

import model.User;
import service.IUserService;
import service.impl.UserService;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

@WebServlet(name = "UserServlet", urlPatterns = {"/users", "/"})
public class UserServlet extends HttpServlet {
    private IUserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createUser(request, response);
                break;
            case "edit":
                try {
                    editUser(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "delete":
                try {
                    deleteUser(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectUser(id);
        userService.deleteUser(id);
        List<User> users = userService.selectAllUser();
        request.setAttribute("listUser", users);
        request.getRequestDispatcher("user/list.jsp").forward(request,response);
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectUser(id);
        Map<String, String> map;
        if (user != null) {
            user.setName(name);
            user.setEmail(email);
            user.setCountry(country);
            map = userService.updateUser(user);
            if (map.isEmpty()) {
                response.sendRedirect("/users");
            } else {
                request.setAttribute("erro", map);
                request.getRequestDispatcher("user/edit.jsp").forward(request, response);
            }
        }
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name, email, country);
        Map<String, String> mapCreate = userService.saveUser(user);
        if (mapCreate.isEmpty()) {
            response.sendRedirect("/users");
        } else {
            request.setAttribute("erro", mapCreate);
            request.getRequestDispatcher("user/create.jsp").forward(request, response);
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
                showEditForm(request, response);
                break;
            case "delele":
                break;
            case "search":
                searchUser(request,response);
                break;
            default:
                showList(request, response);
        }
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        List<User> userList = userService.searchUser(name);
        request.setAttribute("listUser",userList);
        request.getRequestDispatcher("user/list.jsp").forward(request,response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userService.selectUser(id);
        request.setAttribute("user", existingUser);
        request.getRequestDispatcher("user/edit.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("user/create.jsp").forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<User> users = new ArrayList<>();
        users = userService.selectAllUser();
        Collections.sort(users, new Comparator<User>() {
            @Override
            public int compare(User o1, User o2) {
                return o1.getCountry().compareTo(o2.getCountry());
            }
        });
        request.setAttribute("listUser", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
