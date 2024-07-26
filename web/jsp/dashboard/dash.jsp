    <%@page import="java.util.ArrayList" %>
    <%@page import="com.google.gson.Gson" %>
    <%@page import="java.util.HashMap" %>
    <%@page import="java.time.LocalDate" %>
    <%@page import="model.Collaborator" %>
    <%@page import="model.Gender" %>
    <%@page import="model.Project" %>
    <%
        HashMap<String, Integer> number = (HashMap<String, Integer>)request.getAttribute("number");
        HashMap<String, Integer> numberProjectByCategory = (HashMap<String, Integer>)request.getAttribute("numberProjectByCategory");
        String updated = (String)request.getAttribute("updated");
    %>
    <%@include file ="../shared/sidebar.jsp" %>
    <div class="container mt-4">
        <h1 class="mb-4 text-center"><i class="fas fa-chart-line"></i> Dashboard de Gestion de Projet</h1>
        <div class="row">
            <!-- Vue d'ensemble des projets -->
            <div class="col-md-6 mb-4">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5 class="card-title mb-0"><i class="fas fa-project-diagram"></i> Vue d'ensemble des projets</h5>
                    </div>
                    <div class="card-body">
                        <div class="info-item">
                            <i class="fas fa-clipboard-list"></i>
                            <span>Nombre total de projets : <strong id="totalProjects"></strong></span>
                        </div>
                        <div class="chart-container">
                            <canvas id="projectCategoriesChart"></canvas>
                        </div>
                        <div class="chart-container mt-3">
                            <canvas id="projectPrioritiesChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Tâches -->
            <div class="col-md-6 mb-4">
                <div class="card">
                    <div class="card-header bg-success text-white">
                        <h5 class="card-title mb-0"><i class="fas fa-tasks"></i> Tâches</h5>
                    </div>
                    <div class="card-body">
                        <div class="info-item">
                            <i class="fas fa-list-ol"></i>
                            <span>Nombre total de tâches : <strong id="totalTasks"></strong></span>
                        </div>
                        <div class="chart-container">
                            <canvas id="taskProgressChart"></canvas>
                        </div>
                        <h6 class="mt-3"><i class="fas fa-exclamation-triangle"></i> Tâches en retard :</h6>
                        <ul id="lateTasks" class="list-group list-group-flush"></ul>
                    </div>
                </div>
            </div>

            <!-- Collaborateurs -->
            <div class="col-md-6 mb-4">
                <div class="card">
                    <div class="card-header bg-info text-white">
                        <h5 class="card-title mb-0"><i class="fas fa-users"></i> Collaborateurs</h5>
                    </div>
                    <div class="card-body">
                        <div class="info-item">
                            <i class="fas fa-user-friends"></i>
                            <span>Nombre total de collaborateurs : <strong id="totalCollaborators"></strong></span>
                        </div>
                        <div class="chart-container">
                            <canvas id="topCollaboratorsChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Réunions -->
            <div class="col-md-6 mb-4">
                <div class="card">
                    <div class="card-header bg-warning text-dark">
                        <h5 class="card-title mb-0"><i class="fas fa-calendar-alt"></i> Réunions</h5>
                    </div>
                    <div class="card-body">
                        <div class="chart-container">
                            <canvas id="meetingCategoriesChart"></canvas>
                        </div>
                        <h6 class="mt-3"><i class="fas fa-clock"></i> Prochaines réunions :</h6>
                        <ul id="upcomingMeetings" class="list-group list-group-flush"></ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>
const projectCategories = <%= new Gson().toJson(numberProjectByCategory) %>
const dashboardData = {
    totalProjects: <%= number.get("project") %>,
    projectPriorities : Object.keys(projectCategories).map(key => ({
        label: key,
        count: projectCategories[key]
    }),
    projectPriorities: [
        {label: 'Haute', count: 12},
        {label: 'Moyenne', count: 8},
        {label: 'Basse', count: 5}
    ],
    totalTasks: <%= number.get("task") %>,
    taskProgress: [30, 45, 50, 25],
    lateTasks: [
        {name: 'Finaliser le rapport', projectName: 'Projet A'},
        {name: 'Réunion client', projectName: 'Projet B'}
    ],
    totalCollaborators: <%= number.get("collaborator") %>,
    topCollaborators: [
        {name: 'Alice', taskCount: 20},
        {name: 'Bob', taskCount: 18},
        {name: 'Charlie', taskCount: 15},
        {name: 'David', taskCount: 12},
        {name: 'Eve', taskCount: 10}
    ],
    meetingCategories: [
        {label: 'Planification', count: 5},
        {label: 'Revue', count: 3},
        {label: 'Brainstorming', count: 2}
    ],
    upcomingMeetings: [
        {date_meeting: '2024-07-27', start_time: '14:00', category: 'Planification'},
        {date_meeting: '2024-07-28', start_time: '10:00', category: 'Revue'}
    ]
};
</script>
<%@include file="../shared/footer.jsp" %>