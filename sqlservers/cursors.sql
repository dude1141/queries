

---TRIGGERS
select user

--we cant execute manually
--
--trigger does not allow any argument
/*
create trigger 
on table/database/view
for after/ddl/insteadof

as

begin

end */




create table bank
(accno int,
acctname varchar(30),
balance decimal check(balance >0)
);

insert into bank values(1000,'savings',2000)
insert into bank values(2000,'currrent',3000);


--audit
/*
create table adit
( id int identity(1,1),
	servername varchar(110),
	username varchar(100),
	appname varchar(100),
	sysname varchar(100),
	trandate datetime)
	*/

select * From ADIT;


CREATE TRIGGER TRG1
on bank
for insert 
as

begin
       insert into adit values (@@SERVERNAME,USER_NAME(), APP_NAME(),HOST_NAME(), GETDATE())
end


select * From BANK

select * From adit

--update bank set acctname='SALARY' where accno=1000;

-- insert into bank values (10300,'current',500)


--cursors:

--an object which allows to process each row and maniputlate its data. always associated the select query 

--DEClare --open---fetch - no records the close cursor else if there is a record repeate the loop and if reocrd s does not eixist --close cursor


select * From Employees; ---there is a disc burden lot of I/O causing issues.


declare @employeeid int declare @firstname varchar(50) declare @lastname varchar(50)

declare @Mytable as TABLE (employeeid int , fullname varchar(100))
declare Mycursor CURSOR 
	for 
	select employeeid,firstname,lastname from Employees;

OPEN Mycursor

	fetch next from Mycursor into  @employeeid, @firstname ,@lastname --fetch records from Mycursor into temporary variables
	while @@FETCH_STATUS=0

	Begin 
	insert into @Mytable (employeeid,fullname) values (@employeeid,@firstname +''+@lastname)

	fetch next from Mycursor into @employeeid, @firstname,@lastname
	end

CLOSE Mycursor
DEALLOCATE Mycursor

select * from @Mytable;





