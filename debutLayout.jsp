<%@page import="java.util.*" %>
<%@page import="models.Collaborator" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/icons/fontawesome/css/all.css">
    <link rel="stylesheet" href="assets/icons/fontawesome/css/fontawsome.css">
    <link rel="stylesheet" href="assets/css/navbar.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <title>Document</title>
</head>
<body>
    <aside class="sidebar">
        <div class="sidebar__brand--logo">
            <i class="fab fa-skyatlas"></i>
            <h2>Tasker</h2>
        </div>
        <div class="sidebar__separator">Active project</div>
        <div class="sidebar__active--project">
            <h2>TT</h2>
            <div class="sidebar__active--project-description">
                <p>Tasker</p>
                <small>Project management</small>
            </div>
        </div>
        <div class="sidebar__separator">Menu Management<hr></div>
        <div class="sidebar__menu">
            <ul>
                <a href="#">
                    <li>
                        <i class="fa fa-bell"></i>
                        <h3 class="label">Project</h3>
                    </li>
                </a>
                <a href="#">
                    <li>
                        <i class="fa fa-bell"></i>
                        <h3 class="label">Collaborator</h3>
                    </li>
                </a>
                <a href="#">
                    <li>
                        <i class="fa fa-bell"></i>
                        <h3 class="label">Team</h3>
                    </li>
                </a>
                <a href="#">
                    <li>
                        <i class="fa fa-bell"></i>
                        <h3 class="label">Task</h3>
                    </li>
                </a>
                <a href="#">
                    <li>
                        <i class="fa fa-bell"></i>
                        <h3 class="label">Report</h3>
                    </li>
                </a>
                <a href="#">
                    <li>
                        <i class="fa fa-bell"></i>
                        <h3 class="label">Comment</h3>
                    </li>
                </a>
            </ul>
        </div>
    </aside>