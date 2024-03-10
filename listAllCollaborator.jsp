<%@include file="debutLayout.jsp" %>
    <main class="main">
        <div class="main__title">Collaborator</div>
        <div class="main__content">
            <div class="container">
                <div class="container__head">
                    <div class="container__head--title">
                        <h3 class="container__head--title-disable">Collaborator</h3>/
                        <h3 class="container__head--title-active">All collaborators</h3>
                    </div>
                    <div class="container__head--btn">
                        <a href="#">
                            <button><span>+</span> insert Collaborator</button>
                        </a>
                    </div>
                </div>
                <div class="container__content">
                    <table>
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>First name</th>
                                <th>Date of birth</th>
                                <th>username</th>
                                <th>role</th>
                                <th>speciality</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Sanda</td>
                                <td>Silakiniaina</td>
                                <td>2005-07-12</td>
                                <td>Sanda</td>
                                <td>Stagiaire</td>
                                <td>Backend</td>
                                <td>
                                    <div class="actions">
                                        <a href="#" class="edit">
                                            <i class="fa fa-bell"></i>    
                                        </a>
                                        <a href="#" class="delete">
                                            <i class="fa fa-bell"></i>    
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
            </div>
        </div>
    </main>
</body>
</html>