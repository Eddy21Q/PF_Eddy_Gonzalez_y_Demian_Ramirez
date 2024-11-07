<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Modificar Datos de la Guía</title>
    <style>
        /* Estilos generales */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        html, body {
            height: 100%;
            font-family: Arial, sans-serif;
            background: url('images/image3.jpg') no-repeat center center fixed; /* Imagen fija y centrada */
            background-size: cover; /* Asegura que la imagen cubra toda el área visible */
            display: flex;
            justify-content: center;
            align-items: center;
            color: #333;
        }

        /* Contenedor principal */
        .container {
            background-color: rgba(255, 255, 255, 0.9);
            max-width: 500px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        /* Título */
        h2 {
            color: #2E8B57; /* Verde inspirado en la naturaleza */
            font-family: 'Georgia', serif;
            font-size: 24px;
            margin-bottom: 15px;
        }

        /* Etiquetas de entrada */
        label {
            font-weight: bold;
            display: block;
            text-align: left;
            margin-bottom: 5px;
        }

        /* Campos de entrada */
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        /* Botón de modificación */
        .button {
            background-color: #2E8B57; /* Verde para el botón */
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
        }
        
        .button:hover {
            background-color: #27694A; /* Color verde oscuro al pasar el ratón */
        }

        /* Mensaje de éxito o error */
        .message {
            margin-top: 15px;
            font-weight: bold;
        }

        /* Estilos para errores */
        .error {
            color: #ff0000;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Modificar Datos de la Guía</h2>
        <form action="ModificarGuia.jsp" method="post">
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

            <button type="submit" class="button">Modificar</button>
        </form>

        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String carne = request.getParameter("carne");
                String nombre1 = request.getParameter("nombre1");
                String nombre2 = request.getParameter("nombre2");
                String apellido1 = request.getParameter("apellido1");
                String apellido2 = request.getParameter("apellido2");

                Connection conn = null;
                CallableStatement stmt = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/administracionturismo", "root", "josueProgramacion2");

                    stmt = conn.prepareCall("{CALL ModificarDatosGuia(?, ?, ?, ?, ?)}");
                    stmt.setString(1, carne);
                    stmt.setString(2, nombre1);
                    stmt.setString(3, nombre2);
                    stmt.setString(4, apellido1);
                    stmt.setString(5, apellido2);

                    int filasModificadas = stmt.executeUpdate();
                    if (filasModificadas > 0) {
                        out.println("<p class='message'>Registro modificado con éxito.</p>");
                    } else {
                        out.println("<p class='message error'>Error al modificar el registro.</p>");
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
