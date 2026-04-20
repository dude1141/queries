declare
    lvemp employees_test %rowtype;
begin
    select * into lvemp from employees_test
    where employee_id=100;
    DBMS_OUTPUT.PUT_LINE('empid'||lvemp.employee_id);
    DBMS_OUTPUT.PUT_LINE('empsal'||lvemp.salary);

end;
/
