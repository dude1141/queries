create or replace PROCEDURE insertemp (empids varchar2, salarys number,
commission_pcts number)
as 
begin
    insert into employees_test values(empids,salarys,commission_pcts);
commit;
end;
/

exec insertemp(101,1000,1.5);