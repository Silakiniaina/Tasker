<%@page import="java.util.HashMap" %>
<%@page import="java.util.ArrayList" %>
<%@page import="model.Project" %>
<%@page import="model.Team" %>
<%@page import="model.Collaborator" %>

<%
    HashMap<String,ArrayList<String>> listTeam = (HashMap<String,ArrayList<String>>)request.getAttribute("listTeam");
    ArrayList<Project> listProject  = (ArrayList<Project>)request.getAttribute("listProject");
    ArrayList<Collaborator> listCollaborator  = (ArrayList<Collaborator>)request.getAttribute("listCollaborator");
%>

<%@include file="../shared/sidebar" %>
<div class="row modal fade" id="insert-modal" tabindex="-1" aria-labelledby="exampleModalLabel"
    aria-hidden="true" style="background: transparent;backdrop-filter: blur(8px);">
    <div class="col-md-2"></div>
    <div class="modal-dialog modal-content col-md-8">
        <span class="exit-btn" data-bs-target="insert-modal">
            <svg xmlns="http://www.w3.org/2000/svg" width="42" height="42" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293z"/>
            </svg>
        </span>
        <form class="insert-collaborator">
            <legend>Select Collaborators:</legend>
            <fieldset class="collaborator-list">
                <label class="col-md-6">
                    <input type="checkbox" name="collaborators" value="1">
                        Sanda Silakiniaina
                </label><br>
                <label class="col-md-6">
                    <input type="checkbox" name="collaborators" value="1">
                        Sanda Silakiniaina
                </label><br>
                <label class="col-md-6">
                    <input type="checkbox" name="collaborators" value="1">
                        Sanda Silakiniaina
                </label><br>
                <label class="col-md-6">
                    <input type="checkbox" name="collaborators" value="1">
                        Sanda Silakiniaina
                </label><br>
            </fieldset>
            <div class="input-container submit-btn col-md-12">
                <button class="btn btn-primary" type="submit">Add</button>
            </div>
        </form>
    </div>
    <div class="col-md-2"></div>
</div>
<div class="list row">
    <div class="list-head row">
        <div class="list-head-title col-md-8">
            List of Teams
        </div>
    </div>
    <div class="row list-content">
        <% for(Project p : listProject){ %>
            <div class="col-md-4 card-container">
                <div class="card team-card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0" id="projectName"><%= p.getName() %></h5>
                    </div>
                    <div class="card-body">
                        <h6 class="card-subtitle mb-2 text-muted">Team Members</h6>
                        <ul class="list-group" id="collaboratorList">
                            <%
                                ArrayList<String> collaboratorIds = listTeam.get(p.getId());
                                for(String collaboratorId : collaboratorIds){
                                    String name = "";
                                    for(Collaborator c : listCollaborator){
                                        if(collaboratorId.equals(c.getId())){
                                            name = c.getName();
                                        }
                                    }
                            %>
                                <li class="list-group-item">
                                    <%= name %>
                                    <button class="btn btn-danger btn-sm">
                                        <i class="fas fa-user-minus"></i>
                                    </button>
                                </li>
                            <% } %>
                        </ul>
                    </div>
                    <div class="card-footer">
                        <button class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#insert-modal">
                            <i class="fas fa-user-plus"></i> Add Collaborator
                        </button>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
</div>
<%@include file="../shared/footer.jsp" %>