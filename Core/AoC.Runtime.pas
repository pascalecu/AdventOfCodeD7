unit AoC.Runtime;

interface

uses
   AoC.Registry, AoC.Input, AoC.Timer, AoC.Solver, AoC.Day, AoC.Result;

function Execute(Year, Day, Part: Integer): TAoCResult; overload;

function Execute(Year, Day, Part: Integer; const Input: string): TAoCResult; overload;

implementation

function Execute(Year, Day, Part: Integer): TAoCResult;
begin
   Result := Execute(Year, Day, Part, LoadInput(Year, Day));
end;

function Execute(Year, Day, Part: Integer; const Input: string): TAoCResult;
var
   D: TAoCDay;
   SW: TAoCStopWatch;
begin
   D := GetDay(Year, Day);
   SW := TAoCStopWatch.Create;
   try
      SW.Start;
      Result.Output := RunPart(D, Part, Input);
      SW.Stop;
      Result.TimeMs := SW.ElapsedMilliseconds;
   finally
      D.Free;
      SW.Free;
   end;

end;

end.

