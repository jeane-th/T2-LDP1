/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import modelo.Pelicula;

/**
 *
 * @author jtafu
 */
public interface PeliculaDAO {

    boolean agregar(Pelicula p);

    List<Pelicula> listar();

    Pelicula buscar(int id_pelicula);

    boolean actualizar(Pelicula p);

    boolean eliminar(int id_pelicula);

  
}
