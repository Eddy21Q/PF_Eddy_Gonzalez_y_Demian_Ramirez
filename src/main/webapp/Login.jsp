<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String validUser = "usuario";  // Cambia esto por el usuario correcto
    String validPassword = "contraseña"; // Cambia esto por la contraseña correcta

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {
        if (username.equals(validUser) && password.equals(validPassword)) {
            session.setAttribute("user", username); // Guarda el usuario en la sesión
            response.sendRedirect("PaginaMenu.jsp"); // Redirige a la página principal
            return;
        } else {
            request.setAttribute("error", "Usuario o contraseña incorrectos.");
        }
    }

    String user = (String) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title><%= user == null ? "Iniciar Sesión" : "Página Principal" %></title>
    <style>
        /* Estilo básico para el cuerpo y el fondo */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('images/image2.jpg'); /* La imagen de fondo */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        /* Estilo del formulario con aspecto tecnológico */
        form {
            background: rgba(0, 0, 0, 0.7); /* Fondo oscuro con transparencia */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 255, 255, 0.6); /* Sombra color neón */
            max-width: 400px;
            width: 100%;
            display: none; /* Oculto por defecto, se mostrará si no hay usuario en sesión */
            color: white;
            position: relative;
        }

        form::before {
            content: "";
            position: absolute;
            top: -5px;
            left: -5px;
            right: -5px;
            bottom: -5px;
            background: linear-gradient(45deg, cyan, magenta); /* Bordes de neón */
            z-index: -1;
            border-radius: 10px;
            filter: blur(15px);
        }

        form h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: cyan;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            color: #ddd;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 10px;
            border: 1px solid #333;
            border-radius: 3px;
            background-color: #222;
            color: #ddd;
        }

        input[type="text"]::placeholder,
        input[type="password"]::placeholder {
            color: #888; /* Placeholder gris claro */
        }

        button {
            background: linear-gradient(90deg, #007BFF, #00FFDD);
            color: white;
            padding: 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #0056b3;
        }

        /* Mensaje de error */
        .error-message {
            color: red;
            margin-top: 10px;
            font-weight: bold;
        }

        /* Estilo del contenedor de bienvenida */
        .container {
            text-align: center;
            background-color: rgba(0, 0, 0, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 255, 255, 0.2);
            display: none;
            color: white;
        }
    </style>
</head>
<body>
    <%
        if (user == null) {
    %>
        <form action="Login.jsp" method="post" style="display: block;">
            <h1>Iniciar Sesión</h1>
            <label for="username">Usuario:</label>
            <input type="text" id="username" name="username" placeholder="Ingrese su usuario" required>
            
            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" placeholder="Ingrese su contraseña" required>
            
            <button type="submit">Iniciar Sesión</button>
            
            <% 
                String error = (String) request.getAttribute("error"); 
                if (error != null) { 
            %>
                <p class="error-message"><%= error %></p>
            <% } %>
        </form>
    <%
        } else {
    %>
        <div class="container" style="display: block;">
            <h1>Bienvenido, <%= user %>!</h1>
            <!-- Aquí puedes añadir más contenido o botones -->
        </div>
    <%
        }
    %>
</body>
</html>
