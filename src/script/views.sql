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
            DATE(insert_date) = CURRENT_DATE
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
            DATE(insert_date) = CURRENT_DATE
    ) AS j;