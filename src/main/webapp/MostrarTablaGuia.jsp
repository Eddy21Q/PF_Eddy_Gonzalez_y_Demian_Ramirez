<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.CallableStatement, java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Datos de conexión
    String url = "jdbc:mysql://localhost:3306/administracionturismo"; // Cambia el puerto y el nombre de la base de datos si es necesario
    String username = "root";  // Reemplaza con tu nombre de usuario de MySQL
    String password = "josueProgramacion2";  // Reemplaza con tu contraseña de MySQL

    Connection connection = null;
    CallableStatement callableStatement = null;
    ResultSet resultSet = null;

    try {
        // Cargar el controlador JDBC para MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establecer la conexión
        connection = DriverManager.getConnection(url, username, password);

        // Llamar al procedimiento almacenado "MostrarTablaGuias"
        String query = "{CALL MostrarTablaGuias()}";
        callableStatement = connection.prepareCall(query);
        resultSet = callableStatement.executeQuery();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mostrar Guías</title>
    <style>
        /* Estilos generales */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('images/image1.jpg') no-repeat center center fixed; /* Imagen de fondo */
            background-size: cover;
            color: #333;
        }

        /* Contenedor principal */
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9); /* Fondo blanco con transparencia */
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #2E8B57; /* Verde */
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #2E8B57; /* Verde para el encabezado */
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1; /* Color claro al pasar el ratón */
        }

        /* Estilo para el mensaje de error */
        .error-message {
            color: #ff0000;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Listado de Guías</h1>
        <table>
            <tr>
                <th>Carne</th>
                <th>Nombre 1</th>
                <th>Nombre 2</th>
                <th>Apellido 1</th>
                <th>Apellido 2</th>
            </tr>
            <%
                while (resultSet.next()) {
            %>
            <tr>
                <td><%= resultSet.getString("carne") %></td> <!-- Cambia "carne" por el nombre de tu columna -->
                <td><%= resultSet.getString("nombre1") %></td> <!-- Cambia "nombre1" por el nombre de tu columna -->
                <td><%= resultSet.getString("nombre2") %></td> <!-- Cambia "nombre2" por el nombre de tu columna -->
                <td><%= resultSet.getString("apellido1") %></td> <!-- Cambia "apellido1" por el nombre de tu columna -->
                <td><%= resultSet.getString("apellido2") %></td> <!-- Cambia "apellido2" por el nombre de tu columna -->
            </tr>
            <%
                }
            %>
        </table>
    </div>

<%
    } catch (Exception e) {
        out.println("<p class='error-message'>Error al conectar a la base de datos: " + e.getMessage() + "</p>");
    } finally {
        // Cierra la conexión y otros recursos
        if (resultSet != null) resultSet.close();
        if (callableStatement != null) callableStatement.close();
        if (connection != null) connection.close();
    }
%>

</body>
</html>
