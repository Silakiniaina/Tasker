<%@page import="java.util.ArrayList" %>
<%@page import="java.time.LocalDateTime" %>
<%@page import="java.sql.Timestamp" %>
<%@page import="shared.Utils" %>
<%@page import="model.Gender" %>
<%@page import="model.TaskCategory" %>
<%@page import="model.Task" %>
<%@page import="model.Collaborator" %>
<%@page import="model.Project" %>
<%@page import="model.Status" %>
<%@page import="model.Gender" %>

<%
    ArrayList<Collaborator> listCollaborator = (ArrayList<Collaborator>)request.getAttribute("listCollaborator");
    ArrayList<Status> listStatus = (ArrayList<Status>)request.getAttribute("listStatus");
    ArrayList<Gender> listGender = (ArrayList<Gender>)request.getAttribute("listGender");
    ArrayList<TaskCategory> listTaskCategory = (ArrayList<TaskCategory>)request.getAttribute("listTaskCategory");
    ArrayList<Project> listProject = (ArrayList<Project>)request.getAttribute("listProject");
    ArrayList<Task> listTask = (ArrayList<Task>)request.getAttribute("listTask");
    String user = (String)request.getAttribute("userType");
    Task updated = (Task)request.getAttribute("updated");
%>

<%@include file="../shared/sidebar.jsp" %>
    <h1 class="title">Task</h1>
    <div class="row modal fade" id="insert-modal" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true" style="background: transparent;backdrop-filter: blur(8px);">
        <div class="col-md-2"></div>
        <div class="modal-dialog modal-content col-md-8">
            <span class="exit-btn" data-bs-target="insert-modal">
                <svg xmlns="http://www.w3.org/2000/svg" width="42" height="42" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293z"/>
                </svg>
            </span>
            <h2 class="insert-title">Insertion form</h2>
            <form class="insert_modal" method="POST" action="task">
                <div class="input-container col-md-12">
                    <label for="validationDefaultUsername" class="form-label">Project</label>
                    <div class="input-group">
                        <select class="form-select" name="project" aria-label="Default select example" required>
                            <% 
                                for (Project p : listProject) { 
                                    String selected = "";
                                    if (updated != null && updated.getId().equals(p.getId())) {
                                        selected = "selected";
                                }
                            %>
                                <option value="<%= p.getId() %>" <%= selected %>><%= p.getName() %></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="input-container col-md-6">
                        <label for="validationDefault01" class="form-label">Title</label>
                        <input type="text" name="name"  value="<%= updated != null ? updated.getName() : "" %>" class="form-control" id="validationDefault01" placeholder="Name.."
                            required>
                    </div>
                    <div class="input-container col-md-6">
                        <label for="validationDefaultUsername" class="form-label">Task category</label>
                        <div class="input-group">
                            <select class="form-select" name="category" aria-label="Default select example" required>
                            <% 
                                for (TaskCategory tc : listTaskCategory) { 
                                    String selected = "";
                                    if (updated != null && updated.getIdTaskCategory().equals(tc.getId())) {
                                        selected = "selected";
                                }
                            %>
                                <option value="<%= tc.getId() %>" <%= selected %>><%= tc.getLabel() %></option>
                            <% } %>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="input-container col-md-6">
                        <label for="validationDefault02" class="form-label">Date start</label>
                        <input type="datetime-local" name="startDate" value="<%= updated != null ? Utils.formatDate(updated.getStartDate(),false) : Utils.formatDate(Timestamp.valueOf(LocalDateTime.now()), false) %>"  class="form-control" id="validationDefault02" required>
                    </div>
                    <div class="input-container col-md-6">
                        <label for="validationDefault02" class="form-label">Duration in h</label>
                        <input type="number" name="duration" min="1" value="<%= updated != null ? updated.getDurationHours() : "1" %>" class="form-control" id="validationDefault02" required>
                    </div>
                </div>
                <div class="input-container col-md-12">
                    <label for="validationDefaultUsername" class="form-label">Assignment</label>
                    <div class="input-group">
                        <select class="form-select" name="collaborator" aria-label="Default select example">
                            <option value="">Not assigned</option>
                            <%
                                for (Collaborator col : listCollaborator) { 
                                    String selected = "";
                                    if (updated != null && updated.getIdCollaborator() != null && updated.getIdCollaborator().equals(col.getId())) {
                                        selected = "selected";
                                        break;
                                    }
                            %>
                                <option value="<%= col.getId() %>" <%= selected %>><%= col.getName() %></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <div class="input-container col-md-12">
                    <label for="validationDefaultUsername" class="form-label">Status</label>
                    <div class="input-group">
                        <select class="form-select" name="status" aria-label="Default select example" required>
                            <% 
                                for (Status status : listStatus) { 
                                    String selected = "";
                                        if (updated != null && updated.getIdStatus().equals(status.getId())) {
                                            selected = "selected";
                                }
                            %>
                                <option value="<%= status.getId() %>" <%= selected %>><%= status.getLabel() %></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <div class="input-container col-12 mb-3">
                    <label for="validationDefaultUsername" class="form-label">Description</label>
                    <textarea class="form-control" name="description" aria-label="With textarea"><%= updated != null ? updated.getDescription() : "" %></textarea>
                </div>
                <input type="hidden" name="mode" value="<%= updated != null ? "u" : "i" %>" >
                <input type="hidden" name="id" value="<%= updated != null ? updated.getId() : "" %>" >
                <div class="input-container submit-btn col-md-12">
                    <button class="btn btn-primary" type="submit"><%= updated != null ? "Update" : "Insert" %></button>
                </div>
            </form>
        </div>
        <div class="col-md-2"></div>
    </div>
<div class="list row">
    <div class="list-head row">
        <div class="list-head-title col-md-10">
            List of task(<%= listTask != null ? listTask.size() : "0" %>)
        </div>
        <div class="cta-button col-md-2">
            <% if(user.equals("1")){ %>
                <div class="cta-button col-md-12">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#insert-modal">
                        Add
                    </button>
                </div>
            <% } %>
        </div>
    </div>
    <div class="list-content">
    <% for(Task t : listTask){ %>
        <div class="row">
            <div>
                <span class="d-flex row task-card" style="background-color: #FFFFFF;">
                    <div class="task-content col-md-7 d-flex">
                        <div class="col-md-12 task-content-head d-flex">
                            <% 
                                String status = "" ;
                                for(Status stat : listStatus){
                                    if(t.getIdStatus().equals(stat.getId())){
                                        status = stat.getLabel();
                                    }
                                }
                            %>
                            <div class="<%= status.toLowerCase() %> task-status">
                                <i class="fa fa-lightbulb" style="font-size: 20px;"></i>
                            </div>
                            <div class="task">
                                <b>#</b><%= t.getId() %>
                            </div>
                            <% 
                                String taskCategoryLabel = "";
                                for (TaskCategory tc : listTaskCategory) { 
                                    if (t.getIdTaskCategory().equals(tc.getId())) {
                                        taskCategoryLabel = tc.getLabel();
                                    }
                                }
                            %>
                            <div class="task-category"><%= taskCategoryLabel %></div>
                            <b><%= t.getName() %></b>
                            <div class="task-assignment d-flex">
                                <% 
                                    if(t.getIdCollaborator() != null){
                                        String name = "";
                                        String gender = "";
                                        for(Collaborator col : listCollaborator){ 
                                            if(col.getId().equals(t.getIdCollaborator())){
                                                name = col.getName();
                                                for(Gender g : listGender){
                                                    if(g.getId().equals(col.getIdGender())){
                                                        gender = g.getLabel();
                                                        break;
                                                    }
                                                }
                                                break;
                                            }
                                        }
                                %>
                                    <div>
                                        <img src="assets/images/<%= gender.toLowerCase() %>.png" alt="Abigail" style="border-radius: 50%; width: 30px; height: 30px;">
                                    </div>
                                    <b><%= name %></b>
                                <% } else{ %> 
                                    <b>Not assigned</b> 
                                <% } %>
                            </div>
                        </div>
                        <p class="task-description">
                            <%= t.getDescription() %>
                        </p>
                    </div>
                    <div class="task-config col-md-5">
                        <div class="col-md-11 task-config-info">
                            <div class="col-md-12 d-flex category">
                            <% 
                                String projectLabel = "";
                                for(Project p : listProject){ 
                                    if(t.getIdProject().equals(p.getId())){
                                        projectLabel = p.getName();
                                    }
                                }
                            %>
                                <div class="project">
                                    <b>Project : </b>
                                    <%= projectLabel %>
                                </div>
                            </div>
                            <div class="col-md-12 assignment">
                                <div class="d-flex">
                                    <div class="timer">
                                        <b>Start date : </b>
                                        <div class="task-chrono start-date">
                                            <i class="fa fa-hourglass-start"></i>
                                            <%= Utils.formatDate(t.getStartDate(),false) %>
                                        </div>
                                    </div>
                                    <div class="timer">
                                        <b>End date : </b>
                                        <div class="task-chrono end-date">
                                            <i class="fa fa-hourglass-end"></i>
                                            <%= Utils.formatDate(t.getEndDate(),false) %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1 task-config-action">
                            <div class="dropdown">
                                <i class="fa fa-ellipsis-v dropdown-toggle" id="dropendMenuButton"
                                    data-bs-toggle="dropdown" aria-expanded="true">
                                </i>
                                <ul class="dropdown-menu" aria-labelledby="dropendMenuButton"
                                    style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(153px, -158px);">
                                    <li>
                                        <a class="dropdown-item" href="task?mode=u&id=<%= t.getId() %>">Edit</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="task?mode=d&id=<%= t.getId() %>">Delete</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </span>
            </div>
        </div>
    <% } %>
</div>
<%@include file="../shared/footer.jsp" %>
