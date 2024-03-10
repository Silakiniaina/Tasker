<%@page import="java.util.*" %>
<%
    Vector<HashMap<String,String>> listSpeciality = (Vector<HashMap<String,String>>)request.getAttribute("listSpeciality");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index</title>
    <link rel="stylesheet" href="./assets/css/auth.css">
</head>
<body>
    <div class="container__auth">
        <div class="container__auth--head">
            <div class="container__auth--head-logo">
                <h1>TASKER</h1>
            </div>
            <div class="container__auth--head-label">
                <h2>Welcome to Tasker !</h2>
                <p>Please sign-in to your account and start the adventure</p>
            </div>
        </div>
        <div class="container__auth--content">
            <form action="AllCollaborator"method="POST">
                <div class="container__auth--content-input">
                    <label for="input_first_name">first name</label>
                    <input type="text"placeholder="Enter your first name"id="input_first_name"required>
                </div>
                <div class="container__auth--content-input">
                    <label for="input_name">name</label>
                    <input type="text"placeholder="Enter your name"id="input_name"required>
                </div>
                <div class="container__auth--content-input">
                    <label for="input_name">date of birth</label>
                    <input type="date"placeholder="Enter your name"id="input_name"required>
                </div>
                <div class="container__auth--content-input">
                    <label for="input_username">Username</label>
                    <input type="text"placeholder="Enter your username"id="input_username"required>
                </div>
                <div class="container__auth--content-input">
                    <label for="input_speciality">Speciality</label>
                    <select name="speciality" id="input_speciality">
                        <option value="#">None</option>
                        <% for(HashMap<String,String>> map : listSpeciality){ %>
                            <option value="<%= map.get("id") %>"><%= map.get("libelle") %></option>
                        <% } %>
                    </select>
                </div>
                <div class="container__auth--content-input">
                    <label for="input_password">Password</label>
                    <input type="password"placeholder="**********"id="input_password"required>
                </div>
                <div class="container__auth--content-btn">
                    <button type="submit">Sign Up</button>
                </div>
                <div class="container__auth--content-links">
                    <p>Already have an account ? <a href="index.jsp">Sign In</a></p>
                </div>
            </form>
        </div>
    </div>
</body>
</html>