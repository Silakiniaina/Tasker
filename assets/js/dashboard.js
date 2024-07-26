
// Fonction pour initialiser les graphiques et remplir les données
function initDashboard() {
    document.getElementById('totalProjects').textContent = dashboardData.totalProjects;
    document.getElementById('totalTasks').textContent = dashboardData.totalTasks;
    document.getElementById('totalCollaborators').textContent = dashboardData.totalCollaborators;

    // Graphique des catégories de projets
    new Chart(document.getElementById('projectCategoriesChart'), {
        type: 'pie',
        data: {
            labels: dashboardData.projectCategories.map(cat => cat.label),
            datasets: [{
                data: dashboardData.projectCategories.map(cat => cat.count),
                backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56']
            }]
        },
        options: {
            responsive: true,
            plugins: {
                title: {
                    display: true,
                    text: 'Répartition des projets par catégorie'
                }
            }
        }
    });

    // Graphique des priorités de projets
    new Chart(document.getElementById('projectPrioritiesChart'), {
        type: 'doughnut',
        data: {
            labels: dashboardData.projectPriorities.map(prio => prio.label),
            datasets: [{
                data: dashboardData.projectPriorities.map(prio => prio.count),
                backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56']
            }]
        },
        options: {
            responsive: true,
            plugins: {
                title: {
                    display: true,
                    text: 'Répartition des projets par priorité'
                }
            }
        }
    });

    // Graphique de progression des tâches
    new Chart(document.getElementById('taskProgressChart'), {
        type: 'bar',
        data: {
            labels: ['0-25%', '26-50%', '51-75%', '76-100%'],
            datasets: [{
                label: 'Nombre de tâches',
                data: dashboardData.taskProgress,
                backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0']
            }]
        },
        options: {
            responsive: true,
            plugins: {
                title: {
                    display: true,
                    text: 'Progression des tâches'
                }
            },
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // Graphique des collaborateurs les plus actifs
    new Chart(document.getElementById('topCollaboratorsChart'), {
        type: 'bar',
        data: {
            labels: dashboardData.topCollaborators.map(collab => collab.name),
            datasets: [{
                label: 'Nombre de tâches',
                data: dashboardData.topCollaborators.map(collab => collab.taskCount),
                backgroundColor: '#36A2EB'
            }]
        },
        options: {
            indexAxis: 'y',
            responsive: true,
            plugins: {
                title: {
                    display: true,
                    text: 'Top 5 des collaborateurs les plus actifs'
                }
            },
            scales: {
                x: {
                    beginAtZero: true
                }
            }
        }
    });

    // Graphique des catégories de réunions
    new Chart(document.getElementById('meetingCategoriesChart'), {
        type: 'polarArea',
        data: {
            labels: dashboardData.meetingCategories.map(cat => cat.label),
            datasets: [{
                data: dashboardData.meetingCategories.map(cat => cat.count),
                backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56']
            }]
        },
        options: {
            responsive: true,
            plugins: {
                title: {
                    display: true,
                    text: 'Répartition des réunions par catégorie'
                }
            }
        }
    });

    // Remplir la liste des tâches en retard
    const lateTasksList = document.getElementById('lateTasks');
    dashboardData.lateTasks.forEach(task => {
        const li = document.createElement('li');
        li.textContent = `${task.name} (Projet : ${task.projectName})`;
        lateTasksList.appendChild(li);
    });

    // Remplir la liste des prochaines réunions
    const upcomingMeetingsList = document.getElementById('upcomingMeetings');
    dashboardData.upcomingMeetings.forEach(meeting => {
        const li = document.createElement('li');
        li.textContent = `${meeting.date_meeting} - ${meeting.start_time} : ${meeting.category}`;
        upcomingMeetingsList.appendChild(li);
    });
}

// Initialiser le dashboard au chargement de la page
document.addEventListener('DOMContentLoaded', initDashboard);