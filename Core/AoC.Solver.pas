unit AoC.Solver;

interface

uses
   AoC.Day;

function RunPart(Day: TAoCDay; Part: Integer; const Input: string): string;

implementation

uses
   SysUtils;

function RunPart(Day: TAoCDay; Part: Integer; const Input: string): string;
begin
   case Part of
      1:
         Result := Day.Part1(Input);
      2:
         Result := Day.Part2(Input);
   else
      raise Exception.CreateFmt('Invalid part: %d', [Part]);
   end;
end;

end.

