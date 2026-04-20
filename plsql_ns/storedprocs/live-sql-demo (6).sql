declare

c NUMBER :=0;
begin
while (c<5)
loop
DBMS_OUTPUT.PUT_LINE('hello');
c:=c+1;
end loop;
end;
/