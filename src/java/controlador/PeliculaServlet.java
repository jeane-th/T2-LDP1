/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import dao.CategoriaDAO;
import dao.CategoriaDAOImpl;
import dao.PeliculaDAO;
import dao.PeliculaDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import modelo.Categoria;
import modelo.Pelicula;

/**
 *
 * @author jtafu
 */
@WebServlet(name = "PeliculaServlet", urlPatterns = {"/inicio"})
public class PeliculaServlet extends HttpServlet {

    //private static final List<Pelicula> lista = new ArrayList<>();
    //private static int idCunter = 1;
    //Listar
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PeliculaDAO dao = new PeliculaDAOImpl();
      CategoriaDAO daoCat = new CategoriaDAOImpl();
      
        List<Pelicula> peliculas = dao.listar();
        List<Categoria> categorias = daoCat.listar();

        System.out.println("Se ejecuto el GET");
        //request.setAttribute("listaPeliculas", lista);
        request.setAttribute("listaPeliculas", dao.listar());
        request.setAttribute("listaCategorias", daoCat.listar());
        request.getRequestDispatcher("inicio.jsp").forward(request, response);

    }

    
}
