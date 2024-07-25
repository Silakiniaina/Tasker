/* global bootstrap: false */
(function () {
  'use strict'
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="dropdown"]'))
  tooltipTriggerList.forEach(function (tooltipTriggerEl) {
    new bootstrap.Dropdown(tooltipTriggerEl)
  })
})()

function toggleSidebar() {
  const sidebar = document.getElementById('sidebar');
  sidebar.classList.toggle('active');
}
