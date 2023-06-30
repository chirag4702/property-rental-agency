create or replace NONEDITIONABLE PROCEDURE CreateNewUser(
    t_aadhar IN number,
    t_name IN varchar2,
    t_age IN number,
    t_city IN varchar2,
    t_street IN varchar2,
    t_state IN varchar2,
    t_pincode IN number,
    t_doorno IN number,
    t_username IN varchar2,
    t_isowner IN number,
    t_istenant IN number,
    t_ismanager IN number
) AS
BEGIN
    EXECUTE IMMEDIATE 'CREATE USER ' || t_username || ' IDENTIFIED BY ' || t_username;
    EXECUTE IMMEDIATE 'GRANT CONNECT TO '||t_username;
    EXECUTE IMMEDIATE 'insert into user_login values(:1, :2)' USING t_username, t_username;
    EXECUTE IMMEDIATE 'insert into user_details values(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12)'
        USING t_aadhar, t_name, t_age, t_city, t_street, t_state, t_pincode, t_doorno, t_username, t_isowner,t_istenant,t_ismanager;

    IF t_istenant = 1 THEN
        EXECUTE IMMEDIATE 'insert into tenant values(:1)' USING t_aadhar;
    END IF;
    IF t_isowner = 1 THEN
        EXECUTE IMMEDIATE 'insert into owner values(:1)' USING t_aadhar;
        EXECUTE IMMEDIATE 'grant insert on dbms_admin.property to ' || t_username || ' WITH GRANT OPTION';
    END IF;
    IF t_ismanager = 1 THEN
        EXECUTE IMMEDIATE 'insert into manager values(:1)' USING t_aadhar;
    END IF;
END;
