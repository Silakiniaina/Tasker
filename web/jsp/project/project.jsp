
<%@page import="java.util.ArrayList" %>
<%@page import="java.time.LocalDateTime" %>
<%@page import="model.Project" %>
<%@page import="model.ProjectCategory" %>
<%@page import="model.Status" %>
<%@page import="model.Gender" %>
<%@page import="com.google.gson.Gson" %>
<%@page import="model.Collaborator" %>

<%
    ArrayList<Collaborator> listCollaborator = (ArrayList<Collaborator>)request.getAttribute("listCollaborator");
    ArrayList<Status> listStatus = (ArrayList<Status>)request.getAttribute("listStatus");
    ArrayList<Gender> listGender = (ArrayList<Gender>)request.getAttribute("listGender");
    ArrayList<ProjectCategory> listProjectCategory = (ArrayList<ProjectCategory>)request.getAttribute("listProjectCategory");
    ArrayList<Project> listProject = (ArrayList<Project>)request.getAttribute("listProject");
    String user = (String)request.getAttribute("userType");
    Project updated = (Project)request.getAttribute("updated");
%>
<%@include file="../shared/sidebar.jsp" %>
            <h1 class="title">Project</h1>
            <div class="row modal fade" id="insert-modal" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true" style="background: transparent;backdrop-filter: blur(8px);">
                <div class="col-md-2"></div>
                <div class="modal-dialog modal-content col-md-8">
                    <span class="exit-btn" data-bs-target="insert-modal">
                        <svg xmlns="http://www.w3.org/2000/svg" width="42" height="42" fill="currentColor"
                            class="bi bi-x-circle-fill" viewBox="0 0 16 16">
                            <path
                                d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293z" />
                        </svg>
                    </span>
                    <h2 class="insert-title">Insertion form</h2>
                    <form class="insert_modal" action="project" method="POST">
                        <div class="row">
                            <div class="input-container col-md-6">
                                <label for="validationDefault01" class="form-label">Project Name</label>
                                <input type="text" name="name" class="form-control" id="validationDefault01" placeholder="Name.." value="<%= updated !=  null ? updated.getName() : "" %>" required>
                            </div>
                            <div class="input-container col-md-6">
                                <label for="validationDefaultUsername" class="form-label">Category</label>
                                <div class="input-group">
                                    <select class="form-select" name="category" aria-label="Default select example" required>
                                        <% 
                                            for (ProjectCategory category : listProjectCategory) { 
                                                String selected = "";
                                                if (updated != null && updated.getIdProjectCategory().equals(category.getId())) {
                                                    selected = "selected";
                                            }
                                        %>
                                            <option value="<%= category.getId() %>" <%= selected %>><%= category.getLabel() %></option>
                                        <% } %>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="input-container col-md-6">
                                <label for="validationDefault02" class="form-label">Start Date</label>
                                <input type="date" name="startDate" class="form-control" id="validationDefault02" value="<%= updated != null ? updated.getStartDate().toString() : LocalDateTime.now() %>" required>
                            </div>
                            <div class="input-container col-md-6">
                                <label for="validationDefault02" class="form-label">End Date</label>
                                <input type="date" name="deadline" class="form-control" id="validationDefault02" value="<%= updated != null ? updated.getEndDate().toString() : LocalDateTime.now() %>" required>
                            </div>    
                        </div>
                        <div class="input-container col-md-12">
                            <label for="validationDefaultUsername" class="form-label">Responsable</label>
                            <div class="input-group">
                                <select class="form-select" name="responsable" aria-label="Default select example" required>
                                    <% 
                                        for (Collaborator responsable : listCollaborator) { 
                                            String selected = "";
                                                if (updated != null && updated.getIdResponsable().equals(responsable.getId())) {
                                                    selected = "selected";
                                        }
                                    %>
                                        <option value="<%= responsable.getId() %>" <%= selected %>><%= responsable.getName() %></option>
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
                        <div class="input-container col-12">
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
            <div class="row modal fade" id="filter-modal" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true" style="background: transparent;backdrop-filter: blur(8px);">
                <div class="col-md-2"></div>
                <div class="modal-dialog modal-content col-md-8">
                    <span class="exit-btn" data-bs-target="insert-modal">
                        <svg xmlns="http://www.w3.org/2000/svg" width="42" height="42" fill="currentColor"
                            class="bi bi-x-circle-fill" viewBox="0 0 16 16">
                            <path
                                d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293z" />
                        </svg>
                    </span>
                    <h2 class="insert-title">Insertion form</h2>
                    <form class="insert_modal" action="project">
                        <div class="row">
                            <div class="input-container col-md-6">
                                <label for="validationDefault01" class="form-label">Project Name</label>
                                <input type="text" name="name" class="form-control" id="validationDefault01" placeholder="Name.."required>
                            </div>
                            <div class="input-container col-md-6">
                                <label for="validationDefaultUsername" class="form-label">Category</label>
                                <div class="input-group">
                                    <select class="form-select" name="category" aria-label="Default select example" required>
                                        <option selected>Category 1</option>
                                        <option value="1">One</option>
                                        <option value="2">Two</option>
                                        <option value="3">Three</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-container col-md-6">
                                <label for="validationDefault02" class="form-label">Start Date Debut</label>
                                <input type="date" name="startDateDebut" class="form-control" id="validationDefault02" required>
                            </div>
                            <div class="input-container col-md-6">
                                <label for="validationDefault02" class="form-label">Start Date End</label>
                                <input type="date" name="startDateEnd" class="form-control" id="validationDefault02" required>
                            </div>    
                        </div>
                        <div class="row">
                            <div class="input-container col-md-6">
                                <label for="validationDefault02" class="form-label">Deadline Debut</label>
                                <input type="date" name="deadlineDebut" class="form-control" id="validationDefault02" required>
                            </div>
                            <div class="input-container col-md-6">
                                <label for="validationDefault02" class="form-label">Deadline End</label>
                                <input type="date" name="deadlineEnd" class="form-control" id="validationDefault02" required>
                            </div>    
                        </div>
                        <div class="input-container col-md-12">
                            <label for="validationDefaultUsername" class="form-label">Responsable</label>
                            <div class="input-group">
                                <select class="form-select" name="idResponsable" aria-label="Default select example" required>
                                    <option selected>Open this select menu</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                                </select>
                            </div>
                        </div>
                        <div class="input-container col-md-12">
                            <label for="validationDefaultUsername" class="form-label">Status</label>
                            <div class="input-group">
                                <select class="form-select" name="status" aria-label="Default select example" required>
                                    <option selected>Open this select menu</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                                </select>
                            </div>
                        </div>
                        <div class="input-container submit-btn col-md-12">
                            <button class="btn btn-primary" type="submit">Filter</button>
                        </div>
                    </form>
                </div>
                <div class="col-md-2"></div>
            </div>
            <div class="list row">
                <div class="list-head row">
                    <div class="list-head-title col-md-8">
                        List of project(<%= listProject != null ? listProject.size() : "0" %>)
                    </div>
                    <% if(user.equals("1")){ %>
                        <div class="cta-button col-md-2">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#insert-modal">
                                    Add
                                </button>
                        </div>
                        <div class="cta-button col-md-2">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#filter-modal">
                                Filter
                            </button>
                        </div>
                    <% } %>
                </div>
                <div class="list-content d-flex flex-wrap">
                    <% for(Project p : listProject){ %>
                        <div class="col-12 col-md-6 col-lg-4 mb-4 d-flex align-items-center">
                            <div class="project-card card">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <span class="project-title"><%= p.getName() %></span>
                                        <% 
                                            String label = "";
                                            for (Status status : listStatus) { 
                                                if ( p.getIdStatus().equals(status.getId())) {
                                                    label = status.getLabel();
                                                    break;
                                            }
                                        %>
                                        <% } %>
                                        <div>
                                            <span class="status-badge"><%= label %></span>
                                        </div>
                                </div>
                                <p class="mb-3"><%= p.getDescription() %></p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <div class="project-date mb-2"><i class="fas fa-calendar-alt me-1"></i>
                                            <%= p.getStartDate().toString() %></div>
                                        <div class="avatar-group"> R :
                                            <% 
                                                String name = "";
                                                String gender = "";
                                                for(Collaborator col : listCollaborator){ 
                                                    if(col.getId().equals(p.getIdResponsable())){
                                                        name = col.getName();
                                                        for(Gender g : listGender){
                                                            if(g.getId().equals(col.getIdGender())){
                                                                gender = g.getLabel();
                                                                break;
                                                            }
                                                        }
                                                        break;
                                                    }
                                                %>
                                                <% } %>
                                                <img src="assets/images/<%= gender.toLowerCase() %>.png" alt="User 1">
                                                <%= name %>
                                        </div>
                                    </div>
                                    <div>
                                    <% if(user.equals("1")){ %>
                                        <a href="project?mode=u&id=<%= p.getId() %>">
                                            <button type="button" class="edit-btn btn btn-outline-info">
                                                <i class="far fa-edit"></i>
                                            </button>
                                        </a>
                                        <a href="project?mode=d&id=<%= p.getId() %>">
                                            <button type="button" class="delete-btn btn btn-outline-danger">
                                                <i class="fa fa-trash"></i>
                                            </button>
                                        </a>
                                    <% } %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <% } %>
                </div>
            </div>
<%@include file="../shared/footer.jsp" %>