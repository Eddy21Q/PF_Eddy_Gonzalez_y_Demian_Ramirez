<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*"%>
<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    // Configuración de la conexión a la base de datos
    String dbURL = "jdbc:mysql://localhost:3306/administracionturismo";
    String dbUsername = "root";
    String dbPassword = "josueProgramacion2";
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // Conexión a la base de datos
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
    } catch (Exception e) {
        out.println("Error de conexión: " + e.getMessage());
    }
%><!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mantenimiento de Guias</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> <!-- Font Awesome -->
    <style>
        /* Estilos generales */
        body {
            font-family: 'Arial', sans-serif;
            background-image: url('images/image7.jpg');
            background-size: cover;
            background-position: center center;
            margin: 0;
            padding: 0;
            animation: fadeIn 1s ease-in-out;
        }

        /* Efecto de desvanecimiento al cargar */
        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        header {
            background-color: rgba(52, 152, 219, 0.8);
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
        }

        .container {
            width: 80%;
            margin: auto;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.85);
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            animation: slideIn 1s ease-out;
            text-align: center;
        }

        /* Animación de entrada */
        @keyframes slideIn {
            0% { transform: translateY(50px); opacity: 0; }
            100% { transform: translateY(0); opacity: 1; }
        }

        .action-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-top: 15px;
            padding: 12px 30px;
            border-radius: 30px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .action-btn i {
            margin-right: 10px;
            font-size: 20px;
            transition: transform 0.3s ease;
        }

        /* Estilo de los botones */
        .action-btn {
            background-color: #3498db;
            color: white;
            border: 2px solid #3498db;
        }

        /* Efecto de hover para botones */
        .action-btn:hover {
            background-color: white;
            color: #3498db;
            transform: translateY(-5px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        /* Efecto de rotación en los iconos */
        .action-btn:hover i {
            transform: rotate(15deg);
        }

        /* Sombra suave para la tabla */
        table {
            width: 100%;
            margin-top: 30px;
            border-collapse: collapse;
            box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        th:hover, td:hover {
            background-color: #f0f0f0;
            transform: scale(1.05);
        }

        /* Botón flotante para volver al inicio */
        .scroll-to-top {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #3498db;
            color: white;
            border: none;
            padding: 15px;
            border-radius: 50%;
            font-size: 24px;
            cursor: pointer;
            display: none;
            transition: background-color 0.3s ease;
        }

        .scroll-to-top:hover {
            background-color: #2980b9;
        }

    </style>
</head>
<body>

    <!-- Menú superior -->
    <header>
        <h1>Mantenimiento de Guias</h1>
    </header>

    <div class="container">
        <!-- Botones de acción con íconos -->
        <a href="MostrarTablaGuia.jsp" class="action-btn">
            <i class="fas fa-table"></i> Mostrar Tabla
        </a>
        <a href="InsertarGuia.jsp" class="action-btn">
            <i class="fas fa-user-plus"></i> Insertar
        </a>
        <a href="ModificarGuia.jsp" class="action-btn">
            <i class="fas fa-user-edit"></i> Modificar
        </a>
        <a href="EliminarGuia.jsp" class="action-btn">
            <i class="fas fa-user-times"></i> Eliminar
        </a>
    </div>

    <!-- Botón flotante para volver al inicio -->
    <button onclick="window.scrollTo({top: 0, behavior: 'smooth'});" class="scroll-to-top">↑</button>

    <script>
        // Mostrar el botón de "volver arriba" cuando el usuario hace scroll
        window.onscroll = function() {
            if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
                document.querySelector(".scroll-to-top").style.display = "block";
            } else {
                document.querySelector(".scroll-to-top").style.display = "none";
            }
        };
    </script>
</body>
</html>
