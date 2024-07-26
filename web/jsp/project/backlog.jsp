<%@page import="com.google.gson" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.ArrayList" %>
<%@page import="model.Project" %>
<%@page import="model.Task" %>
<%@page import="model.Collaborator" %>
<%@page import="model.Role" %>
<%@page import="model.Team" %>
<%@page import="model.Priority" %>
<%@page import="model.Gender" %>
<%@page import="model.TaskCategory" %>
<%@page import="model.ProjectCategory" %>

<% 
    HashMap<String,ArrayList<Task>> listTasks = (HashMap<String,ArrayList<Task>>)request.getAttribute("listTasks");
    ArrayList<Collaborator> listCollaborator = (ArrayList<Collaborator>)request.getAttribute("listCollaborator");
    ArrayList<Role> listRole = (ArrayList<Role>)request.getAttribute("listRole");
    ArrayList<TaskCategory> listTaskCategory = (ArrayList<TaskCategory>)request.getAttribute("listTaskCategory");
    ArrayList<Priority> listPriority = (ArrayList<Priority>)request.getAttribute("listPriority");
    ArrayList<ProjectCategory> listProjectCategory = (ArrayList<ProjectCategory>)request.getAttribute("listProjectCategory");
    ArrayList<Team> listTeam = (ArrayList<Team>)request.getAttribute("listTeam");
    Project project = (Project)request.getAttribute("project");
    String updated = (String)request.getAttribute("updated"); 
%>

<%@include file="../shared/sidebar.jsp" %>
<div class="col-md-12 container project-information d-flex">
    <div class="col-md-6 col-sm-12 project-description">
        <div class="col-md-12 project-description-head d-flex justify-content-between align-items-center">
            <div class="title-category col-md-10">
                <h2 class="col-md-6 project-title"><%= project.getName() %></h2>
                <%
                    String projectCategory = "";
                    for(ProjectCategory pc : listProjectCategory){
                        if(project.getIdProjectCategory().equals(pc.getId())){
                            projectCategory = pc.getLabel();
                            break;
                        }
                    }
                %>
                <b class="col-md-4"><%= projectCategory %>
                </b>
                <div class="col-md-2 priority normal">
                    <i class="fas fa-bookmark" style="color: black;"></i>
                    <%
                        String projectPriority = "";
                        for(Priority priori : listPriority){
                            if(project.getIdPriority().equals(priori.getId())){
                                projectPriority = priori.getLabel();
                                break;
                            }
                        }
                    %>
                    <b><%= projectPriority %></b>
                </div>
            </div>
            <span class="col-md-2 project-status badge rounded-pill <%= project.getStatus() %>"><%= project.getStatus() %></span>
        </div>
        <p class="col-md-12"><%= project.getDescription() %></p>
        <div class="col-md-12 project-duration">
            <div class="col-md-6 col-sm-6 start-date">
                <b>Start date : </b><%= project.getStartDate().toString() %>
            </div>
            <div class="col-md-6 col-sm-6 deadline">
                <b>Deadline : </b><%= project.getEndDate().toString() %>
            </div>
        </div>
        <div class="col-md-12 project-responsable">
            <% 
                String name = "";
                String gender = "";
                for(Collaborator col : listCollaborator){ 
                    if(col.getId().equals(project.getIdResponsable())){
                        name = col.getName();
                        for(Gender g : listGender){
                            if(g.getId().equals(col.getIdGender())){
                                gender = g.getLabel();
                                break;
                            }
                        }
                        break; 
            }} %>
            <b>Responsable : </b>
            <img src="assets/images/<%= gender.toLowerCase() %>.png" alt="User 1">
            <%= name %>
        </div>
        <div class="col-md-12 project-team">
            <b>Team : </b>
            <div>
                <ul class="list-group ">
                    <%
                        for(Team t : listTeam){
                            String nameTeam = "";
                            String genderTeam = "";
                            String roleTeam = "";
                            for(Collaborator col : listCollaborator){ 
                                if(col.getId().equals(t.getIdCollaborator())){
                                    nameTeam = col.getName();
                                    for(Gender g : listGender){
                                        if(g.getId().equals(col.getIdGender())){
                                            genderTeam = g.getLabel();
                                            break;
                                        }
                                    }

                                    for(Role r : listRole){
                                        if(r.getId().equals(col.getIdRole())){
                                            roleTeam = r.getLabel();
                                            break;
                                        }
                                    }
                                    break; 
                                }
                            }
                    %>
                    <li class="list-group-item d-flex justify-content-between">
                        <div class="collab-item">
                            <img src="../../../assets/images/<%= genderTeam %>.png" alt="">
                            <%= nameTeam %>
                        </div>
                        <div class="collab-work">
                            <b>#</b><%= roleTeam %>
                        </div>
                        <b><%= t.getAssignedTask() %> Tasks </b>
                        <b><%= t.getPercentage() %>%</b>
                    </li>
                    <% } %>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-sm-12 project-stat">
        <canvas id="project_evolution"></canvas>
    </div>
</div>
<div class="col-md-12 container mt-4 backlog-container">
    <h1>Backlog</h1>
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    <h5>Sheduled tasks</h5>
                </div>
                <div class="card-body">
                    <div class="add-task">
                        <i class="fas fa-plus"></i> Add Task
                    </div>
                    <!-- Exemple de structure pour une tâche -->
                    <%
                        ArrayList<Task> sheduledTasks = listTasks.get("sheduled");
                        for(Task task : sheduledTasks){
                    %>
                        <div class="task-card p-3">
                            <div class="task-card-head d-flex justify-content-between">
                                <h6><%= task.getName() %></h6>
                                <div class="task-id">
                                    <b>#</b><%= task.getId() %>
                                </div>
                            </div>
                            <p class="text-muted small"><%= task.getDescription() %></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <% 
                                        String taskCategoryLabel = "";
                                        for (TaskCategory tc : listTaskCategory) { 
                                            if (task.getIdTaskCategory().equals(tc.getId())) {
                                                taskCategoryLabel = tc.getLabel();
                                            }
                                        }
                                    %>
                                    <span><%= taskCategoryLabel %></span>
                                </div>
                                <div class="avatar">
                                    <% 
                                        String nameTask = "";
                                        String genderTask = "";
                                        for(Collaborator col : listCollaborator){ 
                                            if(col.getId().equals(project.getIdResponsable())){
                                                nameTask = col.getName();
                                                for(Gender g : listGender){
                                                    if(g.getId().equals(col.getIdGender())){
                                                        genderTask = g.getLabel();
                                                        break;
                                                    }
                                                }
                                                break; 
                                    }} %>
                                    <img src="assets/images/<%= genderTask.toLowerCase() %>.png" alt="User 1">
                                    <%= nameTask %>
                                </div>
                            </div>
                            <div class="progress mb-3">
                                <div class="progress-bar bg-info text-dark w-<%= Math.round(task.getProgress()) %>" role="progressbar" aria-valuenow="<%= task.getProgress() %>"
                                    aria-valuemin="0" aria-valuemax="100"><%= task.getProgress() %>%</div>
                            </div>
                        </div>
                    <% } %>
                    <!-- Répétez cette structure pour chaque tâche -->
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    <h5>Projgressing tasks</h5>
                </div>
                <div class="card-body">
                    <div class="add-task">
                        <i class="fas fa-plus"></i> Add Task
                    </div>
                    <!-- Exemple de structure pour une tâche -->
                    <%
                        ArrayList<Task> progressingTask = listTasks.get("progressing");
                        for(Task task : progressingTask){
                    %>
                        <div class="task-card p-3">
                            <div class="task-card-head d-flex justify-content-between">
                                <h6><%= task.getName() %></h6>
                                <div class="task-id">
                                    <b>#</b><%= task.getId() %>
                                </div>
                            </div>
                            <p class="text-muted small"><%= task.getDescription() %></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <% 
                                        String taskCategoryLabel = "";
                                        for (TaskCategory tc : listTaskCategory) { 
                                            if (task.getIdTaskCategory().equals(tc.getId())) {
                                                taskCategoryLabel = tc.getLabel();
                                            }
                                        }
                                    %>
                                    <span><%= taskCategoryLabel %></span>
                                </div>
                                <div class="avatar">
                                    <% 
                                        String nameTask = "";
                                        String genderTask = "";
                                        for(Collaborator col : listCollaborator){ 
                                            if(col.getId().equals(project.getIdResponsable())){
                                                nameTask = col.getName();
                                                for(Gender g : listGender){
                                                    if(g.getId().equals(col.getIdGender())){
                                                        genderTask = g.getLabel();
                                                        break;
                                                    }
                                                }
                                                break; 
                                    }} %>
                                    <img src="assets/images/<%= genderTask.toLowerCase() %>.png" alt="User 1">
                                    <%= nameTask %>
                                </div>
                            </div>
                            <div class="progress mb-3">
                                <div class="progress-bar bg-info text-dark w-<%= Math.round(task.getProgress()) %>" role="progressbar" aria-valuenow="<%= task.getProgress() %>"
                                    aria-valuemin="0" aria-valuemax="100"><%= task.getProgress() %>%</div>
                            </div>
                        </div>
                    <% } %>
                    <!-- Répétez cette structure pour chaque tâche -->
                </div>
            </div>
        </div>

                <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    <h5>Finished tasks</h5>
                </div>
                <div class="card-body">
                    <div class="add-task">
                        <i class="fas fa-plus"></i> Add Task
                    </div>
                    <!-- Exemple de structure pour une tâche -->
                    <%
                        ArrayList<Task> finishedTasks = listTasks.get("finished");
                        for(Task task : finishedTasks){
                    %>
                        <div class="task-card p-3">
                            <div class="task-card-head d-flex justify-content-between">
                                <h6><%= task.getName() %></h6>
                                <div class="task-id">
                                    <b>#</b><%= task.getId() %>
                                </div>
                            </div>
                            <p class="text-muted small"><%= task.getDescription() %></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <% 
                                        String taskCategoryLabel = "";
                                        for (TaskCategory tc : listTaskCategory) { 
                                            if (task.getIdTaskCategory().equals(tc.getId())) {
                                                taskCategoryLabel = tc.getLabel();
                                            }
                                        }
                                    %>
                                    <span><%= taskCategoryLabel %></span>
                                </div>
                                <div class="avatar">
                                    <% 
                                        String nameTask = "";
                                        String genderTask = "";
                                        for(Collaborator col : listCollaborator){ 
                                            if(col.getId().equals(project.getIdResponsable())){
                                                nameTask = col.getName();
                                                for(Gender g : listGender){
                                                    if(g.getId().equals(col.getIdGender())){
                                                        genderTask = g.getLabel();
                                                        break;
                                                    }
                                                }
                                                break; 
                                    }} %>
                                    <img src="assets/images/<%= genderTask.toLowerCase() %>.png" alt="User 1">
                                    <%= nameTask %>
                                </div>
                            </div>
                            <div class="progress mb-3">
                                <div class="progress-bar bg-info text-dark w-<%= Math.round(task.getProgress()) %>" role="progressbar" aria-valuenow="<%= task.getProgress() %>"
                                    aria-valuemin="0" aria-valuemax="100"><%= task.getProgress() %>%</div>
                            </div>
                        </div>
                    <% } %>
                    <!-- Répétez cette structure pour chaque tâche -->
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../shared/footer.jsp" %>