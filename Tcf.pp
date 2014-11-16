program Tcf;
{$mode objfpc}

uses
    Sysutils;

begin
try
    try
        try
            try
                raise Exception.create('Foo');
            except
                On E: Exception do
                begin
                    WriteLn('Inner Catch');
                    raise;
                end;
            end;
        finally
            WriteLn('Inner Finaly');
        end;
    except
        On E: Exception do
        begin
            WriteLn('Outer Catch');
        end;
    end;
finally
    WriteLn('Outer Finally');
end;

end.
