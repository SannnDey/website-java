<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<!DOCTYPE html>
<html>
<head>
    <title>Game List</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <header>
        <h1>Game List</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="games.jsp">Games</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <%
                    // Get the session if it exists
                    HttpSession currentSession = request.getSession(false);
                    if (currentSession != null && currentSession.getAttribute("username") != null) {
                        // If the user is logged in
                %>
                    <li><a href="logout.jsp">Logout</a></li>
                <% } else { %>
                    <li><a href="login.jsp">Login</a></li>
                <% } %>
            </ul>
        </nav>
    </header>

    <section>
        <h2>Available Games</h2>
        <nav class="genre-menu">
            <ul>
                <li><a href="games.jsp?genre=all">All Games</a></li>
                <li><a href="games.jsp?genre=adventure">Adventure</a></li>
                <li><a href="games.jsp?genre=sports">Sports</a></li>
                <li><a href="games.jsp?genre=action">Action</a></li>
                <li><a href="games.jsp?genre=horror">Horror</a></li>
            </ul>
        </nav>
        <div class="card-container">
            <% 
                String genre = request.getParameter("genre");
                boolean showAll = genre == null || genre.equals("all");

                // Game data
                Map<String, String> games = new LinkedHashMap<>();
                games.put("The Witcher 3", "adventure");
                games.put("Cyberpunk 2077", "adventure");
                games.put("Red Dead Redemption 2", "action");
                games.put("God Of War Ragnarok", "adventure");
                games.put("Grand Theft Auto V", "action");
                games.put("Pro Evolutions Soccer 2020", "sports");
                games.put("Five Nights at Freddy's: Security Breach", "horror");

                // Game images and descriptions
                Map<String, String> gameImages = new HashMap<>();
                gameImages.put("The Witcher 3", "https://upload.wikimedia.org/wikipedia/en/thumb/0/0c/Witcher_3_cover_art.jpg/220px-Witcher_3_cover_art.jpg");
                gameImages.put("Cyberpunk 2077", "https://upload.wikimedia.org/wikipedia/en/9/9f/Cyberpunk_2077_box_art.jpg");
                gameImages.put("Red Dead Redemption 2", "https://upload.wikimedia.org/wikipedia/id/4/44/Red_Dead_Redemption_II.jpg");
                gameImages.put("God Of War Ragnarok", "https://image.api.playstation.com/vulcan/ap/rnd/202207/1210/4xJ8XB3bi888QTLZYdl7Oi0s.png");
                gameImages.put("Grand Theft Auto V", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx4E5VeiGZwu7lDvvyS7mY2eC0S79sdNiPsA&s");
                gameImages.put("Pro Evolutions Soccer 2020", "https://upload.wikimedia.org/wikipedia/en/thumb/2/2b/Pro_Evolution_Soccer_2020.jpg/220px-Pro_Evolution_Soccer_2020.jpg");
                gameImages.put("Five Nights at Freddy's: Security Breach", "https://th.bing.com/th/id/OIP.xrmJ9plcthUxchHGuLwCbQAAAA?cb=13&rs=1&pid=ImgDetMain");

                Map<String, String> gameDescriptions = new HashMap<>();
                gameDescriptions.put("The Witcher 3", "Explore the world of Geralt of Rivia in this action RPG.");
                gameDescriptions.put("Cyberpunk 2077", "Experience a futuristic city in this action RPG.");
                gameDescriptions.put("Red Dead Redemption 2", "Experience the Wild West in this open-world adventure game.");
                gameDescriptions.put("God Of War Ragnarok", "Embark on an epic adventure in this action game.");
                gameDescriptions.put("Grand Theft Auto V", "Experience open-world city adventures in this action game.");
                gameDescriptions.put("Pro Evolutions Soccer 2020", "Play football with realistic gameplay.");
                gameDescriptions.put("Five Nights at Freddy's: Security Breach", "Face the horrors in this horror game.");

                // Filter and display games
                for (Map.Entry<String, String> entry : games.entrySet()) {
                    String gameName = entry.getKey();
                    String gameGenre = entry.getValue();
                    if (showAll || gameGenre.equals(genre)) {
                        String gameUrl = "";
                        switch (gameName) {
                            case "The Witcher 3":
                                gameUrl = "game/witcher.jsp";
                                break;
                            case "Cyberpunk 2077":
                                gameUrl = "game/cyber.jsp";
                                break;
                            case "Red Dead Redemption 2":
                                gameUrl = "game/rdr.jsp";
                                break;
                            case "God Of War Ragnarok":
                                gameUrl = "game/gow.jsp";
                                break;
                            case "Grand Theft Auto V":
                                gameUrl = "game/gta.jsp";
                                break;
                            case "Pro Evolutions Soccer 2020":
                                gameUrl = "game/pes.jsp";
                                break;
                            case "Five Nights at Freddy's: Security Breach":
                                gameUrl = "game/fnaf.jsp";
                                break;
                        }
            %>
                <div class="card">
                    <img src="<%= gameImages.get(gameName) %>" alt="<%= gameName %>" class="card-image">
                    <h3><%= gameName %></h3>
                    <p><%= gameDescriptions.get(gameName) %></p>
                    <a href="<%= gameUrl %>">View Details</a>
                </div>
            <% 
                    }
                }
            %>
        </div>
    </section>

    <footer>
        <p>&copy; 2024 Sanndey Store</p>
        <div class="social-icons">
            <a href="#"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfRRtvpJnLgLejXR6VeZpBoUzwIwioifhOBA&s" alt="Facebook"></a>
            <a href="#"><img src="https://cdn-icons-png.flaticon.com/512/124/124021.png" alt="Twitter"></a>
            <a href="https://www.instagram.com/_isannnnn_/"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/2048px-Instagram_icon.png" alt="Instagram"></a>
        </div>
    </footer>
</body>
</html>
