Create or replace package sample_package_names as
    Procedure procedure1;
    Procedure procedure2;
End sample_package_names;
/

Create or replace package body sample_package_names as
    Procedure procedure1 as
    Begin
        dbms_output.put_line(' this is proc1');
    End procedure1;
    Procedure procedure2 as
    Begin
        dbms_output.put_line('this is proc2');
    end procedure2;
end sample_package_names;
/


begin
    sample_package_names.procedure1;
    sample_package_names.procedure2;
end;
/