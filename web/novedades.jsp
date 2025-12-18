<%-- 
    Document   : novedades
    Created on : 14 dic 2025, 10:53:47 a.m.
    Author     : jtafu
--%>


<%@page import="dao.PeliculaDAOImpl"%>
<%@page import="dao.PeliculaDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Pelicula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/flowbite@4.0.1/dist/flowbite.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <title>Inicio </title>
    <style>
        .no-scrollbar::-webkit-scrollbar {
            display: none;
        }
        .no-scrollbar {
            scrollbar-width: none;
        }
    </style>
</head>
<body class="bg-slate-950">
    <%
        PeliculaDAO dao = new PeliculaDAOImpl();
        List<Pelicula> peliculas = dao.listar();
    %>

      <header class="">
        <%
            Usuario u = (Usuario) session.getAttribute("usuario");
            if (u == null) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <nav class="bg-slate-900 text-purple-300 fixed w-full z-50 top-0 start-0 border-default">
            <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
                <a href="#" class="flex items-center space-x-3 rtl:space-x-reverse">
                    <span class="self-center text-3xl text-heading font-semibold whitespace-nowrap text-purple-600">MovieApp</span>
                </a>
                <div class="flex items-center md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
                    <button type="button" class="flex text-sm bg-neutral-primary rounded-full md:me-0" id="user-menu-button" aria-expanded="false" data-dropdown-toggle="user-dropdown" data-dropdown-placement="bottom">
                        <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-user-round-icon lucide-circle-user-round"><path d="M18 20a6 6 0 0 0-12 0"/><circle cx="12" cy="10" r="4"/><circle cx="12" cy="12" r="10"/></svg>                    <!-- Dropdown menu -->
                        <div class="z-50 hidden bg-slate-900 shadow-lg w-44" id="user-dropdown">
                            <div class="px-4 py-3 text-sm border-b-1 border-purple-200/50">
                                <span class="block text-heading font-medium"><%=u.getUsuario()%></span>
                            </div>
                            <ul class="p-2 text-sm text-body font-medium" aria-labelledby="user-menu-button">
                                <li>
                                    <a href="#" class="inline-flex items-center w-full p-2 hover:bg-slate-800 hover:text-purple-200 rounded">Perfil</a>
                                </li>
                                <% if ("admin".equalsIgnoreCase(u.getRol())) {%>
                                <li>
                                    <a href="formularioPelicula" class="bg-purple-600 text-white inline-flex items-center w-full p-2 hover:bg-purple-700 hover:text-purple-200 rounded">
                                        Administrador
                                    </a>
                                </li>
                                <% } %>
                                <li>
                                    <a href="#" class="inline-flex items-center w-full p-2 hover:bg-slate-800 hover:text-purple-200 rounded">Cerrar sesión</a>
                                </li>
                            </ul>
                        </div>
                        <button data-collapse-toggle="navbar-user" type="button" class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-body rounded-base md:hidden hover:bg-neutral-secondary-soft hover:text-heading focus:outline-none focus:ring-2 focus:ring-neutral-tertiary" aria-controls="navbar-user" aria-expanded="false">
                            <span class="sr-only">Open main menu</span>

                            <svg class="w-6 h-6" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M5 7h14M5 12h14M5 17h14"/></svg>
                        </button>
                </div>
                <div class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1" id="navbar-user">
                    <ul class="font-medium flex flex-col p-4 md:p-0 mt-4 border border-default rounded-base bg-neutral-secondary-soft md:flex-row md:space-x-8 rtl:space-x-reverse md:mt-0 md:border-0 md:bg-neutral-primary">
                        <li>
                            <a href="#" class="block py-2 px-3 text-white bg-brand rounded md:bg-transparent md:text-fg-brand md:p-0" aria-current="page">Inicio</a>
                        </li>
                        <li>
                            <a href="novedades.jsp?tipo=novedades"class="block py-2 px-3 text-heading rounded hover:bg-neutral-tertiary md:hover:bg-transparent md:border-0 md:hover:text-fg-brand md:p-0 md:dark:hover:bg-transparent">Novedades</a>

                        </li>
                        <li>
                            <button id="dropdownNvbarButton" data-dropdown-toggle="dropdownNavbar" class="flex items-center justify-between w-full py-2 px-3 rounded font-medium text-heading md:w-auto hover:bg-neutral-tertiary md:hover:bg-transparent md:border-0 md:hover:text-fg-brand md:p-0">
                                Categorias 
                                <svg class="w-4 h-4 ms-1.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 9-7 7-7-7"/></svg>
                            </button>
                            <!-- Dropdown menu -->
                            <div id="dropdownNavbar" class="z-10 hidden bg-neutral-primary-medium bg-slate-900 shadow-lg w-44">
                                <ul class="p-2 text-sm text-body font-medium" aria-labelledby="dropdownNvbarButton">
                                    <%
                                        List<Categoria> categorias
                                                = (List<Categoria>) request.getAttribute("listaCategorias");

                                        if (categorias != null) {
                                            for (Categoria c : categorias) {
                                    %>
                                    <li>
                                        <a href="novedades.jsp?categoria=<%= c.getId_categoria()%>"
                                           class="inline-flex items-center w-full p-2 hover:bg-neutral-tertiary-medium hover:text-heading rounded">
                                            <%= c.getCategoria()%>
                                        </a>

                                    </li>

                                    <%
                                            }
                                        }
                                    %>

                                </ul>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>

    </header>


        <%
            String tipo = request.getParameter("tipo");
            String categoriaParam = request.getParameter("categoria");

            List<Pelicula> peliculasFiltradas = new ArrayList<>();
            String tituloSeccion = "Películas";
        %>

        <%
            if ("novedades".equals(tipo)) {
                tituloSeccion = "Novedades";

                for (Pelicula pel : peliculas) {
                    if (pel.getAnio_estreno() == 2025) {
                        peliculasFiltradas.add(pel);
                    }
                }
            } else if (categoriaParam != null) {
                int idCategoria = Integer.parseInt(categoriaParam);

                for (Pelicula pel : peliculas) {
                    if (pel.getId_categoria() == idCategoria) {
                        peliculasFiltradas.add(pel);
                        tituloSeccion = pel.getCategoria(); // nombre visible
                    }
                }
            }
        %>

    <main class="pt-16">



        <%
            List<Pelicula> peliculasNovedades = new ArrayList<>();

            if (peliculas != null) {
                for (Pelicula pel : peliculas) {
                    if (pel.getAnio_estreno() == 2025) {
                        peliculasNovedades.add(pel);
                    }
                }
            }
        %>


        <div class="text-white ">
            <h2 class="text-3xl font-bold px-20 py-10">
                <%= tituloSeccion%>
            </h2>

            <div class="carousel flex gap-6 flex-wrap justify-around mx-12">
                <%
                    for (Pelicula pel : peliculasFiltradas) {
                %>
                <div class="card-pelicula snap-start flex-shrink-0 w-1/6 cursor-pointer relative h-auto">
                    <div class="h-auto p-2">
                        <img class="w-full  object-cover rounded-lg" src="<%=pel.getPoster_url()%>">
                        <p class=" font-bold text-xl"><%=pel.getTitulo()%></p>
                        <p class="italic"><%=pel.getAnio_estreno()%></p>
                    </div>
                    <div class="p-5 flex justify-between flex-col bg-slate-800 rounded-lg absolute inset-0  opacity-0 hover:opacity-90 transition-opacity duration-300">
                        <div class="flex gap-4 flex-col">
                            <p class=" font-bold text-2xl"><%=pel.getTitulo()%></p>
                            <p class=""><%=pel.getAnio_estreno()%></p>
                            <p class=""><%=pel.getCategoria()%></p>
                            <p class="line-clamp-6"><%=pel.getDescripcion()%></p>
                        </div>
                        <div class="flex gap-4">
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-play-icon lucide-play"><path d="M5 5a2 2 0 0 1 3.008-1.728l11.997 6.998a2 2 0 0 1 .003 3.458l-12 7A2 2 0 0 1 5 19z"/></svg>
                            </span>
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-heart-icon lucide-heart"><path d="M2 9.5a5.5 5.5 0 0 1 9.591-3.676.56.56 0 0 0 .818 0A5.49 5.49 0 0 1 22 9.5c0 2.29-1.5 4-3 5.5l-5.492 5.313a2 2 0 0 1-3 .019L5 15c-1.5-1.5-3-3.2-3-5.5"/></svg>
                            </span>
                            <span>
                            </span>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>


        </div>
    </div>



    <script src="https://cdn.jsdelivr.net/npm/flowbite@4.0.1/dist/flowbite.min.js"></script>


</body>
</html>
