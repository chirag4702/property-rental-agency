create or replace NONEDITIONABLE PROCEDURE GetTenantDetails(prop IN NUMBER) AS
  aadha NUMBER;
  CURSOR tenant_details_cursor IS
    SELECT tenant_id
    FROM property_tenant
    WHERE prop_id = prop and end_date>current_date ;
  user_details_cursor SYS_REFCURSOR; -- cursor declaration
  user_details_rec user_details%ROWTYPE;
BEGIN
  OPEN tenant_details_cursor;
  LOOP
    FETCH tenant_details_cursor INTO aadha;
    EXIT WHEN tenant_details_cursor%NOTFOUND;
    OPEN user_details_cursor FOR
      SELECT *
      FROM user_details
      WHERE AADHAR = aadha;
    LOOP
      FETCH user_details_cursor INTO user_details_rec;
      EXIT WHEN user_details_cursor%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('Aadhar: '|| user_details_rec.aadhar || ' Name: ' ||
                           user_details_rec.name || ' Age: ' ||
                           user_details_rec.age || ' City: ' ||
                           user_details_rec.city|| ' Street: ' ||
                           user_details_rec.street|| ' State: ' ||
                           user_details_rec.state|| ' Pincode: ' ||
                           user_details_rec.pincode|| ' DoorNo: ' ||
                           user_details_rec.doorno|| ' Username: ' ||
                           user_details_rec.username);
    END LOOP;
    CLOSE user_details_cursor;
  END LOOP;
  CLOSE tenant_details_cursor;
END;
