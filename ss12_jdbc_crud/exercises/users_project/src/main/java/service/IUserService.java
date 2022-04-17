package service;

import model.User;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IUserService {
    List<User> selectAllUser();

    Map<String, String> saveUser(User user);

    User selectUser(int id);

    Map<String,String> updateUser(User user) throws SQLException;

    void deleteUser(int id) throws SQLException;

    List<User> searchUser(String name);
}
