/* -------------------------------------------------------------------------- */
/*    Number of collaborator signed total, this year , this month and today   */
/* -------------------------------------------------------------------------- */
CREATE
    OR REPLACE VIEW v_number_collaborator AS
SELECT
    t.total AS total,
    a.annee AS cet_annee,
    m.mois AS cet_mois,
    j.jour AS aujourdhui
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
            insert_date = CURRENT_DATE
    ) AS j;