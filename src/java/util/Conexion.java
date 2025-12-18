/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author jtafu
 */
public class Conexion {

    private static final String URL = "jdbc:mysql://switchyard.proxy.rlwy.net:50745/railway";
    private static final String USER = "root";
    private static final String PASSWORD = "UKZauhezRDgatgiafOeZxIhTBzEdGlzo";

    public static Connection getConnection() {
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Se conectó a la base de datos");
        } catch (Exception ex) {
            System.out.println("Error de conexión: " + ex.getMessage());
        }
        return con;
    }
}
