/* -------------------------------------------------------------------------- */
/*    Number of collaborator signed total, this year , this month and today   */
/* -------------------------------------------------------------------------- */
CREATE
OR REPLACE VIEW v_number_collaborator AS
SELECT
    t.total AS total,
    a.annee AS year,
    m.mois AS month,
    j.jour AS today
FROM
    (
        SELECT
            COUNT(*) as mois
        FROM
            collaborator
        WHERE
            DATE_TRUNC ('month', insert_date) = DATE_TRUNC ('month', CURRENT_DATE)
    ) AS m,
    (
        SELECT
            COUNT(*) as annee
        FROM
            collaborator
        WHERE
            DATE_PART ('year', insert_date) = DATE_PART ('year', CURRENT_DATE)
    ) AS a,
    (
        SELECT
            COUNT(*) as total
        FROM
            collaborator
    ) AS t,
    (
        SELECT
            COUNT(*) as jour
        FROM
            collaborator
        WHERE
            DATE (insert_date) = CURRENT_DATE
    ) AS j;

CREATE
OR REPLACE VIEW v_number_project AS
SELECT
    t.total AS total,
    a.annee AS year,
    m.mois AS month,
    j.jour AS today
FROM
    (
        SELECT
            COUNT(*) as mois
        FROM
            project
        WHERE
            DATE_TRUNC ('month', insert_date) = DATE_TRUNC ('month', CURRENT_DATE)
    ) AS m,
    (
        SELECT
            COUNT(*) as annee
        FROM
            project
        WHERE
            DATE_PART ('year', insert_date) = DATE_PART ('year', CURRENT_DATE)
    ) AS a,
    (
        SELECT
            COUNT(*) as total
        FROM
            project
    ) AS t,
    (
        SELECT
            COUNT(*) as jour
        FROM
            project
        WHERE
            DATE (insert_date) = CURRENT_DATE
    ) AS j;

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
    COALESCE(vp.progress, 0) as progress
FROM
    project AS p
    LEFT JOIN v_project_progress AS vp ON p.id_project = vp.id_project;

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