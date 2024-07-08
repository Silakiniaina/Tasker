package model;

import java.sql.Timestamp;

public class Project {
    String id;
    String name;
    String description;
    Timestamp startDate;
    Timestamp endDate;
    String idResponsable;
    String idCategoryProject;

    /* -------------------------------------------------------------------------- */
    /* Constructors */
    /* -------------------------------------------------------------------------- */
    public Project(String name, String desc, Timestamp start, Timestamp end, String responsable, String category) {
        this.setName(name);
        this.setDescription(desc);
        this.setStartDate(start);
        this.setEndDate(end);
        this.setIdResponsable(responsable);
        this.setIdCategoryProject(category);
    }

    /* -------------------------------------------------------------------------- */
    /* Getters */
    /* -------------------------------------------------------------------------- */
    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public Timestamp getStartDate() {
        return startDate;
    }

    public Timestamp getEndDate() {
        return endDate;
    }

    public String getIdResponsable() {
        return idResponsable;
    }

    public String getIdCategoryProject() {
        return idCategoryProject;
    }

    /* -------------------------------------------------------------------------- */
    /* Setters */
    /* -------------------------------------------------------------------------- */
    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }

    public void setIdResponsable(String idResponsable) {
        this.idResponsable = idResponsable;
    }

    public void setIdCategoryProject(String idCategoryProject) {
        this.idCategoryProject = idCategoryProject;
    }
}
