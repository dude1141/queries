
# function return <exp> should match the return number
create or replace function newfunc(empid in number) 
	return number is
	emprec employees_test%ROWTYPE;
	v_sal number;

BEGIN
		
    select * into emprec from employees_test 
	where employee_id= empid;
	
	v_sal := emprec.salary;
	
	dbms_output.put_line('sal' || v_sal);
	dbms_output.put_line('employee_id' || emprec.employee_id);
	
	return v_sal;

end;
/


declare

result number;

begin
	
	   result := newfunc(102);
    dbms_output.put_line('Returned Salary: ' || result);
	
end;



empid900
employee_id102
Returned Salary: 900


PL/SQL procedure successfully completed.

Elapsed: 00:00:00.005









create or replace package sals as 
  function newfunc(EMPID in number)
    return number;
end sals;
/

create or replace package body sals as 
FUNCTION  newfunc(empid in number) 
	return number is
	emprec employees_test%ROWTYPE;
	v_sal number;

BEGIN
		
    select * into emprec from employees_test where employee_id= empid;
	-- return v_sal;
	
	v_sal := emprec.salary;
	
	dbms_output.put_line('empid' || v_sal);
	dbms_output.put_line('employee_id' || emprec.employee_id);
	
	return v_sal;
    end newfunc;
end sals;
/


declare

result number;

begin
	
	   result := newfunc(102);
    dbms_output.put_line('Returned Salary: ' || result);
	
end;

