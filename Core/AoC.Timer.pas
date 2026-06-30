unit AoC.Timer;

interface

uses
   Windows;

type
   TAoCStopWatch = class
   private
      FStart: Int64;
      FStop: Int64;
      FRunning: Boolean;
      class function Frequency: Int64;
      function NowCounter: Int64;
   public
      procedure Start;
      procedure Stop;
      procedure Reset;

      function ElapsedSeconds: Double;
      function ElapsedMilliseconds: Double;
      function ElapsedMicroseconds: Double;
      function ToString: string;
   end;

implementation

uses
   SysUtils;

var
   GFrequency: Int64 = 0;

class function TAoCStopWatch.Frequency: Int64;
begin
   Result := GFrequency;
end;

function TAoCStopWatch.NowCounter: Int64;
begin
   if FRunning then
      QueryPerformanceCounter(Result)
   else
      Result := FStop;
end;

procedure TAoCStopWatch.Start;
begin
   QueryPerformanceCounter(FStart);
   FRunning := True;
end;

procedure TAoCStopWatch.Stop;
begin
   QueryPerformanceCounter(FStop);
   FRunning := False;
end;

procedure TAoCStopWatch.Reset;
begin
   FStart := 0;
   FStop := 0;
   FRunning := False;
end;

function TAoCStopWatch.ElapsedSeconds: Double;
begin
   if Frequency = 0 then
      Result := 0
   else
      Result := (NowCounter - FStart) / Frequency;
end;

function TAoCStopWatch.ElapsedMilliseconds: Double;
begin
   if Frequency = 0 then
      Result := 0
   else
      Result := (NowCounter - FStart) * 1000.0 / Frequency;
end;

function TAoCStopWatch.ElapsedMicroseconds: Double;
begin
   if Frequency = 0 then
      Result := 0
   else
      Result := (NowCounter - FStart) * 1000000.0 / Frequency;
end;

function TAoCStopWatch.ToString;
begin
   Result := FormatFloat('0.000 ms', ElapsedMilliseconds);
end;

initialization
   QueryPerformanceFrequency(GFrequency);

end.

