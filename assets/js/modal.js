var togglebtn = document.getElementsByClassName("togglemodal");
Array.from(togglebtn).forEach(btn =>{
    btn.addEventListener('click', function() {
        var target = btn.dataset.target;
        var myModal = document.getElementById(target);
        var modalInstance = new bootstrap.Modal(myModal);
        modalInstance.hide();
    });
})