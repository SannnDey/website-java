<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/loginregister.css">
</head>
<body>
    <header>
        <h1>Login</h1>
         <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="games.jsp">Games</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="contact.jsp">Contact</a></li>
	    </ul>
        </nav>
    </header>
    
    <div class="form-container">
        <form action="LoginServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br><br>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>
            
            <input type="submit" value="Login">
        </form>

        <% 
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <p class="error-message"><%= errorMessage %></p>
        <% } %>
        
        <p>Belum punya akun? <a href="register.jsp">Daftar di sini</a></p>
    </div>
</body>
</html>
