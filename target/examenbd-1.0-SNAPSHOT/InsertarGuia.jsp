<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Insertar en Tabla Guías</title>
    <style>
        /* Estilos generales */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: url('images/image4.jpg') no-repeat center center fixed; /* Imagen de fondo */
            background-size: cover;
            color: #333;
        }

        /* Contenedor principal */
        .container {
            max-width: 600px;
            margin: 100px auto; /* Espacio en la parte superior */
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9); /* Fondo blanco semitransparente */
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
        }

        /* Título */
        h2 {
            text-align: center;
            color: #2E8B57; /* Verde */
            margin-bottom: 20px;
        }

        /* Estilos para el formulario */
        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        /* Botón de inserción */
        .button {
            background-color: #2E8B57; /* Verde */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #27694A; /* Verde oscuro al pasar el ratón */
        }

        /* Mensajes de éxito o error */
        .message {
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
        }

        .error {
            color: #ff0000;
        }

        .success {
            color: #28a745; /* Verde para mensajes de éxito */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Insertar Nuevo Guía</h2>
        <form action="InsertarGuia.jsp" method="post">
            <label for="carne">Carné:</label>
            <input type="text" id="carne" name="carne" required>

            <label for="nombre1">Primer Nombre:</label>
            <input type="text" id="nombre1" name="nombre1" required>

            <label for="nombre2">Segundo Nombre:</label>
            <input type="text" id="nombre2" name="nombre2">

            <label for="apellido1">Primer Apellido:</label>
            <input type="text" id="apellido1" name="apellido1" required>

            <label for="apellido2">Segundo Apellido:</label>
            <input type="text" id="apellido2" name="apellido2">

            <button type="submit" class="button">Insertar</button>
        </form>

        <%
            // Solo se ejecuta cuando se envían datos desde el formulario
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String carne = request.getParameter("carne");
                String nombre1 = request.getParameter("nombre1");
                String nombre2 = request.getParameter("nombre2");
                String apellido1 = request.getParameter("apellido1");
                String apellido2 = request.getParameter("apellido2");

                // Conectar a la base de datos
                Connection conn = null;
                CallableStatement stmt = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver"); // Cambia el driver si es necesario
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/administracionturismo", "root", "josueProgramacion2");

                    // Llama al procedimiento almacenado
                    stmt = conn.prepareCall("{CALL InsertarGuia(?, ?, ?, ?, ?)}");
                    stmt.setString(1, carne);
                    stmt.setString(2, nombre1);
                    stmt.setString(3, nombre2);
                    stmt.setString(4, apellido1);
                    stmt.setString(5, apellido2);

                    int filasInsertadas = stmt.executeUpdate();
                    if (filasInsertadas > 0) {
                        out.println("<p class='message success'>Registro insertado con éxito.</p>");
                    } else {
                        out.println("<p class='message error'>Error al insertar el registro.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p class='message error'>Error: " + e.getMessage() + "</p>");
                } finally {
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            }
        %>
    </div>
</body>
</html>
