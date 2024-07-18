<%
    String pageActive = (String)request.getAttribute("page");
    String userType = (String)request.getAttribute("userType");
%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/images/logo.png" type="image/x-icon">
    <title>Template</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/main.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/<%= pageActive %>.css">
    <link rel="stylesheet" href="assets/icons/fontawesome/css/all.min.css">
</head>

<body class="row">
    <button class="btn btn-primary toggle-sidebar-btn d-md-none" onclick="toggleSidebar()">☰</button>
    <div class="container row">
        <aside class="col-md-2 d-md-block" id="sidebar">
            <div class="sidebar d-flex flex-column flex-shrink-0 p-3 text-white" style="width: 100%;">
                <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none"
                    style="width: 100%;">
                    <div class="logo">
                        <img src="assets/images/logo.png" alt="">
                    </div>
                </a>
                <hr style="color: blue;">
                <ul class="list-onglet nav nav-pills flex-column mb-auto" style="gap:6px;">
                    <li class="nav-item">
                        <% if(userType.equals("1")){ %>
                            <a href="dashboard" class="onglet nav-link <%= pageActive.equals("dashboard") ? "active" : "" %>" aria-current="page">
                                <i class="fa fa-tachometer-alt"></i>
                                Dashboard
                            </a>
                        <% } %>
                    </li>
                    <li class="nav-item">
                        <a href="project" class="onglet nav-link <%= pageActive.equals("project") ? "active" : "" %>" >
                            <i class="fas fa-project-diagram"></i>
                            Project
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="task" class="onglet nav-link <%= pageActive.equals("task") ? "active" : "" %>">
                            <i class="fa fa-tasks"></i>
                            Tasks
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="onglet nav-link <%= pageActive.equals("meeting") ? "active" : "" %>">
                            <i class="far fa-calendar"></i>
                            Meetings
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="collaborator" class="onglet nav-link <%= pageActive.equals("collaborator") ? "active" : "" %>">
                            <i class="fas fa-users"></i>
                            Collaborators
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="onglet nav-link <%= pageActive.equals("comment") ? "active" : "" %>">
                            <i class="far fa-comment-dots"></i>
                            Comments
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="onglet nav-link <%= pageActive.equals("report") ? "active" : "" %>">
                            <i class="far fa-lightbulb"></i>
                            Reports
                        </a>
                    </li>
                    <li class="nav-item last_onglet">
                        <a href="#" class="onglet nav-link <%= pageActive.equals("notification") ? "active" : "" %>">
                            <i class="far fa-bell"></i>
                            Notifications
                        </a>
                    </li>
                </ul>
                <hr>
                <div class="dropdown">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
                        id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="assets/images/male.png" alt="" width="32" height="32"
                            class="rounded-circle me-2" style="border: 1px solid black;">
                        <strong style="color: black;">Sanda</strong>
                    </a>
                    <ul class="dropdown-menu dropdown-menu text-small shadow" aria-labelledby="dropdownUser1">
                        <li><a class="dropdown-item" href="#">New project...</a></li>
                        <li><a class="dropdown-item" href="#">Settings</a></li>
                        <li><a class="dropdown-item" href="#">Profile</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Sign out</a></li>
                    </ul>
                </div>
            </div>
        </aside>
        <main class="col-12 col-md-10">