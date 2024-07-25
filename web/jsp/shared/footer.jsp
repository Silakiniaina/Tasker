            </div>
        </main>
    </div>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/sidebars.js"></script>
    <script src="assets/js/modal.js"></script>
    <script src="assets/js/<%= pageActive %>.js"></script>   
    <script>
        <% if(updated != null){ %>
            var modal = document.getElementById("insert-modal");
            var modalInstance = new bootstrap.Modal(modal);
            modalInstance.show();
        <% } %>
    </script>
</body>
</html>