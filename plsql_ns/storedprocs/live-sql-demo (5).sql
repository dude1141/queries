SET SERVEROUTPUT ON;
DECLARE
   eemp number(10);
   efirst_name varchar2(10);
BEGIN
    SELECT employee_id, first_name INTO eemp, efirst_name FROM HR.employees WHERE EMPLOYEE_ID = &EMPLOYEE_ID;
    DBMS_OUTPUT.PUT_LINE('eemp  '|| eemp || 'efirst  ' || efirst_name);
END;
/