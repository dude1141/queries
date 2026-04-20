declare
    lvemp employees_test %rowtype;
begin
    select * into lvemp from employees_test
    where employee_id=100;
    DBMS_OUTPUT.PUT_LINE('empid'||lvemp.employee_id);
    DBMS_OUTPUT.PUT_LINE('empsal'||lvemp.salary);

end;
/


-- using %rowtype in plsqlcursors

-- declare
--     lvemp employees_test %rowtype;
-- begin
--     select * into lvemp from employees_test
--     where employee_id=100;
--     DBMS_OUTPUT.PUT_LINE('empid'||lvemp.employee_id);
--     DBMS_OUTPUT.PUT_LINE('empsal'||lvemp.salary);

-- end;
-- /

declare
    CURSOR C1 is select employee_id,salary from EMPLOYEES_TEST;
    lvemp c1%rowtype;
begin
    OPEN c1 ;
    fetch c1 into lvemp;
    -- where employee_id=100;
    DBMS_OUTPUT.PUT_LINE('empid'||lvemp.employee_id);
    DBMS_OUTPUT.PUT_LINE('empsal'||lvemp.salary);
end;
/

select * from EMPLOYEES_TEST;
-- drop trigger TRIGGERNEW;
-- delete from EMPLOYEES_TEST where employee_id=101;
-- commit;
