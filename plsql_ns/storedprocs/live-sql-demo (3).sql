create or replace package first_package
as
PROCEDURE total_salary1(inempid in number);
END first_package;
/

create or replace package body 
 first_package as procedure total_salary1 (inempid in number)
is
   v_salary number(10);
begin
   select salary + (salary * nvl(commission_pct,0))
   into v_salary
   from employees_test
   where employee_id = inempid;

   dbms_output.put_line('vsalary: ' || v_salary);

exception
   when no_data_found then
      dbms_output.put_line('Employee not found');
END first_package;
/

exec total_salary1(101)

SELECT
    EMPLOYEE_ID,
    SALARY,
    COMMISSION_PCT
FROM
    EMPLOYEES_TEST;

SELECT
    EMPLOYEE_ID,
    SALARY,
    COMMISSION_PCT
FROM
    EMPLOYEES_TEST;