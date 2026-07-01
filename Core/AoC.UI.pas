unit AoC.UI;

interface

uses
   AoC.Registry;

procedure FillYears(var Years: array of Integer; var Count: Integer);

procedure FillDays(Year: Integer; var Days: array of Integer; var Count: Integer);

implementation

procedure FillYears(var Years: array of Integer; var Count: Integer);
begin
   GetAvailableYears(Years);
   Count := GetAvailableYearCount;
end;

procedure FillDays(Year: Integer; var Days: array of Integer; var Count: Integer);
begin
   GetAvailableDays(Year, Days);
   Count := GetAvailableDayCount(Year);
end;

end.

