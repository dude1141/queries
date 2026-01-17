create procedure evenorodd (@N int)
as
begin

Declare  @c INT

SET @c =@N%2

if @c=0
print 'even numnber'
else
print 'odd number'

end

Exec evenorodd @N=24;
