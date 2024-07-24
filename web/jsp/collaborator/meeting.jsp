<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.Time" %>
<%@page import="shared.Utils" %>
<%@page import="model.Gender" %>
<%@page import="model.MeetingCategory" %>
<%@page import="model.Meeting" %>
<%@page import="model.Room" %>
<%@page import="model.Collaborator" %>
<%@page import="model.Project" %>
<%@page import="model.Status" %>
<%@page import="model.Gender" %>

<%
    ArrayList<Collaborator> listCollaborator = (ArrayList<Collaborator>)request.getAttribute("listCollaborator");
    ArrayList<Status> listStatus = (ArrayList<Status>)request.getAttribute("listStatus");
    ArrayList<MeetingCategory> listMeetingCategory = (ArrayList<MeetingCategory>)request.getAttribute("listMeetingCategory");
    ArrayList<Project> listProject = (ArrayList<Project>)request.getAttribute("listProject");
    ArrayList<Meeting> listMeeting = (ArrayList<Meeting>)request.getAttribute("listMeeting");
    ArrayList<Room> listRoom = (ArrayList<Room>)request.getAttribute("listRoom");

    String user = (String)request.getAttribute("userType");
    Meeting updated = (Meeting)request.getAttribute("updated");
%>

<%@include file="../shared/sidebar.jsp" %>
<h1 class="title">Meeting</h1>
<div class="row modal fade" id="insert-modal" tabindex="-1" aria-labelledby="exampleModalLabel"aria-hidden="true" style="background: transparent;backdrop-filter: blur(8px);">
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
        <form class="insert-collaborator">
            <div class="input-container row">
                <label for="validationDefaultUsername" class="form-label">Meeting category</label>
                <div class="input-group">
                    <select class="form-select" name="category" aria-label="Default select example" required>
                        <% 
                            String selectedCategory = "";
                            for (MeetingCategory mc : listMeetingCategory) { 
                                if (updated != null && updated.getIdCategoryMeeting().equals(mc.getId())) {
                                    selectedCategory = "selected";
                                }
                        %>
                            <option value="<%= mc.getId() %>" <%= selectedCategory %>><%= mc.getLabel() %></option>
                        <% } %>
                    </select>
                </div>
            </div>
            <div class="input-container col-md-12">
                <label for="validationDefault02" class="form-label">Date</label>
                <input type="date" class="form-control" id="validationDefault02" required>
            </div>
            <div class="row">
                <div class="input-container col-md-6">
                    <label for="validationDefault02" class="form-label">Start time</label>
                    <input type="time" class="form-control" id="validationDefault02" required>
                </div>
                <div class="input-container col-md-6">
                    <label for="validationDefault02" class="form-label">End time</label>
                    <input type="time" class="form-control" id="validationDefault02" required>
                </div>
            </div>
            <div class="input-container col-md-12">
                <label for="validationDefaultUsername" class="form-label">Responsable</label>
                <div class="input-group">
                    <select class="form-select" aria-label="Default select example" required>
                        <option selected>Not assigned</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
            </div>
            <div class="input-container col-md-12">
                <label for="validationDefaultUsername" class="form-label">Room</label>
                <div class="input-group">
                    <select class="form-select" aria-label="Default select example" required>
                        <option selected>Not assigned</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
            </div>
            <div class="input-container col-md-12">
                <label for="validationDefaultUsername" class="form-label">Status</label>
                <div class="input-group">
                    <select class="form-select" aria-label="Default select example" required>
                        <option selected>Blocked</option>
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
<div class="row modal fade" id="filter-modal" tabindex="-1" aria-labelledby="exampleModalLabel"
    aria-hidden="true" style="background: transparent;backdrop-filter: blur(8px);">
    <div class="col-md-2"></div>
    <div class="modal-dialog modal-content col-md-8">
        <h2 class="filter-title">Filter form</h2>
        <form class="insert-collaborator">
            <div class="row">
                <div class="input-container col-md-6">
                    <label for="validationDefault01" class="form-label">Name</label>
                    <input type="text" class="form-control" id="validationDefault01" placeholder="Name.."
                        required>
                </div>
                <div class="input-container col-md-6">
                    <label for="validationDefault02" class="form-label">Email</label>
                    <input type="email" class="form-control" id="validationDefault02"
                        placeholder="xyz@example.com" required>
                </div>
            </div>
            <div class="row">
                <div class="input-container col-md-6">
                    <label for="validationDefaultUsername" class="form-label">Gender</label>
                    <div class="input-group">
                        <select class="form-select" aria-label="Default select example" required>
                            <option selected>Open this select menu</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                </div>
                <div class="input-container col-md-6">
                    <label for="validationDefaultUsername" class="form-label">Role</label>
                    <div class="input-group">
                        <select class="form-select" aria-label="Default select example" required>
                            <option selected>Open this select menu</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row col-md-12">
                <div class="input-container col-md-6">
                    <label for="validationDefaultUsername" class="form-label">Date of birth start</label>
                    <input type="date" class="form-control" id="validationDefault02" required>
                </div>
                <div class="input-container col-md-6">
                    <label for="validationDefaultUsername" class="form-label">Date of birth end</label>
                    <input type="date" class="form-control" id="validationDefault02" required>
                </div>
            </div>
            <div class="input-container col-12">
                <label for="validationDefaultUsername" class="form-label">Description</label>
                <textarea class="form-control" name="description" aria-label="With textarea"></textarea>
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
            List of collaborator
        </div>
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
    </div>
    <div class="row list-content">
    <% for(Meeting m : listMeeting){ %>
        <div class="col-md-4" style=" padding :10px;">
            <div class="meeting-item progressing">
                <div class="col-md-8">
                    <%
                        String category = "";
                        for(MeetingCategory mc : listMeetingCategory){
                            if(mc.getId().equals(m.getIdCategoryMeeting())){
                                category = mc.getLabel();
                                break;
                            }
                        }
                    %>
                    <h5 class="mb-1 meeting-category"><%= category %></h5>
                    <p class="mb-1">
                    <%
                        String project = "";
                        for(Project pr : listProject){
                            if(pr.getId().equals(m.getIdProject())){
                                category = pr.getName();
                                break;
                            }
                        }
                    %>
                        <b>#</b><%= project %>
                    </p>
                    <p class="mb-1 text-muted">
                        <% 
                            String name = "";
                            String gender = "";
                            for(Collaborator col : listCollaborator){ 
                                if(col.getId().equals(m.getIdResponsable())){
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
                            <img src="assets/images/<%= gender.toLowerCase() %>.png" alt="<%= name %>" style="border-radius: 50%; width: 30px; height: 30px;">
                        </div>
                        <b><%= name %></b>
                    </p>
                </div>
                <div class="text-end meeting-information col-md-4">
                    <div class="dropend col-md-12 action">
                        <i class="fa fa-ellipsis-v dropdown-toggle"
                        id="dropendMenuButton" data-bs-toggle="dropdown" aria-expanded="true">
                        </i>
                        <ul class="dropdown-menu" aria-labelledby="dropendMenuButton"
                            style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(153px, -158px);">
                            <li>
                                <a class="dropdown-item" href="meeting?mode=u&id=<%= m.getId() %>">Edit</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="meeting?mode=d&id=<%= m.getId() %>">Delete</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-12 timer">
                        <%= m.getDuration().toString() %>
                    </div>
                    <%
                        String room = "";
                        for(Room r : listRoom){
                            if(r.getId().equals(m.getIdRoom())){
                                room = r.getLabel();
                                break;
                            }
                        }
                    %>
                    <div class="col-md-12 room">
                        <%= room %>
                    </div>
                </div>
            </div>
        </div>
    <% } %>  
    </div>
<%@include file="../shared/footer.jsp" %>