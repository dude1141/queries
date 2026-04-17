storeprocs


create or replace procedure total_salary1 (inempid in number)
is
   v_sal number(10);
begin
   select salary + (salary * nvl(commission_pct,0)) into v_sal from employees_test
   where employee_id = inempid;
   dbms_output.put_line('vsalary: ' || v_sal);
   end;
/
EXECUTE TOTAL_SALARY1 (100)
