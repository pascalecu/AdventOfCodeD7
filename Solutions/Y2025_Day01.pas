unit Y2025_Day01;

interface

uses
   AoC.Day, AoC.Registry;

type
   TDay2025_01 = class(TAoCDay)
   public
      function Part1(const Input: string): string; override;
      function Part2(const Input: string): string; override;
   end;

implementation

uses
   SysUtils, Classes;

function Solve(const Input: string): Integer;
var
   SL: TStringList;
   I: Integer;
   Line: string;
   Dir: Char;
   Steps: Integer;
   Pos: Integer;
begin
   Result := 0;
   Pos := 50;

   SL := TStringList.Create;
   try
      SL.Text := Input;
      for I := 0 to SL.Count - 1 do
      begin
         Line := Trim(SL[I]);
         if Line = '' then
            Continue;

         Dir := Line[1];
         Steps := StrToInt(Copy(Line, 2, Length(Line)));

         if Dir = 'R' then
            Pos := (Pos + Steps) mod 100
         else
            Pos := (Pos - Steps) mod 100;

         if Pos < 0 then
            Inc(Pos, 100);

         if Pos = 0 then
            Inc(Result);
      end;
   finally
      SL.Free;
   end;
end;

function TDay2025_01.Part1(const Input: string): string;
begin
   Result := IntToStr(Solve(Input));
end;

function TDay2025_01.Part2(const Input: string): string;
begin
   Result := IntToStr(Length(Input) div 2);
end;

initialization
   RegisterDay(2025, 1, TDay2025_01);

end.

