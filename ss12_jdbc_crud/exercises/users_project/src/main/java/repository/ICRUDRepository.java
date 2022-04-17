package repository;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface ICRUDRepository<E> {
    List<E> selectAll();

    void save(E e);

    E select(int id);


    boolean update(User user) throws SQLException;

    boolean delete(int id) throws SQLException;

    List<E> search(String name);
}
