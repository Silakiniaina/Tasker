package model;

public class Team {
    String idProject;
    String idCollaborator;
    int assignedTask;
    double percentage;

    /* -------------------------------------------------------------------------- */
    /*                                 Constructor                                */
    /* -------------------------------------------------------------------------- */
    public Team(String idp, String idc){
        this.setIdProject(idp);
        this.setIdCollaborator(idc);
    }
    
    /* -------------------------------------------------------------------------- */
    /*                                   Getters                                  */
    /* -------------------------------------------------------------------------- */
    public String getIdProject() {
        return idProject;
    }
    public String getIdCollaborator() {
        return idCollaborator;
    }
    public int getAssignedTask() {
        return assignedTask;
    }
    public double getPercentage() {
        return percentage;
    }
    
    /* -------------------------------------------------------------------------- */
    /*                                   Setters                                  */
    /* -------------------------------------------------------------------------- */
    public void setIdProject(String idProject) {
        this.idProject = idProject;
    }
    public void setIdCollaborator(String idCollaborator) {
        this.idCollaborator = idCollaborator;
    }
    public void setAssignedTask(int assignedTask) {
        this.assignedTask = assignedTask;
    }
    public void setPercentage(double percentage) {
        this.percentage = percentage;
    }
}
