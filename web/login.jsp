<%-- 
    Document   : login
    Created on : 13 dic 2025, 3:11:41 a.m.
    Author     : jtafu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <title>Login</title>
    </head>
    <body class="relative bg-gray-900 text-white">
        <div class="absolute inset-0 grid h-screen grid-cols-3 overflow-hidden">
            <img class="col-span-3 h-full w-full object-cover brightness-50 md:col-span-1 md:block"
                 src="https://image.tmdb.org/t/p/original/eMaH8xS0vXae1jm1Ry0S3yRBEhM.jpg" alt="Película 1" />
            <img class="hidden h-full w-full object-cover brightness-50 md:block"
                 src="https://image.tmdb.org/t/p/original/iolc5VLP4PFU0XvjTVRiCb80mUR.jpg" alt="Película 2" />
            <img class="hidden h-full w-full object-cover brightness-50 md:block"
                 src="https://image.tmdb.org/t/p/original/uc5U4GCZu9Z2Zb3yqk5fZfLwawR.jpg" alt="Película 3" />
        </div>
        <div class="relative z-10 flex h-screen items-center justify-center px-4">
            <div
                class="w-full max-w-md rounded-xl bg-slate-800 backdrop-blur-md p-8 shadow-lg border-1 border-gray-500">
                <h1 class="mb-6 text-center text-3xl font-bold text-white">Iniciar Sesión</h1>
                <form action="UsuarioServlet" method="post" class="flex flex-col gap-4">
                    <div>
                        <label for="usuario" class="mb-2 block text-sm font-medium text-white">Usuario</label>
                        <input type="text" id="usuario" name="usuario" required placeholder="Tu usuario"
                               class="w-full rounded-lg border border-gray-500 bg-slate-700 px-4 py-2 text-white focus:border-purple-500 focus:ring-1 focus:ring-purple-500" />
                    </div>
                    <div>
                        <label for="password" class="mb-2 block text-sm font-medium text-white">Contraseña</label>
                        <input type="password" id="password" name="password" required placeholder="Tu contraseña"
                               class="w-full rounded-lg border border-gray-500 bg-slate-700 px-4 py-2 text-white focus:border-purple-500 focus:ring-1 focus:ring-purple-500" />
                    </div>
                    <button type="submit"
                            class="mt-4 w-full rounded-lg bg-purple-800 px-4 py-2 font-semibold text-white transition-colors duration-300 hover:bg-purple-700">Ingresar
                    </button>
                    <!--   <a   href="/LPI_T2_TAFUR_JEANETH/PeliculaServlet"
                            class="mt-4 w-full rounded-lg bg-purple-800 px-4 py-2 font-semibold text-white transition-colors duration-300 hover:bg-purple-700 text-center">Ingresar
                       </a>-->
                </form>
                <p class="text-red-300 h-2">${error}</a>
                <p class="mt-4 text-center text-sm text-white">¿No tienes cuenta? 
                    <a href="#" class="text-purple-400 hover:underline">Regístrate</a>
                </p>
            </div>
        </div>
    </body>
</html>
