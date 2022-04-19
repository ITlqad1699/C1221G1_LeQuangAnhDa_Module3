package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_resort?useSSL=false";
    private String username = "root";
    private String password = "lqad1699";
    private Connection connection;

    public BaseRepository() {
    }

    public Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL,username,password);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
