CREATE TABLE
    ProjectCategory (
        id_project_category TEXT DEFAULT generate_id_project_category(),
        label VARCHAR(150) NOT NULL,
        PRIMARY KEY (id_project_category),
        UNIQUE (label)
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
        FOREIGN KEY (id_gender) REFERENCES Gender (id_gender),
        FOREIGN KEY (id_role) REFERENCES Role (id_role)
    );

CREATE TABLE
    Project (
        id_project TEXT DEFAULT generate_id_project(),
        start_date TIMESTAMP NOT NULL,
        end_date TIMESTAMP NOT NULL,
        insert_date TIMESTAMP DEFAULT NOW (),
        id_responsable TEXT,
        id_project_category TEXT,
        PRIMARY KEY (id_project),
        FOREIGN KEY (id_responsable) REFERENCES Collaborator (id_collaborator),
        FOREIGN KEY (id_project_category) REFERENCES ProjectCategory (id_project_category)
    );

CREATE TABLE
    Task (
        id_task TEXT DEFAULT generate_id_task(),
        start_date TIMESTAMP NOT NULL,
        end_date TIMESTAMP NOT NULL,
        insert_date TIMESTAMP DEFAULT NOW (),
        finished_date TIMESTAMP,
        id_task_category TEXT,
        id_collaborator TEXT,
        PRIMARY KEY (id_task),
        FOREIGN KEY (id_task_category) REFERENCES TaskCategory (id_task_category),
        FOREIGN KEY (id_collaborator) REFERENCES Collaborator (id_collaborator)
    );

CREATE TABLE
    Subtask (
        id_subtask TEXT DEFAULT generate_id_subtask(),
        name VARCHAR(250) NOT NULL,
        start_date TIMESTAMP NOT NULL,
        end_date TIMESTAMP NOT NULL,
        date_insertion TIMESTAMP DEFAULT NOW (),
        progress NUMERIC(5, 2) DEFAULT 0,
        id_task_category TEXT,
        id_task TEXT,
        PRIMARY KEY (id_subtask),
        FOREIGN KEY (id_task_category) REFERENCES TaskCategory (id_task_category),
        FOREIGN KEY (id_task) REFERENCES Task (id_task)
    );

CREATE TABLE
    Meeting (
        id_meeting TEXT DEFAULT generate_id_meeting(),
        start_date TIMESTAMP NOT NULL,
        end_date VARCHAR(50) NOT NULL,
        insert_date VARCHAR(50) DEFAULT NOW (),
        id_room TEXT,
        id_meeting_category TEXT,
        id_project TEXT,
        id_responsable TEXT,
        PRIMARY KEY (id_meeting),
        FOREIGN KEY (id_room) REFERENCES room (id_room),
        FOREIGN KEY (id_meeting_category) REFERENCES MeetingCategory (id_meeting_category),
        FOREIGN KEY (id_project) REFERENCES Project (id_project),
        FOREIGN KEY (id_responsable) REFERENCES Collaborator (id_collaborator)
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
        FOREIGN KEY (id_task) REFERENCES Task (id_task),
        FOREIGN KEY (id_project) REFERENCES Project (id_project),
        FOREIGN KEY (id_collaborator) REFERENCES Collaborator (id_collaborator),
        FOREIGN KEY (id_comment_category) REFERENCES CommentCategory (id_comment_category)
    );

CREATE TABLE
    Report (
        id_report TEXT DEFAULT generate_id_report(),
        description TEXT NOT NULL,
        id_project TEXT,
        id_report_category TEXT,
        id_reporter TEXT,
        PRIMARY KEY (id_report),
        FOREIGN KEY (id_project) REFERENCES Project (id_project),
        FOREIGN KEY (id_report_category) REFERENCES ReportCategory (id_report_category),
        FOREIGN KEY (id_reporter) REFERENCES Collaborator (id_collaborator)
    );

CREATE TABLE
    Team (
        id_project TEXT DEFAULT generate_id_team(),
        id_collaborator TEXT,
        PRIMARY KEY (id_project, id_collaborator),
        FOREIGN KEY (id_project) REFERENCES Project (id_project),
        FOREIGN KEY (id_collaborator) REFERENCES Collaborator (id_collaborator)
    );