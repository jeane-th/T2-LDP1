/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import dao.CategoriaDAO;
import dao.CategoriaDAOImpl;
import dao.PeliculaDAO;
import dao.PeliculaDAOImpl;
import modelo.Pelicula;

/**
 *
 * @author jtafu
 */
public class Prueba {

    public static void main(String[] args) {
        PeliculaDAO dao = new PeliculaDAOImpl();
        CategoriaDAO daoCat = new CategoriaDAOImpl();
        //    dao.agregar(new Pelicula(
        //            "Pelicula 2",
        ///            "Lorem impust lorem impust",
     //           2025,
     //           130,
     //           5,
     //           "aaposter_url",
     //           "baaanner_url",
     //           "triaaler_url"
    //    ));
       // dao.listar().forEach(System.out::println);
             System.out.println("Pelicula encontrada: " + dao.buscar(95));

        //  Pelicula actualizar =  new Pelicula (1,
        //  );
        //  if(dao.actualizar(actualizar)){
        //      System.out.println("Actualizacion exitosa: " + dao.buscar(1));
        //   }
        if (dao.eliminar(94)) {
            System.out.println("Se elimino al pelicula 94");
        }
        //dao.listar().forEach(System.out::println);
        daoCat.listar().forEach(System.out::println);
    }
}
