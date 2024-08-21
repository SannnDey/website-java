<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="css/loginregister.css">
</head>
<body>
    <header>
        <h1>Register</h1>
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
        <form action="RegisterServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br><br>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br><br>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>
            
            <input type="submit" value="Register">
        </form>
        
        <% 
            String registerErrorMessage = (String) request.getAttribute("registerErrorMessage");
            if (registerErrorMessage != null) {
        %>
            <p class="error-message"><%= registerErrorMessage %></p>
        <% } %>
    </div>
</body>
</html>
