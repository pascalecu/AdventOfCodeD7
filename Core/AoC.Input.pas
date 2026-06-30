unit AoC.Input;

interface

function LoadInput(Year, Day: Integer): string;

implementation

uses
   SysUtils, Classes;

function LoadInput(Year, Day: Integer): string;
var
   Path: string;
   SL: TStringList;

   function BasePath: string;
   begin
      Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
   end;

begin
   Path := BasePath + Format('Inputs\%d\%.2d.txt', [Year, Day]);

   SL := TStringList.Create;
   try
      SL.LoadFromFile(Path);
      Result := SL.Text;
   finally
      SL.Free;
   end;
end;

end.

