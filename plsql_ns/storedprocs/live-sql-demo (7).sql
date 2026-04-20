-- create or replace procedure total1 (n1 in number, n2 in number, total out number)
-- as
-- BEGIN
-- total := n1+n2;
-- end;

-- #anaonymous block
-- declare
-- x number;
-- BEGIN
--     total1(7,8,x);
--     DBMS_OUTPUT.PUT_LINE(x);
-- end;


create or replace procedure totalsn(n1 number, n2 number)
as
total number;
begin
    total := n1+n2;
    DBMS_OUTPUT.PUT_LINE(total);
end;
/

exec TOTALSN(9,10)