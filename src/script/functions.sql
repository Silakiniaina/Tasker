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

CREATE OR REPLACE FUNCTION generate_id_priority()
    RETURNS TEXT AS $$
    DECLARE
        priority_seqval TEXT;
        priority_id TEXT;
    BEGIN
        SELECT nextval('priority_seq') INTO priority_seqval;
        priority_id := 'PRI' || priority_seqval;
        RETURN priority_id;
    END;
    $$
    LANGUAGE plpgsql;