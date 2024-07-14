<%@page import="java.util.ArrayList" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.time.LocalDate" %>
<%@page import="model.Collaborator" %>
<%@page import="model.Gender" %>
<%@page import="model.Role" %>

<%
    ArrayList<Collaborator> listCollaborator = (ArrayList<Collaborator>)request.getAttribute("listCollaborator");
    ArrayList<Gender> listGender = (ArrayList<Gender>)request.getAttribute("listGender");
    ArrayList<Role> listRole = (ArrayList<Role>)request.getAttribute("listRole");
    HashMap<String, Integer> number = (HashMap<String, Integer>)request.getAttribute("number");
    Collaborator updated = (Collaborator)request.getAttribute("updated");
%>
<%@include file ="../shared/sidebar.jsp" %>
    <h1 class="title">Collaborators</h1>
    <div class="numbers row d-flex align-item-center g-3 justify-content-flex-start">
        <div class="numbers__item col-md-3">
            <span class="icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="currentColor"
                    class="bi bi-database-down" viewBox="0 0 16 16">
                    <path
                        d="M12.5 9a3.5 3.5 0 1 1 0 7 3.5 3.5 0 0 1 0-7m.354 5.854 1.5-1.5a.5.5 0 0 0-.708-.708l-.646.647V10.5a.5.5 0 0 0-1 0v2.793l-.646-.647a.5.5 0 0 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0" />
                    <path
                        d="M12.096 6.223A5 5 0 0 0 13 5.698V7c0 .289-.213.654-.753 1.007a4.5 4.5 0 0 1 1.753.25V4c0-1.007-.875-1.755-1.904-2.223C11.022 1.289 9.573 1 8 1s-3.022.289-4.096.777C2.875 2.245 2 2.993 2 4v9c0 1.007.875 1.755 1.904 2.223C4.978 15.71 6.427 16 8 16c.536 0 1.058-.034 1.555-.097a4.5 4.5 0 0 1-.813-.927Q8.378 15 8 15c-1.464 0-2.766-.27-3.682-.687C3.356 13.875 3 13.373 3 13v-1.302c.271.202.58.378.904.525C4.978 12.71 6.427 13 8 13h.027a4.6 4.6 0 0 1 0-1H8c-1.464 0-2.766-.27-3.682-.687C3.356 10.875 3 10.373 3 10V8.698c.271.202.58.378.904.525C4.978 9.71 6.427 10 8 10q.393 0 .774-.024a4.5 4.5 0 0 1 1.102-1.132C9.298 8.944 8.666 9 8 9c-1.464 0-2.766-.27-3.682-.687C3.356 7.875 3 7.373 3 7V5.698c.271.202.58.378.904.525C4.978 6.711 6.427 7 8 7s3.022-.289 4.096-.777M3 4c0-.374.356-.875 1.318-1.313C5.234 2.271 6.536 2 8 2s2.766.27 3.682.687C12.644 3.125 13 3.627 13 4c0 .374-.356.875-1.318 1.313C10.766 5.729 9.464 6 8 6s-2.766-.27-3.682-.687C3.356 4.875 3 4.373 3 4" />
                </svg>
            </span>
            <div class="numbers__item-content">
                <h3 class="number_title">Total</h3>
                <p class="item-value"><%= number != null ? number.get("total") : "0" %></p>
            </div>
        </div>
        <div class="numbers__item col-md-3">
            <span class="icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="52" height="64" fill="currentColor"
                    class="bi bi-calendar3" viewBox="0 0 16 16">
                    <path
                        d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2M1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857z" />
                    <path
                        d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2m-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2m-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2" />
                </svg>
            </span>
            <div class="numbers__item-content">
                <h3 class="number_title">This year</h3>
                <p class="item-value"><%= number != null ? number.get("year") : "0" %></p>
            </div>
        </div>
        <div class="numbers__item col-md-3">
            <span class="icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="52" height="64" fill="currentColor"
                    class="bi bi-calendar3" viewBox="0 0 16 16">
                    <path
                        d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2M1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857z" />
                    <path
                        d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2m-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2m-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2m3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2" />
                </svg>
            </span>
            <div class="numbers__item-content">
                <h3 class="number_title">This months</h3>
                <p class="item-value"><%= number != null ? number.get("month") : "0" %></p>
            </div>
        </div>
        <div class="numbers__item col-md-3">
            <span class="icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="currentColor"
                    class="bi bi-database-down" viewBox="0 0 16 16">
                    <path
                        d="M12.5 9a3.5 3.5 0 1 1 0 7 3.5 3.5 0 0 1 0-7m.354 5.854 1.5-1.5a.5.5 0 0 0-.708-.708l-.646.647V10.5a.5.5 0 0 0-1 0v2.793l-.646-.647a.5.5 0 0 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0" />
                    <path
                        d="M12.096 6.223A5 5 0 0 0 13 5.698V7c0 .289-.213.654-.753 1.007a4.5 4.5 0 0 1 1.753.25V4c0-1.007-.875-1.755-1.904-2.223C11.022 1.289 9.573 1 8 1s-3.022.289-4.096.777C2.875 2.245 2 2.993 2 4v9c0 1.007.875 1.755 1.904 2.223C4.978 15.71 6.427 16 8 16c.536 0 1.058-.034 1.555-.097a4.5 4.5 0 0 1-.813-.927Q8.378 15 8 15c-1.464 0-2.766-.27-3.682-.687C3.356 13.875 3 13.373 3 13v-1.302c.271.202.58.378.904.525C4.978 12.71 6.427 13 8 13h.027a4.6 4.6 0 0 1 0-1H8c-1.464 0-2.766-.27-3.682-.687C3.356 10.875 3 10.373 3 10V8.698c.271.202.58.378.904.525C4.978 9.71 6.427 10 8 10q.393 0 .774-.024a4.5 4.5 0 0 1 1.102-1.132C9.298 8.944 8.666 9 8 9c-1.464 0-2.766-.27-3.682-.687C3.356 7.875 3 7.373 3 7V5.698c.271.202.58.378.904.525C4.978 6.711 6.427 7 8 7s3.022-.289 4.096-.777M3 4c0-.374.356-.875 1.318-1.313C5.234 2.271 6.536 2 8 2s2.766.27 3.682.687C12.644 3.125 13 3.627 13 4c0 .374-.356.875-1.318 1.313C10.766 5.729 9.464 6 8 6s-2.766-.27-3.682-.687C3.356 4.875 3 4.373 3 4" />
                </svg>
            </span>
            <div class="numbers__item-content">
                <h3 class="number_title">Today</h3>
                <p class="item-value"><%= number != null ? number.get("today") : "0" %></p>
            </div>
        </div>
    </div>
    <div class="row modal fade" id="insert-modal" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true" style="background: transparent;backdrop-filter: blur(8px);display:none">
        <div class="col-md-2"></div>
        <div class="modal-dialog modal-content col-md-8">
            <span class="exit-btn togglemodal" data-bs-target="insert-modal" data-target="insert-modal">
                <svg xmlns="http://www.w3.org/2000/svg" width="42" height="42" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293z"/>
                </svg>
            </span>
            <h2 class="insert-title"><%= updated != null ? "Update" : "Insert" %> form</h2>
            <form class="insert-collaborator" action="collaborator" method="POST">
                <div class="row">
                    <div class="input-container col-md-6">
                        <label for="validationDefault01" class="form-label">Name</label>
                        <input type="text" class="form-control" name="name" id="validationDefault01" placeholder="Name.." value="<%= updated !=  null ? updated.getName() : "" %>" required>
                    </div>
                    <div class="input-container col-md-6">
                        <label for="validationDefault02" class="form-label">Email</label>
                        <input type="email" class="form-control" name="email" id="validationDefault02" placeholder="xyz@example.com" value="<%= updated != null ? updated.getEmail() : "" %>" required>
                    </div>
                </div>
                <div class="input-container col-md-12">
                    <label for="validationDefault02" class="form-label">Date of birth</label>
                    <input type="date" name="dtn" class="form-control" id="validationDefault02" value="<%= updated != null ? updated.getBirthDate().toString() : LocalDate.now() %>" required>
                </div>
                <div class="input-container col-md-12">
                    <label for="validationDefaultUsername" class="form-label">Gender</label>
                    <div class="input-group">
                        <select class="form-select" name="gender" aria-label="Default select example" required>
                            <% 
                                for (Gender gen : listGender) { 
                                    String selected = "";
                                    if (updated != null && updated.getIdGender().equals(gen.getId())) {
                                        selected = "selected";
                                }
                            %>
                                <option value="<%= gen.getId() %>" <%= selected %>><%= gen.getLabel() %></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <div class="input-container col-md-12">
                    <label for="validationDefaultUsername" class="form-label">Role</label>
                    <div class="input-group">
                        <select class="form-select" name="role" aria-label="Default select example" required>
                        <% 
                            for (Role rol : listRole) { 
                                String selected = "";
                                if (updated != null && updated.getIdRole().equals(rol.getId())) {
                                    selected = "selected";
                            }
                        %>
                            <option value="<%= rol.getId() %>" <%= selected %>><%= rol.getLabel() %></option>
                        <% } %>
                        </select>
                    </div>
                </div>
                <input type="hidden" name="id" value="<%= updated != null ? updated.getId() : "" %>">
                <% if(updated == null ){ %>
                    <div class="input-container col-md-12">
                        <label for="validationDefaultUsername" class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" id="validationDefault02" placeholder="********" required>
                    </div>
                <% } %>
                <input type="hidden" name="mode" value="<%= updated != null ? "u" : "i" %>" >
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
            <h2 class="filter-title">Filter form</h2>
            <form class="insert-collaborator" method="GET" action="collaborator">
                <input type="hidden" name="type" value="s">
                <div class="row">
                    <div class="input-container col-md-6">
                        <label for="validationDefault01" class="form-label">Name</label>
                        <input type="text" name="name" class="form-control" id="validationDefault01" placeholder="Name..">
                    </div>
                    <div class="input-container col-md-6">
                        <label for="validationDefault02" class="form-label">Email</label>
                        <input type="email" class="form-control" name="email" id="validationDefault02"placeholder="xyz@example.com">
                    </div>
                </div>
                <div class="row">
                    <div class="input-container col-md-6">
                        <label for="validationDefaultUsername" class="form-label">Gender</label>
                        <div class="input-group">
                            <select class="form-select" name="gender" aria-label="Default select example">
                                <option value="">All</option>
                                <% for(Gender gender : listGender){ %>
                                    <option value="<%= gender.getId() %>"><%= gender.getLabel() %></option>
                                <% } %>
                            </select>
                        </div>
                    </div>
                    <div class="input-container col-md-6">
                        <label for="validationDefaultUsername" class="form-label">Role</label>
                        <div class="input-group">
                            <select class="form-select" name="role" aria-label="Default select example">
                                <option value="">All</option>
                                <% for(Role role : listRole){ %>
                                    <option value="<%= role.getId() %>"><%= role.getLabel() %></option>
                                <% } %>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row col-md-12">
                    <div class="input-container col-md-6">
                        <label for="validationDefaultUsername" class="form-label">Date of birth start</label>
                        <input type="date" name="dtn_d" class="form-control" id="validationDefault02">
                    </div>
                    <div class="input-container col-md-6">
                        <label for="validationDefaultUsername" class="form-label">Date of birth end</label>
                        <input type="date" name="dtn_f" class="form-control" id="validationDefault02">
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
        <div class="list-head row mb-3">
            <div class="list-head-title col-12 col-md-8">
                List of collaborator
            </div>
            <div class="cta-button col-6 col-md-2 d-none d-md-block">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#insert-modal">
                    Add
                </button>
            </div>
            <div class="cta-button col-6 col-md-2 d-none d-md-block">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#filter-modal">
                    Filter
                </button>
            </div>
            <div class="col-12 d-md-none">
                <button class="btn btn-secondary btn-sm w-100 mt-2" id="toggleButtons">Toggle Add/Filter</button>
            </div>
        </div>
        <div class="list-content d-flex flex-wrap">
            <% for(Collaborator c : listCollaborator){ %>
                <div class="col-12 col-md-4 col-lg-3 mb-4 d-flex align-items-center">
                    <div class="collaborator-card card">
                        <div class="image">
                            <% 
                                String gender = "";
                                for(Gender g : listGender) {
                                    if(c.getIdGender().equals(g.getId())){
                                        gender = g.getLabel();
                                        break;
                                    }
                                }
                            %>
                            <img src="assets/images/<%= gender.toLowerCase() %>.png" alt="">
                        </div>
                        <div class="card-body">
                            <h2 class="name"><%= c.getName() %></h2>
                            <%
                                String role = "";
                                for(Role r : listRole){
                                    if(c.getIdRole().equals(r.getId())){
                                        role = r.getLabel();
                                        break;
                                    }
                                }
                            %>
                            <h3 class="role"><%= role %></h3>
                            <p class="collaborator-card-text">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
                                    <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1zm13 2.383-4.708 2.825L15 11.105zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741M1 11.105l4.708-2.897L1 5.383z"/>
                                </svg>
                                <%= c.getEmail() %>
                            </p>
                            <p class="collaborator-card-text">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cake2" viewBox="0 0 16 16">
                                    <path d="m3.494.013-.595.79A.747.747 0 0 0 3 1.814v2.683q-.224.051-.432.107c-.702.187-1.305.418-1.745.696C.408 5.56 0 5.954 0 6.5v7c0 .546.408.94.823 1.201.44.278 1.043.51 1.745.696C3.978 15.773 5.898 16 8 16s4.022-.227 5.432-.603c.701-.187 1.305-.418 1.745-.696.415-.261.823-.655.823-1.201v-7c0-.546-.408-.94-.823-1.201-.44-.278-1.043-.51-1.745-.696A12 12 0 0 0 13 4.496v-2.69a.747.747 0 0 0 .092-1.004l-.598-.79-.595.792A.747.747 0 0 0 12 1.813V4.3a22 22 0 0 0-2-.23V1.806a.747.747 0 0 0 .092-1.004l-.598-.79-.595.792A.747.747 0 0 0 9 1.813v2.204a29 29 0 0 0-2 0V1.806A.747.747 0 0 0 7.092.802l-.598-.79-.595.792A.747.747 0 0 0 6 1.813V4.07c-.71.05-1.383.129-2 .23V1.806A.747.747 0 0 0 4.092.802zm-.668 5.556L3 5.524v.967q.468.111 1 .201V5.315a21 21 0 0 1 2-.242v1.855q.488.036 1 .054V5.018a28 28 0 0 1 2 0v1.964q.512-.018 1-.054V5.073c.72.054 1.393.137 2 .242v1.377q.532-.09 1-.201v-.967l.175.045c.655.175 1.15.374 1.469.575.344.217.356.35.356.356s-.012.139-.356.356c-.319.2-.814.4-1.47.575C11.87 7.78 10.041 8 8 8c-2.04 0-3.87-.221-5.174-.569-.656-.175-1.151-.374-1.47-.575C1.012 6.639 1 6.506 1 6.5s.012-.139.356-.356c.319-.2.814-.4 1.47-.575M15 7.806v1.027l-.68.907a.94.94 0 0 1-1.17.276 1.94 1.94 0 0 0-2.236.363l-.348.348a1 1 0 0 1-1.307.092l-.06-.044a2 2 0 0 0-2.399 0l-.06.044a1 1 0 0 1-1.306-.092l-.35-.35a1.935 1.935 0 0 0-2.233-.362.935.935 0 0 1-1.168-.277L1 8.82V7.806c.42.232.956.428 1.568.591C3.978 8.773 5.898 9 8 9s4.022-.227 5.432-.603c.612-.163 1.149-.36 1.568-.591m0 2.679V13.5c0 .006-.012.139-.356.355-.319.202-.814.401-1.47.576C11.87 14.78 10.041 15 8 15c-2.04 0-3.87-.221-5.174-.569-.656-.175-1.151-.374-1.47-.575-.344-.217-.356-.35-.356-.356v-3.02a1.935 1.935 0 0 0 2.298.43.935.935 0 0 1 1.08.175l.348.349a2 2 0 0 0 2.615.185l.059-.044a1 1 0 0 1 1.2 0l.06.044a2 2 0 0 0 2.613-.185l.348-.348a.94.94 0 0 1 1.082-.175c.781.39 1.718.208 2.297-.426"/>
                                </svg>
                                <%= c.getBirthDate().toString() %>
                            </p>
                            <a href="collaborator?mode=u&id=<%= c.getId() %>">
                                <button type="button" class="edit-btn btn btn-outline-info">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                    </svg>
                                </button>
                            </a>
                            <a href="collaborator?mode=d&id=<%= c.getId() %>">
                                <button type="button" class="delete-btn btn btn-outline-danger">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0"/>
                                    </svg>
                                </button>
                            </a>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
<%@include file="../shared/footer.jsp" %>