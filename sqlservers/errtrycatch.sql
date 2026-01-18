alter proc division(@X int, @Y int)
as
begin
begin try
declare @z int
set @z=@x/@y
print('the output values is'+ cast(@z as varchar))
end try
begin catch
 print error_message()
end catch
end

exec division 100,0

