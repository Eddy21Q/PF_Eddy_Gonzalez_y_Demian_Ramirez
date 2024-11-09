<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Turismo Nacional</title>
    <!-- Enlace a Font Awesome para íconos -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        /* Estilos generales */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

        /* Menú superior */
        header {
            background-color: #007bff;
            color: white;
            padding: 10px 0;
            text-align: center;
        }

        header nav {
            display: flex;
            justify-content: center;
        }

        header nav a {
            color: white;
            margin: 0 20px;
            text-decoration: none;
            font-size: 18px;
        }

        header nav a:hover {
            text-decoration: underline;
        }

        /* Slider */
        .slider {
            width: 100%;
            height: 400px;
            overflow: hidden;
            position: relative;
        }

        .slider img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            animation: slide 15s infinite;
        }

        @keyframes slide {
            0% { transform: translateX(0); }
            25% { transform: translateX(-100%); }
            50% { transform: translateX(-200%); }
            75% { transform: translateX(-300%); }
            100% { transform: translateX(0); }
        }

        /* Paquetes turísticos */
        .packages {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            padding: 30px;
            background-color: #fff;
        }

        .package {
            width: 30%;
            margin-bottom: 30px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        .package img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .package .content {
            padding: 20px;
            text-align: center;
        }

        .package .content h3 {
            font-size: 22px;
            margin-bottom: 10px;
        }

        .package .content p {
            font-size: 16px;
            color: #555;
        }

        .package .content a {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .package .content a:hover {
            background-color: #0056b3;
        }

        /* Footer */
        footer {
            background-color: #343a40;
            color: white;
            padding: 20px;
            text-align: center;
        }

        footer a {
            color: #00ffcc;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <!-- Menú superior -->
    <header>
        <nav>
            <a href="PaginaMenu.jsp">Inicio</a>
            <a href="Paquetes.jsp">Paquetes</a>
            <a href="Hoteles.jsp">Hoteles</a>
            <a href="Contacto.jsp">Contacto</a>
            <a href="AcercaDe.jsp">Acerca de</a>
        </nav>
    </header>

    <!-- Slider de imagenes -->
    <div class="slider">
        <img src="images/image1.jpg" alt="Destino 1">
        <img src="images/image2.jpg" alt="Destino 2">
        <img src="images/image3.jpg" alt="Destino 3">
        <img src="images/image4.jpg" alt="Destino 4">
    </div>

    <!-- Paquetes turísticos -->
    <div class="packages">
        <div class="package">
            <img src="images/image2.jpg" alt="Paquete Aventura">
            <div class="content">
                <h3>Paquete Aventura</h3>
                <p>Explora las montañas y disfruta de un trekking único.</p>
                <a href="PaqueteAventura.jsp">Ver Más</a>
            </div>
        </div>

        <div class="package">
            <img src="images/image1.jpg" alt="Paquete Relax">
            <div class="content">
                <h3>Paquete Relax</h3>
                <p>Disfruta de un tiempo relajante en la playa con todo incluido.</p>
                <a href="PaqueteRelax.jsp">Ver Más</a>
            </div>
        </div>

        <div class="package">
            <img src="images/image.jpg" alt="Paquete Cultural">
            <div class="content">
                <h3>Paquete Cultural</h3>
                <p>Sumérgete en la cultura local con visitas guiadas y más.</p>
                <a href="PaqueteCultural.jsp">Ver Más</a>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Turismo Nacional | <a href="Contacto.jsp">Contáctanos</a></p>
    </footer>

</body>
</html>
