declare
    empid number := &empid;
    emprec employees_test%ROWTYPE;
BEGIN		
    select * into emprec from employees_test where empid= &empid;
	
	dbms_output.put_line('empid' || emprec.empid)
	dbms_output.put_line('salary' || emprec.salary)

end;


using stored proceedure:
create or replace procedure news(empid in number) as 
-- declare
    -- empid number := &empid;
    emprec employees_test%ROWTYPE;

BEGIN
		
    select * into emprec from employees_test where employee_id= empid;
	
	dbms_output.put_line('empid' || emprec.employee_id);
	dbms_output.put_line('salary' || emprec.salary);


end;
/




exec news(102);

declare

	begin
	
	for i in loop
	(
		select * from employees_test  where emplyeed between 10 and 20
	)
		dbms_output.put_line('empid' || emprec.empid)
	end loop;

end 



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




packages supports overrloading
same functions with same name different params

we can hide functions and procs.

package :specficatoin and package body:


create or replace package sals as 
 function newfunc (EMPID in number)
 RETURN number
end sals;
/

create or replace package body sals
 as function  newfunc(empid in number) 
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

DECLARE
result number

BEGIN
	result := sals.newfunc(102)

end

employee_id: 102
salary     : 17000
Returned salary: 17000



create or replace package sals as 
 PROCEDURE  newfuncs (EMPID in number)
end sals;
/

create or replace package body sals
 as procedure  newfuncs(empid in number) 
	emprec employees_test%ROWTYPE;
	v_sal number;

BEGIN
		
    select * into emprec from employees_test where employee_id= empid;
	
	v_sal := emprec.salary;
		
	dbms_output.put_line('empid' || v_sal);
	dbms_output.put_line('employee_id' || emprec.employee_id);
	
	
	 end newfunc;

end sals;
/