/* -------------------------------------------------------------------------- */
/*             Number of project, task, meeting, and collaborator             */
/* -------------------------------------------------------------------------- */
CREATE
OR REPLACE VIEW v_number_dashboard AS
SELECT
    (
        SELECT
            COUNT(*)
        FROM
            project
    ) AS project,
    (
        SELECT
            COUNT(*)
        FROM
            task
    ) AS task,
    (
        SELECT
            COUNT(*)
        FROM
            meeting
    ) AS meeting,
    (
        SELECT
            COUNT(*)
        FROM
            collaborator
    ) AS collaborator;

/* -------------------------------------------------------------------------- */
/*                          Progress of each project                          */
/* -------------------------------------------------------------------------- */
CREATE
OR REPLACE VIEW v_project_progress AS
SELECT
    id_project,
    AVG(progress) AS progress
FROM
    task
GROUP BY
    id_project;

/* -------------------------------------------------------------------------- */
/*                        The project with its progress                       */
/* -------------------------------------------------------------------------- */
CREATE
OR REPLACE VIEW v_project AS
SELECT
    p.*,
    COALESCE(vp.progress, 0) as progress,
FROM
    project AS p
    LEFT JOIN v_project_progress AS vp ON p.id_project = vp.id_project;

/* -------------------------------------------------------------------------- */
/*                             Project with status                            */
/* -------------------------------------------------------------------------- */
CREATE
OR REPLACE VIEW v_project_with_status AS
SELECT
    *,
    CASE
        WHEN progress >= 0
        AND progress < 100
        AND end_date < NOW () THEN 'blocked'
        WHEN progress >= 0
        AND progress < 100
        AND (
            start_date <= now ()
            AND end_date >= now ()
        ) THEN 'progressing'
        WHEN progress = 0
        AND start_date > NOW () THEN 'sheduled'
        WHEN progress = 100 THEN 'finished'
    END AS status
FROM
    v_project;

/* -------------------------------------------------------------------------- */
/*                 task with status according to its progress                 */
/* -------------------------------------------------------------------------- */
CREATE
OR REPLACE VIEW v_task AS
SELECT
    t.*,
    CASE
        WHEN progress >= 0
        AND progress < 100
        AND end_date < NOW () THEN 'blocked'
        WHEN progress >= 0
        AND progress < 100
        AND (
            start_date <= now ()
            AND end_date >= now ()
        ) THEN 'progressing'
        WHEN progress = 0
        AND start_date > NOW () THEN 'sheduled'
        WHEN progress = 100 THEN 'finished'
    END AS status
FROM
    task AS t;

/* -------------------------------------------------------------------------- */
/*                             project task stats                             */
/* -------------------------------------------------------------------------- */
CREATE
OR REPLACE VIEW v_project_task_stat AS
SELECT
    p.id_project,
    COUNT(
        CASE
            WHEN t.status = 'sheduled' THEN 1
        END
    ) AS sheduled,
    COUNT(
        CASE
            WHEN t.status = 'finished' THEN 1
        END
    ) AS finished,
    COUNT(
        CASE
            WHEN t.status = 'progressing' THEN 1
        END
    ) AS progressing,
    COUNT(
        CASE
            WHEN t.status = 'blocked' THEN 1
        END
    ) AS blocked,
    count(*) as total
FROM
    (
        SELECT DISTINCT
            id_project
        FROM
            task
    ) p
    LEFT JOIN v_task t ON p.id_project = t.id_project
GROUP BY
    p.id_project
ORDER BY
    p.id_project;

/* -------------------------------------------------------------------------- */
/*                        Percentage of assigned tasks                        */
/* -------------------------------------------------------------------------- */
CREATE
OR REPLACE VIEW v_percentage_assigned_tasks AS
SELECT
    t.id_project,
    t.id_collaborator,
    COUNT(*) as assigned_tasks,
    ((COUNT(*) * 100) / total.total_tasks) AS percentage
FROM
    task AS t
    JOIN (
        SELECT
            id_project,
            COUNT(*) as total_tasks
        FROM
            task
        GROUP BY
            id_project
    ) AS total ON t.id_project = total.id_project
GROUP BY
    t.id_project,
    t.id_collaborator,
    total.total_tasks;

/* -------------------------------------------------------------------------- */
/*                            The task of the team                            */
/* -------------------------------------------------------------------------- */
CREATE
OR REPLACE VIEW v_team AS
SELECT
    t.id_project,
    t.id_collaborator,
    COALESCE(pat.assigned_tasks, 0) AS assigned,
    COALESCE(pat.percentage, 0) AS percentage
FROM
    team AS t
    LEFT JOIN v_percentage_assigned_tasks AS pat ON t.id_project = pat.id_project
    AND t.id_collaborator = pat.id_collaborator;

/* -------------------------------------------------------------------------- */
/*                              list of all team                              */
/* -------------------------------------------------------------------------- */
CREATE
OR REPLACE VIEW v_all_team AS
SELECT
    p.id_project,
    t.id_collaborator
FROM
    project AS p
    LEFT JOIN team AS t ON p.id_project = t.id_project;

/* -------------------------------------------------------------------------- */
/*                        Number of project by category                       */
/* -------------------------------------------------------------------------- */
CREATE
OR REPLACE VIEW v_number_project_by_category AS
SELECT
    pr.label,
    COUNT(p.id_project)
FROM
    projectcategory AS pr
    LEFT JOIN project AS p ON pr.id_project_category = p.id_project_category
GROUP BY
    pr.id_project_category
;
