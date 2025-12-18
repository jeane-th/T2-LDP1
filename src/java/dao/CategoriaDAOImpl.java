/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;


import java.util.logging.Logger;
import java.util.logging.Level;
import java.util.List;
import util.Conexion;
import java.sql.*;
import java.util.ArrayList;
import modelo.Categoria;
import modelo.Pelicula;

/**
 *
 * @author jtafu
 */
public class CategoriaDAOImpl implements CategoriaDAO {

    @Override
    public List<Categoria> listar() {
        List<Categoria> lista = new ArrayList<>();
        String sql = "SELECT id_categoria, categoria FROM tb_categoria";

        try (Connection cn = Conexion.getConnection();
             PreparedStatement ps = cn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Categoria c = new Categoria();
                c.setId_categoria(rs.getInt("id_categoria"));
                c.setCategoria(rs.getString("categoria"));
                lista.add(c);
            }
        } catch (Exception e) {
            System.out.println("Error al lista categoria: " + e.getMessage());
        }
        return lista;
    }
}
