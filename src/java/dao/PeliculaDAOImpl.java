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
import modelo.Pelicula;

/**
 *
 * @author jtafu
 */
public class PeliculaDAOImpl implements PeliculaDAO {

    @Override
    public boolean agregar(Pelicula p) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            String sql = "insert into tb_pelicula (titulo, descripcion, anio_estreno,duracion_minutos,id_categoria,poster_url,banner_url,trailer_url) values (?,?,?,?,?,?,?,?)";
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getTitulo());
            ps.setString(2, p.getDescripcion());
            ps.setInt(3, p.getAnio_estreno());
            ps.setInt(4, p.getDuracion_minutos());
            ps.setInt(5, p.getId_categoria());
            ps.setString(6, p.getPoster_url());
            ps.setString(7, p.getBanner_url());
            ps.setString(8, p.getTrailer_url());
            int filas = ps.executeUpdate();
            return filas > 0;

        } catch (Exception ex) {
            System.out.println("Ocurrio un error al agregar: " + ex.getMessage());
        } finally {
            // siempre se ejecuta
            try {
                con.close();
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(PeliculaDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    @Override
    public List<Pelicula> listar() {
        List<Pelicula> lista = new ArrayList<>();
        String sql = "SELECT p.*, c.categoria "
                + "FROM tb_pelicula p "
                + "JOIN tb_categoria c ON p.id_categoria = c.id_categoria";
        try {
            Connection con = Conexion.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Pelicula p = new Pelicula();
                p.setId_pelicula(rs.getInt("id_pelicula"));
                p.setTitulo(rs.getString("titulo"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setAnio_estreno(rs.getInt("anio_estreno"));
                p.setDuracion_minutos(rs.getInt("duracion_minutos"));
                p.setId_categoria(rs.getInt("id_categoria"));
                p.setPoster_url(rs.getString("poster_url"));
                p.setBanner_url(rs.getString("banner_url"));
                p.setTrailer_url(rs.getString("trailer_url"));
                p.setCategoria(rs.getString("categoria"));
                lista.add(p);
            }
        } catch (Exception e) {
            System.out.println("Error al listar: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public Pelicula buscar(int id_pelicula) {
        String sql = "select * from tb_pelicula where id_pelicula = ?";
        try {
            Connection con = Conexion.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id_pelicula);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Pelicula(
                        rs.getInt("id_pelicula"),
                        rs.getString("titulo"),
                        rs.getString("descripcion"),
                        rs.getInt("anio_estreno"),
                        rs.getInt("duracion_minutos"),
                        rs.getInt("id_categoria"),
                        rs.getString("poster_url"),
                        rs.getString("banner_url"),
                        rs.getString("trailer_url")
                );
            }
        } catch (Exception e) {
            System.out.println("Error al buscar estudiantes: " + e.getMessage());
        }
        return null;
        //throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean actualizar(Pelicula p) {
        //  throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        if (buscar(p.getId_pelicula()) == null) {
            return false;
        }

      String sql = "UPDATE tb_pelicula SET "
        + "titulo=?, descripcion=?, anio_estreno=?, duracion_minutos=?, "
        + "id_categoria=?, poster_url=?, banner_url=?, trailer_url=? "
        + "WHERE id_pelicula=?";

        try (
                Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, p.getTitulo());
            ps.setString(2, p.getDescripcion());
            ps.setInt(3, p.getAnio_estreno());
            ps.setInt(4, p.getDuracion_minutos());
            ps.setInt(5, p.getId_categoria());
            ps.setString(6, p.getPoster_url());
            ps.setString(7, p.getBanner_url());
            ps.setString(8, p.getTrailer_url());
            ps.setInt(9, p.getId_pelicula());


            int filas = ps.executeUpdate();
            return filas > 0;

        } catch (Exception ex) {
            System.out.println("Error al actualizar: " + ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean eliminar(int id_pelicula) {
        //throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        String sql = "DELETE FROM tb_pelicula WHERE id_pelicula = ?";
        try (
                Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id_pelicula);
            int filas = ps.executeUpdate();
            return filas > 0; // true si se eliminó alguna fila

        } catch (SQLException ex) {
            System.out.println("Error al eliminar: " + ex.getMessage());
        }
        return false;
    }
}
    