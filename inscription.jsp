<%@page import="java.util.*" %>
<%@page import="java.time.*" %>
<%@page import="models.Collaborator" %>
<%
    Vector<HashMap<String,String>> listSpeciality = (Vector<HashMap<String,String>>)request.getAttribute("listSpeciality");
    Collaborator c = (Collaborator)request.getAttribute("collaborator");
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
                <h2>Adventure starts here!</h2>
                <p>Make your project management easy and fun !</p>
            </div>
            <div class="error">
                <% 
                    String error = "";
                    if(request.getAttribute("error") != null)error = (String)request.getAttribute("error");
                %>
                <p><%= error %></p>
            </div>
        </div>
        <div class="container__auth--content">
            <form action="AllCollaborator"method="POST">
                <div class="container__auth--content-input">
                    <label for="input_first_name">first name</label>
                    <%
                        String first_name = "";
                        if(c != null)first_name = c.getFirst_name();
                    %>
                    <input type="text"name="first_name"value="<%= first_name %>"placeholder="Enter your first name"id="input_first_name"required>
                </div>
                <div class="container__auth--content-input">
                    <label for="input_name">name</label>
                    <%
                        String name = "";
                        if(c != null)name = c.getName();
                    %>
                    <input type="text"name="name"value="<%= name %>"placeholder="Enter your name"id="input_name"required>
                </div>
                <div class="container__auth--content-input">
                    <label for="input_name">date of birth</label>
                    <%
                        String dt = LocalDate.now().toString();
                        if(c != null)dt = c.getDate_of_birth().toString();
                    %>
                    <input type="date"name="date_of_birth"value="<%= dt %>"placeholder="Enter your name"id="input_name"required>
                </div>
                <div class="container__auth--content-input">
                    <label for="input_username">Username</label>
                    <%
                        String username = "";
                        if(c != null)username = c.getUsername();
                    %>
                    <input type="text"name="username"value="<%= username %>"placeholder="Enter your username"id="input_username"required>
                </div>
                <div class="container__auth--content-input">
                    <label for="input_speciality">Speciality</label>
                    <select name="speciality" id="input_speciality">
                        <option value="0">None</option>
                        <%  for(HashMap<String,String> map : listSpeciality){ %>
                        <%
                                int id = Integer.parseInt(map.get("id"));
                                if(c != null && id == c.getSpeciality()){ 
                        %>
                                    <option value="<%= map.get("id") %>"selected><%= map.get("libelle") %></option>
                        <% 
                                }else{ 
                        %>
                                    <option value="<%= map.get("id") %>"><%= map.get("libelle") %></option>
                        <%
                                }
                            } 

                        %>
                    </select>
                </div>
                <div class="container__auth--content-input">
                    <label for="input_password">Password</label>
                    <input type="password"name="password"placeholder="**********"id="input_password"required>
                </div>
                <input type="hidden"value="i"name="mode">
                <div class="container__auth--content-btn">
                    <% 
                        String label = "Insert";
                        if(c != null)label="Update";
                    %>
                    <button type="submit"><%= label %></button>
                </div>
                <input type="hidden" value="u"name="mode">
                <%
                    int id = -1;
                    if(c != null)id = c.getId();
                %>
                <input type="hidden" value="<%= id %>"name="id">
            </form>
        </div>
    </div>
</body>
</html>