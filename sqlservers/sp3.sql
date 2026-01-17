create proc sp3
as
begin

if OBJECT_iD('salestemp2..temptable') is null  -- IF OBJECT EXISTS IN DATABASE OR NOT IF NOT CREATE TABLE
begin
create table salestemp2..temptable (id varchar(10), name varchar(10), score int)
end
  else
    begin
    insert into  salestemp2..temptable values (1,'SQL SERVER', 200)
end
end


EXEC  sp3
