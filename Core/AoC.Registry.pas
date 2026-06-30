unit AoC.Registry;

interface

uses
   AoC.Day;

procedure RegisterDay(Year, Day: Integer; C: TAoCDayClass);

function GetDay(Year, Day: Integer): TAocDay;

implementation

uses
   SysUtils;

const
   MinYear = 2015;
   MaxYear = 2025;
   MinDay = 1;
   MaxDay = 25;

var
   Registry: array[MinYear..MaxYear, MinDay..MaxDay] of TAoCDayClass;

procedure InitRegistry;
var
   Y, D: Integer;
begin
   for Y := MinYear to MaxYear do
      for D := MinDay to MaxDay do
         Registry[Y, D] := nil;

end;

procedure RegisterDay(Year, Day: Integer; C: TAoCDayClass);
begin
   if C = nil then
      raise Exception.Create('RegisterDay: cannot register nil day class');

   if (Year < MinYear) or (Year > MaxYear) then
      raise Exception.CreateFmt('RegisterDay: invalid year %d', [Year]);

   if (Day < MinDay) or (Day > MaxDay) then
      raise Exception.CreateFmt('RegisterDay: invalid day: %d', [Day]);

   if Registry[Year, Day] <> nil then
      raise Exception.CreateFmt('Day already registered: %d-%2.2d', [Year, Day]);

   Registry[Year, Day] := C;
end;

function GetDay(Year, Day: Integer): TAocDay;
begin
   if (Year < MinYear) or (Year > MaxYear) then
      raise Exception.CreateFmt('GetDay: Invalid year %d', [Year]);

   if (Day < MinDay) or (Day > MaxDay) then
      raise Exception.CreateFmt('GetDay: Invalid day %d', [Day]);

   if not Assigned(Registry[Year, Day]) then
      raise Exception.CreateFmt('GetDay: Day %d-%2.2d not registered', [Year, Day]);

   Result := Registry[Year, Day].Create;
end;

initialization
   InitRegistry;

end.

