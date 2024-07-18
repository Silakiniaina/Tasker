<%@page import="java.util.ArrayList" %>
<%@page import="java.time.LocalDate" %>
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
                        <input type="date" name="startDate" value="<%= updated != null ? updated.getStartDate().toString() : LocalDate.now() %>"  class="form-control" id="validationDefault02" required>
                    </div>
                    <div class="input-container col-md-6">
                        <label for="validationDefault02" class="form-label">Deadline</label>
                        <input type="date" name="deadline" value="<%= updated != null ? updated.getEndDate().toString() : LocalDate.now() %>" class="form-control" id="validationDefault02" required>
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
                        <div class="d-flex">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-lightbulb" viewBox="0 0 16 16">
                                <path d="M2 6a6 6 0 1 1 10.174 4.31c-.203.196-.359.4-.453.619l-.762 1.769A.5.5 0 0 1 10.5 13a.5.5 0 0 1 0 1 .5.5 0 0 1 0 1l-.224.447a1 1 0 0 1-.894.553H6.618a1 1 0 0 1-.894-.553L5.5 15a.5.5 0 0 1 0-1 .5.5 0 0 1 0-1 .5.5 0 0 1-.46-.302l-.761-1.77a2 2 0 0 0-.453-.618A5.98 5.98 0 0 1 2 6m6-5a5 5 0 0 0-3.479 8.592c.263.254.514.564.676.941L5.83 12h4.342l.632-1.467c.162-.377.413-.687.676-.941A5 5 0 0 0 8 1"/>
                            </svg>
                            <b><%= t.getName() %></b>
                        </div>
                        <p><%= t.getDescription() %></p>
                    </div>
                    <div class="task-config col-md-5">
                        <div class="task-chrono d-flex">
                            <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-stopwatch" viewBox="0 0 16 16">
                                <path d="M8.5 5.6a.5.5 0 1 0-1 0v2.9h-3a.5.5 0 0 0 0 1H8a.5.5 0 0 0 .5-.5z"/>
                                <path d="M6.5 1A.5.5 0 0 1 7 .5h2a.5.5 0 0 1 0 1v.57c1.36.196 2.594.78 3.584 1.64l.012-.013.354-.354-.354-.353a.5.5 0 0 1 .707-.708l1.414 1.415a.5.5 0 1 1-.707.707l-.353-.354-.354.354-.013.012A7 7 0 1 1 7 2.071V1.5a.5.5 0 0 1-.5-.5M8 3a6 6 0 1 0 .001 12A6 6 0 0 0 8 3"/>
                            </svg>
                            <b  style="font-size: 14px;"><%= t.getEndDate().toString() %></b>
                        </div>
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
                        <div class="d-flex" style="gap: 10px;">
                            <% if(user.equals("1")){ %>
                                <a href="task?mode=u&id=<%= t.getId() %>">
                                    <button type="button" class="edit-btn btn btn-outline-info">
                                        <i class="far fa-edit"></i>
                                    </button>
                                </a>
                                <a href="task?mode=d&id=<%= t.getId() %>">
                                    <button type="button" class="delete-btn btn btn-outline-danger">
                                        <i class="fa fa-trash"></i>
                                    </button>
                                </a>
                            <% } %>
                        </div>
                    </div>
                </span>
            </div>
        </div>
    <% } %>
    </div>
</div>
<%@include file="../shared/footer.jsp" %>
