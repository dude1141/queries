Declare
vsal hr.employees.salary %type;
cursor c1 is select salary from HR.employees;
Begin
    OPEN c1;
    LOOP
    Fetch c1 into vsal ;
dbms_output.put_line(vsal);
    exit when c1%notfound;
    end loop;
    CLOSE c1;
end;

-- select salary from HR.employees;