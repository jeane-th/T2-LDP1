/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.logging.Logger;
import java.util.logging.Level;
import util.Conexion;
import java.sql.*;
import modelo.Usuario;

/**
 *
 * @author jtafu
 */
public class UsuarioDAOImpl implements UsuarioDAO {

    @Override
    public Usuario autentificar(String usuario, String password) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Usuario u = null;

        try {
            String sql = "SELECT* FROM tb_usuario WHERE usuario=? AND password=?";
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                u = new Usuario(
                        rs.getInt("id_usuario"),
                        rs.getString("usuario"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("rol")
                );
            }

        } catch (Exception ex) {
            System.out.println("Error al validar login: " + ex.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return u;
    }
}
