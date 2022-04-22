package repository;

import java.sql.SQLException;
import java.util.List;

public interface ICRUDRepository<E> {
    List<E> selectAll();

    void save(E e);

    E select(Integer id);

    boolean delete(Integer id) throws SQLException;

    List<E> search(String searching);

    void update(E e) throws SQLException;

}
