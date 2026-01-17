
create PROCEDURE getcustomers12 @Country NVARCHAR(50)
AS
BEGIN
Declare @totalcustomers INT, @Avgscore FLOAT;
--using if else and update
if exists(select 1 from dbo.Customers where Country=@Country and Score is null)
BEGIN
	update dbo.Customers 
	set Score=0
	where  country=@Country and Score is null;
	END
ELSE
BEGIN
	PRINT('No null values found')
END;
    SELECT @totalcustomers= count(*) , @Avgscore=AVG(Score) FROM dbo.Customers where Country=@country ;
		--select count(o.OrderID) as totalorders, sum(o.Sales) as totalsales
	--from dbo.Customers c join dbo.Orders o on c.CustomerID=o.CustomerID
	--where c.Country= @country ;
	print 'Total customers from ' + @Country  + '=' + cast(@totalcustomers as NVARCHAR);
	print 'AVG score from ' + @Country  + '=' + cast(@Avgscore as NVARCHAR);
	END
GO





alter PROCEDURE getcustomers123 @Country NVARCHAR(50)
AS
BEGIN
BEGIN TRY
Declare @totalcustomers INT, @Avgscore FLOAT;
--using if else and update
if exists(select 1 from dbo.Customers where Country=@Country and Score is null)
BEGIN
	update dbo.Customers 
	set Score=0
	where  country=@Country and Score is null;
	END
ELSE
BEGIN
	PRINT('No null values found')
END;
    SELECT @totalcustomers= count(*) , @Avgscore=AVG(Score) FROM dbo.Customers where Country=@country ;
	select 1/0 from dbo.Customers;
	print 'Total customers from ' + @Country  + '=' + cast(@totalcustomers as NVARCHAR);
	print 'AVG score from ' + @Country  + '=' + cast(@Avgscore as NVARCHAR);
	END TRY
		BEGIN CATCH
			print ('An error occured');
			print('Error message: ');
		END CATCH
	END
Go
exec getcustomers123 @Country='Germany';