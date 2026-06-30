unit AoC.Registry;

interface

uses
   AoC.Day;

procedure RegisterDay(Year, Day: Integer; C: TAoCDayClass);

function GetDay(Year, Day: Integer): TAocDay;

function IsRegistered(Year, Day: Integer): Boolean;

function GetAvailableDayCount(Year: Integer): Integer;

procedure GetAvailableDays(Year: Integer; var Days: array of Integer);

function GetAvailableYearCount: Integer;

procedure GetAvailableYears(var Years: array of Integer);

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

function ValidYear(Year: Integer): Boolean;
begin
   Result := (Year >= MinYear) and (Year <= MaxYear);
end;

function ValidDay(Day: Integer): Boolean;
begin
   Result := (Day >= MinDay) and (Day <= MaxDay);
end;

function IsRegistered(Year, Day: Integer): Boolean;
begin
   Result := ValidYear(Year) and ValidDay(Day) and Assigned(Registry[Year, Day]);
end;

function HasAnySolution(Year: Integer): Boolean;
var
   D: Integer;
begin
   Result := False;

   if not ValidYear(Year) then
		Exit;

	for D := MinDay to MaxDay do
      if Assigned(Registry[Year, D]) then
      begin
         Result := True;
         Exit;
      end;
end;

procedure RegisterDay(Year, Day: Integer; C: TAoCDayClass);
begin
   if C = nil then
      raise Exception.Create('RegisterDay: nil class');

   if not ValidYear(Year) then
      raise Exception.CreateFmt('invalid year %d', [Year]);

   if not ValidDay(Day) then
      raise Exception.CreateFmt('invalid day: %d', [Day]);

   if Registry[Year, Day] <> nil then
      raise Exception.CreateFmt('Already registered: %d-%2.2d', [Year, Day]);

   Registry[Year, Day] := C;
end;

function GetDay(Year, Day: Integer): TAocDay;
begin

   if not IsRegistered(Year, Day) then
      raise Exception.CreateFmt('Day not registered %d-%2.2d', [Year, Day]);

   Result := Registry[Year, Day].Create;
end;

function GetAvailableDayCount(Year: Integer): Integer;
var
   D: Integer;
begin
   Result := 0;
   if not ValidYear(Year) then
      Exit;

   for D := MinDay to MaxDay do
      if IsRegistered(Year, D) then
         Inc(Result);
end;

procedure GetAvailableDays(Year: Integer; var Days: array of Integer);
var
   D, Index: Integer;
begin
   Index := 0;

   if not ValidYear(Year) then
      Exit;

   for D := MinDay to MaxDay do
   begin
      if not IsRegistered(Year, D) then
         Continue;

      if Index > High(Days) then
         Exit;

      Days[Index] := D;
      Inc(Index);
   end;
end;

function GetAvailableYearCount: Integer;
var
   Y: Integer;
begin
   Result := 0;

   for Y := MinYear to MaxYear do
      if HasAnySolution(Y) then
         Inc(Result);
end;

procedure GetAvailableYears(var Years: array of Integer);
var
   Y, D, Index: Integer;
begin
   Index := 0;

   for Y := MinYear to MaxYear do
   begin
      if not HasAnySolution(Y) then
         Continue;

      if Index > High(Years) then
         Exit;

      Years[Index] := Y;
      Inc(Index);
   end;
end;

initialization
   InitRegistry;

end.

