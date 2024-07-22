CREATE SEQUENCE gender_seq;
CREATE SEQUENCE project_category_seq;
CREATE SEQUENCE role_seq;
CREATE SEQUENCE task_category_seq;
CREATE SEQUENCE meeting_category_seq;
CREATE SEQUENCE report_category_seq;
CREATE SEQUENCE comment_category_seq;
CREATE SEQUENCE room_seq;
CREATE SEQUENCE collaborator_seq;
CREATE SEQUENCE project_seq;
CREATE SEQUENCE task_seq;
CREATE SEQUENCE subtask_seq;
CREATE SEQUENCE meeting_seq;
CREATE SEQUENCE comment_seq;
CREATE SEQUENCE report_seq;
CREATE SEQUENCE team_seq;
CREATE SEQUENCE status_seq;

/* -------------------------------------------------------------------------- */
/*         Functions for generating an ID string for each primary key         */
/* -------------------------------------------------------------------------- */
CREATE OR REPLACE FUNCTION generate_id_gender()
    RETURNS TEXT AS $$
    DECLARE
        gender_seqval TEXT;
        gender_id TEXT;
    BEGIN
        SELECT nextval('gender_seq') INTO gender_seqval;
        gender_id := 'GEN' || gender_seqval;
        RETURN gender_id;
    END;
    $$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_id_project_category()
    RETURNS TEXT AS $$
    DECLARE
        project_category_seqval TEXT;
        project_category_id TEXT;
    BEGIN
        SELECT nextval('project_category_seq') INTO project_category_seqval;
        project_category_id := 'PRC' || project_category_seqval;
        RETURN project_category_id;
    END;
    $$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_id_role()
    RETURNS TEXT AS $$
    DECLARE
        role_seqval TEXT;
        role_id TEXT;
    BEGIN
        SELECT nextval('role_seq') INTO role_seqval;
        role_id := 'ROL' || role_seqval;
        RETURN role_id;
    END;
    $$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_id_task_category()
    RETURNS TEXT AS $$
    DECLARE
        task_category_seqval TEXT;
        task_category_id TEXT;
    BEGIN
        SELECT nextval('task_category_seq') INTO task_category_seqval;
        task_category_id := 'TAC' || task_category_seqval;
        RETURN task_category_id;
    END;
    $$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_id_meeting_category()
    RETURNS TEXT AS $$
    DECLARE
        meeting_category_seqval TEXT;
        meeting_category_id TEXT;
    BEGIN
        SELECT nextval('meeting_category_seq') INTO meeting_category_seqval;
        meeting_category_id := 'MEC' || meeting_category_seqval;
        RETURN meeting_category_id;
    END;
    $$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_id_report_category()
    RETURNS TEXT AS $$
    DECLARE
        report_category_seqval TEXT;
        report_category_id TEXT;
    BEGIN
        SELECT nextval('report_category_seq') INTO report_category_seqval;
        report_category_id := 'REC' || report_category_seqval;
        RETURN report_category_id;
    END;
    $$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_id_comment_category()
    RETURNS TEXT AS $$
    DECLARE
        comment_category_seqval TEXT;
        comment_category_id TEXT;
    BEGIN
        SELECT nextval('comment_category_seq') INTO comment_category_seqval;
        comment_category_id := 'COC' || comment_category_seqval;
        RETURN comment_category_id;
    END;
    $$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_id_room()
    RETURNS TEXT AS $$
    DECLARE
        room_seqval TEXT;
        room_id TEXT;
    BEGIN
        SELECT nextval('room_seq') INTO room_seqval;
        room_id := 'ROM' || room_seqval;
        RETURN room_id;
    END;
    $$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_id_collaborator()
    RETURNS TEXT AS $$
    DECLARE
        collaborator_seqval TEXT;
        collaborator_id TEXT;
    BEGIN
        SELECT nextval('collaborator_seq') INTO collaborator_seqval;
        collaborator_id := 'COL' || collaborator_seqval;
        RETURN collaborator_id;
    END;
    $$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_id_project()
    RETURNS TEXT AS $$
    DECLARE
        project_seqval TEXT;
        project_id TEXT;
    BEGIN
        SELECT nextval('project_seq') INTO project_seqval;
        project_id := 'PRO' || project_seqval;
        RETURN project_id;
    END;
    $$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_id_task()
    RETURNS TEXT AS $$
    DECLARE
        task_seqval TEXT;
        task_id TEXT;
    BEGIN
        SELECT nextval('task_seq') INTO task_seqval;
        task_id := 'TAS' || task_seqval;
        RETURN task_id;
    END;
    $$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_id_subtask()
    RETURNS TEXT AS $$
    DECLARE
        subtask_seqval TEXT;
        subtask_id TEXT;
    BEGIN
        SELECT nextval('subtask_seq') INTO subtask_seqval;
        subtask_id := 'SUB' || subtask_seqval;
        RETURN subtask_id;
    END;
    $$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_id_meeting()
    RETURNS TEXT AS $$
    DECLARE
        meeting_seqval TEXT;
        meeting_id TEXT;
    BEGIN
        SELECT nextval('meeting_seq') INTO meeting_seqval;
        meeting_id := 'MEE' || meeting_seqval;
        RETURN meeting_id;
    END;
    $$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_id_comment()
    RETURNS TEXT AS $$
    DECLARE
        comment_seqval TEXT;
        comment_id TEXT;
    BEGIN
        SELECT nextval('comment_seq') INTO comment_seqval;
        comment_id := 'COM' || comment_seqval;
        RETURN comment_id;
    END;
    $$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_id_report()
    RETURNS TEXT AS $$
    DECLARE
        report_seqval TEXT;
        report_id TEXT;
    BEGIN
        SELECT nextval('report_seq') INTO report_seqval;
        report_id := 'REP' || report_seqval;
        RETURN report_id;
    END;
    $$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_id_team()
    RETURNS TEXT AS $$
    DECLARE
        team_seqval TEXT;
        team_id TEXT;
    BEGIN
        SELECT nextval('team_seq') INTO team_seqval;
        team_id := 'TEA' || team_seqval;
        RETURN team_id;
    END;
    $$
    LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_id_status()
    RETURNS TEXT AS $$
    DECLARE
        status_seqval TEXT;
        status_id TEXT;
    BEGIN
        SELECT nextval('status_seq') INTO status_seqval;
        status_id := 'STA' || status_seqval;
        RETURN status_id;
    END;
    $$
    LANGUAGE plpgsql;
    
  CREATE TABLE
    ProjectCategory (
        id_project_category TEXT DEFAULT generate_id_project_category(),
        label VARCHAR(150) NOT NULL,
        PRIMARY KEY (id_project_category),
        UNIQUE (label)
    );

CREATE TABLE
    status(
        id_status TEXT DEFAULT generate_id_status(),
        label VARCHAR(50) NOT NULL,
        PRIMARY KEY (id_status),
        UNIQUE(label)
    );

CREATE TABLE
    Role (
        id_role TEXT DEFAULT generate_id_role(),
        label VARCHAR(150) NOT NULL,
        PRIMARY KEY (id_role)
    );

CREATE TABLE
    TaskCategory (
        id_task_category TEXT DEFAULT generate_id_task_category(),
        label VARCHAR(150) NOT NULL,
        PRIMARY KEY (id_task_category),
        UNIQUE (label)
    );

CREATE TABLE
    MeetingCategory (
        id_meeting_category TEXT DEFAULT generate_id_meeting_category(),
        label VARCHAR(100) NOT NULL,
        PRIMARY KEY (id_meeting_category),
        UNIQUE (label)
    );

CREATE TABLE
    ReportCategory (
        id_report_category TEXT DEFAULT generate_id_report_category(),
        label VARCHAR(150) NOT NULL,
        PRIMARY KEY (id_report_category)
    );

CREATE TABLE
    Gender (
        id_gender TEXT DEFAULT generate_id_gender(),
        label VARCHAR(150) NOT NULL,
        PRIMARY KEY (id_gender)
    );

CREATE TABLE
    CommentCategory (
        id_comment_category TEXT DEFAULT generate_id_comment_category(),
        label VARCHAR(150) NOT NULL,
        PRIMARY KEY (id_comment_category),
        UNIQUE (label)
    );

CREATE TABLE
    room (
        id_room TEXT DEFAULT generate_id_room(),
        label VARCHAR(150) NOT NULL,
        insert_date VARCHAR(50) DEFAULT NOW (),
        PRIMARY KEY (id_room)
    );

CREATE TABLE
    Collaborator (
        id_collaborator TEXT DEFAULT generate_id_collaborator(),
        name VARCHAR(250) NOT NULL,
        email VARCHAR(250) NOT NULL,
        password VARCHAR(256) NOT NULL,
        date_of_birth DATE NOT NULL,
        insert_date TIMESTAMP DEFAULT NOW (),
        id_gender TEXT,
        id_role TEXT,
        PRIMARY KEY (id_collaborator),
        UNIQUE (email),
        FOREIGN KEY (id_gender) REFERENCES Gender (id_gender) ON DELETE CASCADE,
        FOREIGN KEY (id_role) REFERENCES Role (id_role) ON DELETE CASCADE
    );

CREATE TABLE
    Project (
        id_project TEXT DEFAULT generate_id_project(),
        name TEXT NOT NULL, 
        description TEXT NOT NULL,
        start_date DATE NOT NULL,
        end_date DATE NOT NULL,
        insert_date TIMESTAMP DEFAULT NOW (),
        id_responsable TEXT,
        id_project_category TEXT,
        id_status TEXT NOT NULL, 
        PRIMARY KEY (id_project),
        FOREIGN KEY (id_responsable) REFERENCES Collaborator (id_collaborator)  ON DELETE CASCADE,
        FOREIGN KEY (id_status) REFERENCES status(id_status)  ON DELETE CASCADE,
        FOREIGN KEY (id_project_category) REFERENCES ProjectCategory (id_project_category)  ON DELETE CASCADE,
        CHECK(start_date < end_date)
    );

CREATE TABLE
    Task (
        id_task TEXT DEFAULT generate_id_task(),
        name TEXT NOT NULL, 
        description TEXT NOT NULL,
        start_date TIMESTAMP NOT NULL,
        end_date TIMESTAMP NOT NULL,
        insert_date TIMESTAMP DEFAULT NOW (),
        id_task_category TEXT NOT NULL,
        id_collaborator TEXT,
        id_project TEXT NOT NULL,
        id_status TEXT NOT NULL, 
        PRIMARY KEY (id_task),
        FOREIGN KEY (id_task_category) REFERENCES TaskCategory (id_task_category) ON DELETE CASCADE,
        FOREIGN KEY (id_collaborator) REFERENCES Collaborator (id_collaborator) ON DELETE CASCADE,
        FOREIGN KEY (id_project) REFERENCES Project (id_project) ON DELETE CASCADE,
        FOREIGN KEY (id_status) REFERENCES Status (id_status) ON DELETE CASCADE,
        CHECK(start_date < end_date)
    );

CREATE TABLE
    Meeting (
        id_meeting TEXT DEFAULT generate_id_meeting(),
        date_meeting DATE NOT NULL,
        start_time TIME NOT NULL,
        end_time TIME NOT NULL,
        insert_date TIMESTAMP DEFAULT NOW (),
        id_room TEXT,
        id_meeting_category TEXT,
        id_project TEXT,
        id_responsable TEXT,
        id_status TEXT NOT NULL,
        PRIMARY KEY (id_meeting),
        FOREIGN KEY (id_room) REFERENCES room (id_room) ON DELETE CASCADE,
        FOREIGN KEY (id_meeting_category) REFERENCES MeetingCategory (id_meeting_category)  ON DELETE CASCADE,
        FOREIGN KEY (id_project) REFERENCES Project (id_project)  ON DELETE CASCADE,
        FOREIGN KEY (id_responsable) REFERENCES Collaborator (id_collaborator)  ON DELETE CASCADE,
        FOREIGN KEY (id_status) REFERENCES Status (id_status)  ON DELETE CASCADE,
        CHECK(start_time < end_time)
    );

CREATE TABLE
    Comment (
        id_comment TEXT DEFAULT generate_id_comment(),
        comment TEXT NOT NULL,
        insert_date TIMESTAMP DEFAULT NOW (),
        id_task TEXT,
        id_project TEXT,
        id_collaborator TEXT,
        id_comment_category TEXT,
        PRIMARY KEY (id_comment),
        FOREIGN KEY (id_task) REFERENCES Task (id_task) ON DELETE CASCADE,
        FOREIGN KEY (id_project) REFERENCES Project (id_project) ON DELETE CASCADE,
        FOREIGN KEY (id_collaborator) REFERENCES Collaborator (id_collaborator)  ON DELETE CASCADE,
        FOREIGN KEY (id_comment_category) REFERENCES CommentCategory (id_comment_category) ON DELETE CASCADE
    );

CREATE TABLE
    Report (
        id_report TEXT DEFAULT generate_id_report(),
        description TEXT NOT NULL,
        id_project TEXT,
        id_report_category TEXT,
        id_reporter TEXT,
        PRIMARY KEY (id_report),
        FOREIGN KEY (id_project) REFERENCES Project (id_project)  ON DELETE CASCADE,
        FOREIGN KEY (id_report_category) REFERENCES ReportCategory (id_report_category)  ON DELETE CASCADE,
        FOREIGN KEY (id_reporter) REFERENCES Collaborator (id_collaborator)  ON DELETE CASCADE
    );

CREATE TABLE
    Team (
        id_project TEXT DEFAULT generate_id_team(),
        id_collaborator TEXT,
        PRIMARY KEY (id_project, id_collaborator),
        FOREIGN KEY (id_project) REFERENCES Project (id_project)  ON DELETE CASCADE,
        FOREIGN KEY (id_collaborator) REFERENCES Collaborator (id_collaborator)  ON DELETE CASCADE
    );
    
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