
CREATE PROC LOOPITS
as
begin

Declare  @I INT

--SET @c =@N%2
set @I=0;

WHILE (@I <=6)
BEGIN
PRINT datename (dw,@I)
set @i=@i+1
end

end

EXEC LOOPITS
