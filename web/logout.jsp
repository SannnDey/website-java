<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
</head>
<body>
    <%
        // Mendapatkan session jika ada
        HttpSession currentSession = request.getSession(false);
        if (currentSession != null) {
            currentSession.invalidate();  // Menghapus session
        }
        // Mengarahkan pengguna ke halaman login setelah logout
        response.sendRedirect("index.jsp");
    %>
</body>
</html>
