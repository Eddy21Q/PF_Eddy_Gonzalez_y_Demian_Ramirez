<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Modificar Datos de Turista</title>
    <!-- Aquí van los estilos CSS -->
</head>
<body>
    <div class="container">
        <h2>Modificar Datos de Turista</h2>
        <form action="ModificarTurista.jsp" method="post">
            <label for="identificacion">Identificación:</label>
            <input type="text" id="identificacion" name="identificacion" required>
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
            <button type="submit">Modificar</button>
        </form>

        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String identificacion = request.getParameter("identificacion");
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
                    stmt = conn.prepareCall("{CALL ModificarDatosTurista(?, ?, ?, ?, ?, ?)}");
                    stmt.setString(1, identificacion);
                    stmt.setString(2, carne);
                    stmt.setString(3, nombre1);
                    stmt.setString(4, nombre2);
                    stmt.setString(5, apellido1);
                    stmt.setString(6, apellido2);

                    int filasModificadas = stmt.executeUpdate();
                    if (filasModificadas > 0) {
                        out.println("<p>Registro modificado con éxito.</p>");
                    } else {
                        out.println("<p>Error al modificar el registro.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                } finally {
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            }
        %>
    </div>
</body>
</html>
