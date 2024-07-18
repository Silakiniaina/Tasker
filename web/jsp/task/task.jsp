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
        <form class="insert-collaborator">
            <div class="input-container col-md-12">
                <label for="validationDefaultUsername" class="form-label">Project</label>
                <div class="input-group">
                    <select class="form-select" aria-label="Default select example" required>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="input-container col-md-6">
                    <label for="validationDefault01" class="form-label">Title</label>
                    <input type="text" class="form-control" id="validationDefault01" placeholder="Name.."
                        required>
                </div>
                <div class="input-container col-md-6">
                    <label for="validationDefaultUsername" class="form-label">Task category</label>
                    <div class="input-group">
                        <select class="form-select" aria-label="Default select example" required>
                            <option value="1" selected>One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="input-container col-md-6">
                    <label for="validationDefault02" class="form-label">Date start</label>
                    <input type="date" class="form-control" id="validationDefault02" required>
                </div>
                <div class="input-container col-md-6">
                    <label for="validationDefault02" class="form-label">Duration in day</label>
                    <input type="number" class="form-control" id="validationDefault02" required>
                </div>
            </div>
            <div class="input-container col-md-12">
                <label for="validationDefaultUsername" class="form-label">Assignment</label>
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
            <div class="input-container col-12 mb-3">
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
    <div class="list-content">
        <div class="row">
            <div>
                <span class="d-flex row task-card" style="background-color: #FFFFFF;">
                    <div class="task-content col-md-7 d-flex">
                        <div class="d-flex">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-lightbulb" viewBox="0 0 16 16">
                                <path d="M2 6a6 6 0 1 1 10.174 4.31c-.203.196-.359.4-.453.619l-.762 1.769A.5.5 0 0 1 10.5 13a.5.5 0 0 1 0 1 .5.5 0 0 1 0 1l-.224.447a1 1 0 0 1-.894.553H6.618a1 1 0 0 1-.894-.553L5.5 15a.5.5 0 0 1 0-1 .5.5 0 0 1 0-1 .5.5 0 0 1-.46-.302l-.761-1.77a2 2 0 0 0-.453-.618A5.98 5.98 0 0 1 2 6m6-5a5 5 0 0 0-3.479 8.592c.263.254.514.564.676.941L5.83 12h4.342l.632-1.467c.162-.377.413-.687.676-.941A5 5 0 0 0 8 1"/>
                            </svg>
                            <b>Mettre la durée des tâches</b>
                        </div>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus laudantium eius accusantium totam corrupti est tempora voluptas quia sed aliquid ducimus quos ab, quisquam quas quasi rerum. Distinctio, temporibus dolore?</p>
                    </div>
                    <div class="task-config col-md-5">
                        <div class="task-chrono d-flex">
                            <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-stopwatch" viewBox="0 0 16 16">
                                <path d="M8.5 5.6a.5.5 0 1 0-1 0v2.9h-3a.5.5 0 0 0 0 1H8a.5.5 0 0 0 .5-.5z"/>
                                <path d="M6.5 1A.5.5 0 0 1 7 .5h2a.5.5 0 0 1 0 1v.57c1.36.196 2.594.78 3.584 1.64l.012-.013.354-.354-.354-.353a.5.5 0 0 1 .707-.708l1.414 1.415a.5.5 0 1 1-.707.707l-.353-.354-.354.354-.013.012A7 7 0 1 1 7 2.071V1.5a.5.5 0 0 1-.5-.5M8 3a6 6 0 1 0 .001 12A6 6 0 0 0 8 3"/>
                            </svg>
                            <b  style="font-size: 14px;">00:45:00</b>
                        </div>
                        <div class="task-assignment d-flex">
                            <div>
                                <img src="../../assets/images/female.png" alt="Abigail" style="border-radius: 50%; width: 30px; height: 30px;">
                            </div>
                            <b>Silakiniaina</b>
                        </div>
                        <div class="d-flex" style="gap: 10px;">
                            <a href="#" >
                                <button type="button" class="edit-btn btn btn-outline-info">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                    </svg>
                                </button>
                            </a>
                            <a href="#" >
                                <button type="button" class="delete-btn btn btn-outline-danger">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0"/>
                                    </svg>
                                </button>
                            </a>
                        </div>
                    </div>
                </span>
            </div>
        </div>
    </div>
<%@include file="../shared/footer.jsp" %>
