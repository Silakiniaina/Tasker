<%@include file="debutLayout.jsp" %>
<%
    Vector<Collaborator> listCollaborator = (Vector<Collaborator>)request.getAttribute("listCollaborator");
%>
    <main class="main">
        <div class="main__title">Collaborator</div>
        <div class="main__content">
            <div class="container">
                <div class="container__head">
                    <div class="container__head--title">
                        <h3 class="container__head--title-disable">Collaborator</h3>/
                        <h3 class="container__head--title-active">All collaborators</h3>
                    </div>
                    <div class="container__head--btn">
                        <a href="InsertCollaborator">
                            <button><span>+</span> insert Collaborator</button>
                        </a>
                    </div>
                </div>
                <div class="container__content">
                    <table>
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>First name</th>
                                <th>Date of birth</th>
                                <th>username</th>
                                <th>role</th>
                                <th>speciality</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% for(Collaborator c : listCollaborator){ %>
                            <tr>
                                <td><%= c.getId() %></td>
                                <td><%= c.getName() %></td>
                                <td><%= c.getFirst_name() %></td>
                                <td><%= c.getDate_of_birth().toString() %></td>
                                <td><%= c.getUsername() %></td>
                                <td><%= c.getRole() %></td>
                                <td><%= c.getSpeciality() %></td>
                                <td>
                                    <div class="actions">
                                        <a href="InsertCollaborator?mode=u&&id=<%= c.getId() %>" class="edit">
                                            <i class="fa fa-bell"></i>    
                                        </a>
                                        <a href="AllCollaborator?mode=d&&id=<%= c.getId() %>" class="delete">
                                            <i class="fa fa-bell"></i>    
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        <% } %>
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
            </div>
        </div>
    </main>
</body>
</html>