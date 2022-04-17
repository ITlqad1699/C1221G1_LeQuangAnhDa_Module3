package service.impl;

import model.User;
import repository.IUsersRepository;
import repository.impl.UsersRepository;
import service.IUserService;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserService implements IUserService {
    IUsersRepository usersRepository = new UsersRepository();

    @Override
    public List<User> selectAllUser() {
        List<User> users = new ArrayList<>();
        users = usersRepository.selectAll();
        return users;
    }

    @Override
    public Map<String, String> saveUser(User user) {
        Map<String, String> map = new HashMap<>();
        if (!user.getName().matches("^[a-zA-Z ]+$")) {
            map.put("name", "Invalid name");
        } else if (!user.getEmail().matches("^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$")) {
            map.put("email", "Invalid email");
        } else if (user.getCountry() == null) {
            map.put("email", "Invalid country");
        } else {
            usersRepository.save(user);
        }
        return map;
    }

    @Override
    public User selectUser(int id) {
        User user = usersRepository.select(id);
        return user;
    }

    @Override
    public Map<String, String> updateUser(User user) throws SQLException {
        Map<String, String> map = new HashMap<>();
        if (!user.getName().matches("^[a-zA-Z ]+$")) {
            map.put("name", "Invalid name");
        } else if (!user.getEmail().matches("^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$")) {
            map.put("email", "Invalid email");
        } else if (user.getCountry() == null) {
            map.put("email", "Invalid country");
        } else {
            usersRepository.update(user);
        }
        return map;
    }

    @Override
    public void deleteUser(int id) throws SQLException {
        usersRepository.delete(id);
    }

    @Override
    public List<User> searchUser(String name) {
        return usersRepository.search(name);
    }
}
