<%-- 
    Document   : formularioPelicula
    Created on : 14 dic 2025, 2:48:20 a.m.
    Author     : jtafu
--%>

<%@page import="modelo.Categoria"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Pelicula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
        <link href="https://cdn.jsdelivr.net/npm/flowbite@4.0.1/dist/flowbite.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <script src="https://unpkg.com/just-validate@latest/dist/just-validate.production.min.js"></script>
        <title>Formulario</title>
    </head>
    <body class="bg-slate-950 text-white min-h-screen">
        <header class=" text-white">
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
                                <a href="#" class="block py-2 px-3 text-heading rounded hover:bg-neutral-tertiary md:hover:bg-transparent md:border-0 md:hover:text-fg-brand md:p-0 md:dark:hover:bg-transparent">Novedades</a>
                            </li>
                            <li>
                                <a href="#" class="block py-2 px-3 text-heading rounded hover:bg-neutral-tertiary md:hover:bg-transparent md:border-0 md:hover:text-fg-brand md:p-0 md:dark:hover:bg-transparent">Proximamente</a>
                            </li>
                            <li>
                                <button id="dropdownNvbarButton" data-dropdown-toggle="dropdownNavbar" class="flex items-center justify-between w-full py-2 px-3 rounded font-medium text-heading md:w-auto hover:bg-neutral-tertiary md:hover:bg-transparent md:border-0 md:hover:text-fg-brand md:p-0">
                                    Categorias 
                                    <svg class="w-4 h-4 ms-1.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 9-7 7-7-7"/></svg>
                                </button>

                                <div id="dropdownNavbar" class="z-10 hidden bg-neutral-primary-medium bg-slate-900 shadow-lg w-44">
                                    <ul class="p-2 text-sm text-body font-medium" aria-labelledby="dropdownNvbarButton">
                                        
                                        <li>
                                            <a href="#" class="inline-flex items-center w-full p-2 hover:bg-neutral-tertiary-medium hover:text-heading rounded">Accion</a>
                                        </li>
                                        <li>
                                            <a href="#" class="inline-flex items-center w-full p-2 hover:bg-neutral-tertiary-medium hover:text-heading rounded">Comedia</a>
                                        </li>

                                    </ul>
                                </div>
                            </li>

                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <main class="pt-16  text-white">
            <div class="mx-auto max-w-5/6 shadow-xl rounded-xl p-8">
                <div class="flex justify-between mb-4"> 
                    <h1 class="text-2xl font-bold">Listado de peliculas 📽️</h1>

                    <form class="w-1/3 mx-auto">   
                        <label for="search" class="block mb-2.5 text-sm font-medium text-heading sr-only ">Search</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                                <svg class="w-4 h-4 text-body" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="m21 21-3.5-3.5M17 10a7 7 0 1 1-14 0 7 7 0 0 1 14 0Z"/></svg>
                            </div>
                            <input type="search" id="search" class="block w-full p-3 ps-9 bg-slate-800 border-purple-200 rounded-full text-heading text-sm rounded-base focus:ring-brand focus:border-brand shadow-xs placeholder:text-body" placeholder="Search" required />
                            <button type="button" class="bg-purple-950 rounded-full cursor-pointer absolute end-1.5 bottom-1.5 text-white bg-brand hover:bg-brand-strong box-border border border-transparent focus:ring-4 focus:ring-brand-medium shadow-xs font-medium leading-5 rounded text-xs px-3 py-1.5 focus:outline-none">Search</button>
                        </div>
                    </form>


                    <button class="btn btn-primary"  onclick="nuevaPelicula()"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus-icon lucide-plus"><path d="M5 12h14"/><path d="M12 5v14"/></svg> 
                        Nueva pelicula</button>
                </div>
                <div class="overflow-x-auto bg-slate-950">
                    <table id= "tablaPeliculas" class="table  text-white  bg-slate-900">
                     
                        <thead class=" bg-slate-800">
                            <tr class="bg-red">
                                <th class="w-24  text-white text-center">Id</th>
                                <th class="w-48 text-white text-center">Titulo</th>
                                <th class="w-150  text-white text-center">Descripción</th>
                                <th class="w-min truncate  text-white text-center">Duración</th>
                                <th class="w-min  text-white text-center">Portada</th>
                                <th class="w-min  text-white text-center">Año</th>
                                <th class="w-90  text-white text-center">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- row 1 -->
                            <%
                                List<Pelicula> peliculas = (List<Pelicula>) request.getAttribute("listaPeliculas");
                                if (peliculas != null) {
                                    for (int i = peliculas.size() - 1; i >= 0; i--) {
                                        Pelicula pel = peliculas.get(i);

                            %>
                            <tr>
                                <th class="w-24 text-center"><%=pel.getId_pelicula()%></th>
                                <td class="w-48 text-center"><%=pel.getTitulo()%></td>
                                <td class="w-150 text-justify"><%=pel.getDescripcion()%> </td>
                                <td class="w-min truncate"><%=pel.getDuracion_minutos()%> min</td>
                                <td class="w-min">
                                    <img src="<%=pel.getPoster_url()%>"
                                         class="max-w-2xl h-28 object-cover rounded" />
                                </td>
                                <td class="w-min"><%=pel.getAnio_estreno()%></td>
                                <td class="items-center">
                                    <div class="flex flex-wrap gap-2 justify-center">
                                        <!--<button class="btn btn-success">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-eye-icon lucide-eye"><path d="M2.062 12.348a1 1 0 0 1 0-.696 10.75 10.75 0 0 1 19.876 0 1 1 0 0 1 0 .696 10.75 10.75 0 0 1-19.876 0"/><circle cx="12" cy="12" r="3"/></svg>
                                            Ver
                                        </button> -->
                                        <button class="btn btn-warning"
                                                onclick="editarPelicula(
                                                                '<%= pel.getId_pelicula()%>',
                                                                '<%= pel.getTitulo().replace("'", "\\'")%>',
                                                                '<%= pel.getDescripcion().replace("'", "\\'")%>',
                                                                '<%= pel.getDuracion_minutos()%>',
                                                                '<%= pel.getAnio_estreno()%>',
                                                                '<%= pel.getPoster_url()%>',
                                                                '<%= pel.getBanner_url()%>',
                                                                '<%= pel.getTrailer_url()%>',
                                                                '<%= pel.getId_categoria()%>'
                                                                )">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-pencil-line-icon lucide-pencil-line"><path d="M13 21h8"/><path d="m15 5 4 4"/><path d="M21.174 6.812a1 1 0 0 0-3.986-3.987L3.842 16.174a2 2 0 0 0-.5.83l-1.321 4.352a.5.5 0 0 0 .623.622l4.353-1.32a2 2 0 0 0 .83-.497z"/></svg>
                                            Editar
                                        </button>
                                        <a class="btn btn-error" href="/LPI_T2_TAFUR_JEANETH/PeliculaDelete?id=<%= pel.getId_pelicula()%>">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash2-icon lucide-trash-2"><path d="M10 11v6"/><path d="M14 11v6"/><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6"/><path d="M3 6h18"/><path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/></svg> Eliminar
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
        <dialog id="my_modal_4" class="modal ">
            <div class="modal-box w-11/12 p-8 bg-slate-800">
                <h2 id="titulo_form"class="text-2xl font-bold mb-4 text-center">Nueva Pelicula</h2>
                <form id="formularioPelicula" action="formularioPelicula" method="post" autocomplete="off">
                    <input type="hidden" name="id_pelicula" id="id_pelicula">
                    <div class="space-y-2">
                        <label class="block font-semibold">Título</label>
                        <input type="text"
                               name="titulo"
                               id="titulo"
                               maxlength="200"
                               class="w-full rounded-lg border border-gray-500 bg-slate-700 px-4 py-2 text-white focus:border-purple-500 focus:ring-1 focus:ring-purple-500
                               placeholder="Título de la película">
                    </div>

                    <div class="mt-2">
                        <label class="block font-semibold">Descripción</label>
                        <textarea name="descripcion"
                                  id="descripcion"
                                  class="w-full rounded-lg border border-gray-500 bg-slate-700 px-4 py-2 text-white focus:border-purple-500 focus:ring-1 focus:ring-purple-500
                                  placeholder="Descripción de la película"></textarea>
                    </div>


                    <div class="mt-2">
                        <label class="block font-semibold">Duración (min)</label>
                        <input type="number"
                               name="duracion_minutos"
                               id="duracion_minutos"
                               class="w-full rounded-lg border border-gray-500 bg-slate-700 px-4 py-2 text-white focus:border-purple-500 focus:ring-1 focus:ring-purple-500
                               placeholder="Ej: 120">
                    </div>


                    <div class="mt-2">
                        <label class="block font-semibold">Año estreno</label>
                        <input type="number"
                               name="anio_estreno"
                               id="anio_estreno"
                               class="w-full rounded-lg border border-gray-500 bg-slate-700 px-4 py-2 text-white focus:border-purple-500 focus:ring-1 focus:ring-purple-500
                               placeholder="2024">
                    </div>


                    <div class="mt-2">
                        <label class="block font-semibold">Categoría</label>
                        <select name="id_categoria"
                                class="w-full rounded-lg border border-gray-500 bg-slate-700 px-4 py-2 text-white focus:border-purple-500 focus:ring-1 focus:ring-purple-500">
                            <option value="">Seleccione categoría</option>

                            <%
                                List<Categoria> categorias
                                        = (List<Categoria>) request.getAttribute("listaCategorias");

                                if (categorias != null) {
                                    for (Categoria c : categorias) {
                            %>
                            <option value="<%= c.getId_categoria()%>">
                                <%= c.getCategoria()%>
                            </option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>

                    <div class="mt-2">
                        <label class="block font-semibold">URL Poster</label>
                        <input type="url"
                               name="poster_url"
                               id="poster_url"
                               class="w-full rounded-lg border border-gray-500 bg-slate-700 px-4 py-2 text-white focus:border-purple-500 focus:ring-1 focus:ring-purple-500
                               placeholder="https://...">
                    </div>


                    <div class="mt-2">
                        <label class="block font-semibold">URL Banner</label>
                        <input type="url"
                               name="banner_url"
                               id="banner_url"
                               class="w-full rounded-lg border border-gray-500 bg-slate-700 px-4 py-2 text-white focus:border-purple-500 focus:ring-1 focus:ring-purple-500
                               placeholder="https://...">
                    </div>


                    <div class="mt-2">
                        <label class="block font-semibold">URL Trailer</label>
                        <input type="url"
                               name="trailer_url"
                               id="trailer_url"
                               class="w-full rounded-lg border border-gray-500 bg-slate-700 px-4 py-2 text-white focus:border-purple-500 focus:ring-1 focus:ring-purple-500
                               placeholder="https://youtube.com/embed/...">
                    </div>


                    <div class="flex justify-end gap-4 mt-5">
                        <button class="btn btn-primary" type="submit" id="btnSubmit">

                            Registrar</button>
                        <button class="btn btn-soft" type="button" onclick="my_modal_4.close()">

                            Cancelar</button>
                    </div>
                </form>

            </div>
        </dialog>
        <script>
            const validate = new JustValidate("#formularioPelicula");

            validate
                    .addField('#titulo', [
                        {rule: 'required', errorMessage: 'Ingresa el título'},
                        {rule: 'minLength', value: 3},
                        {rule: 'maxLength', value: 200}
                    ])

                    .addField('#descripcion', [
                        {rule: 'required', errorMessage: 'Ingresa la descripción'},
                        {rule: 'minLength', value: 3}
                    ])

                    .addField('#duracion_minutos', [
                        {rule: 'required', errorMessage: 'Ingresa la duración'},
                        {rule: 'integer', errorMessage: 'Solo números'}
                    ])

                    .addField('#anio_estreno', [
                        {rule: 'required', errorMessage: 'Ingresa el año'},
                        {rule: 'integer'},
                        {
                            rule: 'customRegexp',
                            value: /^[0-9]{4}$/,
                            errorMessage: 'Año inválido (ej: 2024)'
                        }
                    ])

                    .addField('select[name="id_categoria"]', [
                        {rule: 'required', errorMessage: 'Selecciona una categoría'}
                    ])

                    .onSuccess((event) => {
                        event.target.submit();
                    });
        </script>

        <%
            String mensaje = (String) session.getAttribute("mensaje");
            if (mensaje != null) {
        %>
        <script>
            alert("<%= mensaje%>");
        </script>
        <%
                session.removeAttribute("mensaje");
            }
        %>

        <script>
            const searchInput = document.getElementById("search");
            const table = document.getElementById("tablaPeliculas");
            const rows = table.querySelectorAll("tbody tr");

            searchInput.addEventListener("keyup", function () {
                const filtro = searchInput.value.toLowerCase();

                rows.forEach(row => {
                    const titulo = row.children[1].innerText.toLowerCase(); // 👈 solo título

                    if (titulo.includes(filtro)) {
                        row.style.display = "";
                    } else {
                        row.style.display = "none";
                    }
                });
            });
        </script>
        <script>
            function editarPelicula(id, titulo, descripcion, duracion, anio, poster, banner, trailer, idCategoria) {
                document.getElementById("id_pelicula").value = id;
                document.getElementById("titulo").value = titulo;
                document.getElementById("descripcion").value = descripcion;
                document.getElementById("duracion_minutos").value = duracion;
                document.getElementById("anio_estreno").value = anio;
                document.getElementById("poster_url").value = poster;
                document.getElementById("banner_url").value = banner;
                document.getElementById("trailer_url").value = trailer;

                document.querySelector('select[name="id_categoria"]').value = idCategoria;

                document.getElementById("btnSubmit").innerText = "Actualizar";
                document.getElementById("titulo_form").innerText = "Editar Película";

                my_modal_4.showModal();
            }
        </script>

        <script>
            function nuevaPelicula() {
                document.getElementById("id_pelicula").value = "";
                document.getElementById("titulo").value = "";
                document.getElementById("descripcion").value = "";
                document.getElementById("duracion_minutos").value = "";
                document.getElementById("anio_estreno").value = "";
                document.getElementById("poster_url").value = "";
                document.getElementById("banner_url").value = "";
                document.getElementById("trailer_url").value = "";
                document.querySelector('select[name="id_categoria"]').value = "";
                document.getElementById("btnSubmit").innerText = "Registrar";
                document.getElementById("titulo_form").innerText = "Nueva Película 🎬";
                my_modal_4.showModal();
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/flowbite@4.0.1/dist/flowbite.min.js"></script>
    </body>
</html>
