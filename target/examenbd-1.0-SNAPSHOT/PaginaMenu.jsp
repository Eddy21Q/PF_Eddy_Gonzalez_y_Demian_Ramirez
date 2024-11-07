<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String user = (String) session.getAttribute("user"); // Obtiene el usuario de la sesión
    if (user == null) { // Si no hay sesión activa, redirige a login.jsp
        response.sendRedirect("Login.jsp");
        return; // Asegúrate de detener la ejecución después de redirigir
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Página Principal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            /* Cambia la ruta a tu imagen de fondo */
            background-image: url('images/image.jpg'); 
            background-size: cover; /* Asegura que la imagen cubra todo el fondo */
            background-repeat: no-repeat; /* No repetir la imagen */
            background-position: center; /* Centra la imagen de fondo */
            margin: 0;
            padding: 0;
            height: 100vh; /* Asegura que el body ocupe toda la altura de la ventana */
            display: flex;
            justify-content: center; /* Centra horizontalmente */
            align-items: center; /* Centra verticalmente */
        }
        .container {
            max-width: 600px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9); /* Fondo blanco con opacidad */
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            text-align: center; /* Centra el texto en el contenedor */
        }
        h1 {
            color: #333;
            font-size: 24px; /* Tamaño del texto para el mensaje de bienvenida */
        }
        h2 {
            color: #007BFF; /* Color azul para el título */
            font-size: 28px; /* Tamaño del texto para el título */
            font-family: 'Georgia', serif; /* Cambia la fuente a una más estilizada */
            margin-bottom: 20px; /* Margen inferior para separar del resto */
        }
        .button {
            display: block;
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            color: #fff;
            background-color: #007BFF;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
        }
        .button:hover {
            background-color: #0056b3;
        }
        a {
            display: block;
            margin-top: 20px;
            color: #ff5722;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Administración de Turismo: Parques Nacionales</h2> <!-- Título atractivo -->
        <h1>Bienvenido, <%= user %>!</h1>
        <p>Sus credenciales han sido aceptadas.</p>

        <!-- Botones para las acciones -->
        <form action="MostrarTablaGuia.jsp" method="get">
            <button type="submit" class="button">Mostrar Tabla Guías</button>
        </form>
        
        <form action="InsertarGuia.jsp" method="get">
            <button type="submit" class="button">Insertar en Tabla Guias</button>
        </form>
        
        <form action="ModificarGuia.jsp" method="get">
            <button type="submit" class="button">Modificar/Actualizar Tabla Guía</button>
        </form>
        
        <form action="EliminarGuia.jsp" method="get">
            <button type="submit" class="button">Eliminar en Tabla Guía</button>
        </form>
        
        <a href="logout.jsp">Cerrar Sesión</a>
    </div>
</body>
</html>
