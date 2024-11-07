<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Eliminar Guía</title>
    <style>
        /* Estilos básicos para una apariencia atractivaaaaaa */
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/image3.jpg'); /* Imagen de fondo */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #333;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            text-align: center;
        }

        h2 {
            color: #d9534f; /* Rojo suave */
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .button {
            background-color: #d9534f;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
        }

        .button:hover {
            background-color: #c9302c;
        }

        .message {
            margin-top: 15px;
            font-weight: bold;
        }

        .error {
            color: #ff0000;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Eliminar Guía</h2>
        <form action="EliminarGuia.jsp" method="post">
            <label for="carne">Carné del Guía:</label>
            <input type="text" id="carne" name="carne" required>
            <button type="submit" class="button">Eliminar Guía</button>
        </form>

        <%
            // Solo se ejecuta cuando se envían datos desde el formulario
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String carne = request.getParameter("carne");

                // Conexión a la base de datos y ejecución del procedimiento
                Connection conn = null;
                CallableStatement stmt = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/administracionturismo", "root", "josueProgramacion2"); // Cambia los datos de conexión

                    // Llama al procedimiento almacenado para eliminar el guía
                    stmt = conn.prepareCall("{CALL EliminarGuia(?)}");
                    stmt.setString(1, carne);

                    int filasAfectadas = stmt.executeUpdate();
                    if (filasAfectadas > 0) {
                        out.println("<p class='message'>Guía eliminado con éxito.</p>");
                    } else {
                        out.println("<p class='message error'>No se encontró ningún guía con el carné especificado.</p>");
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
