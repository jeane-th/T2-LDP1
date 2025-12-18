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
import java.util.List;
import modelo.Categoria;
import modelo.Pelicula;

/**
 *
 * @author jtafu
 */
@WebServlet(name = "FormularioServlet", urlPatterns = {"/formularioPelicula"})
public class FormularioServlet extends HttpServlet {

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
        request.getRequestDispatcher("formularioPelicula.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("Se ejecuto el POST");
        String id_pelicula = request.getParameter("id_pelicula");
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        int anio_estreno = Integer.parseInt(request.getParameter("anio_estreno"));
        int duracion_minutos = Integer.parseInt(request.getParameter("duracion_minutos"));
        int id_categoria = Integer.parseInt(request.getParameter("id_categoria"));
        String poster_url = request.getParameter("poster_url");
        String banner_url = request.getParameter("banner_url");
        String trailer_url = request.getParameter("trailer_url");

        //Pelicula nuevo = new Pelicula(idCounter, titulo, descripcion, duracion, url_portada, anio, precio_alquiler);
        Pelicula nueva = new Pelicula(
                0,
                titulo,
                descripcion,
                anio_estreno,
                duracion_minutos,
                id_categoria,
                poster_url,
                banner_url,
                trailer_url
        );

        PeliculaDAO dao = new PeliculaDAOImpl();
        //dao.agregar(nueva);
        //lista.add(nuevo);
        //idCounter++;
        System.out.println("Se ejecuto el post" + titulo + descripcion + anio_estreno);

        String idStr = request.getParameter("id_pelicula");

        boolean exito;

        if (idStr == null || idStr.isEmpty()) {
            // INSERT
            exito = dao.agregar(nueva);
        } else {
            // UPDATE
            nueva.setId_pelicula(Integer.parseInt(idStr));
            exito = dao.actualizar(nueva);
        }

        if (exito) {
            request.getSession().setAttribute("mensaje", "La película se registró correctamente");
        } else {
            request.getSession().setAttribute("mensaje", "Error al registrar la película");
        }
        response.sendRedirect("formularioPelicula");
    }
}
