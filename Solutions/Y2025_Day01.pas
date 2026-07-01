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

function Normalize(Pos: Integer): Integer;
begin
   Result := Pos mod 100;
   if Result < 0 then
      Inc(Result, 100);
end;

function CountCrosings(StartPos, Steps: Integer; Dir: Char): Integer;
var
   EndPos, P, I: Integer;
begin
   Result := 0;
   P := StartPos;

   if Dir = 'R' then
   begin
      for I := 1 to Steps do
      begin
         P := (P + 1) mod 100;
         if P = 0 then
            Inc(Result);
      end;
   end
   else
   begin
      for I := 1 to Steps do
      begin
         P := P - 1;
         P := Normalize(P);
         if P = 0 then
            Inc(Result);
      end;
   end;
end;

function Solve(const Input: string; const Part: Integer): Integer;
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

         if Part = 1 then
         begin
            if Dir = 'R' then
               Pos := Normalize(Pos + Steps)
            else
               Pos := Normalize(Pos - Steps);

            if Pos = 0 then
               Inc(Result);
         end
         else
         begin
            Inc(Result, CountCrosings(Pos, Steps, Dir));

            if Dir = 'R' then
               Pos := Normalize(Pos + Steps)
            else
               Pos := Normalize(Pos - Steps);
         end;
      end;
   finally
      SL.Free;
   end;
end;

function TDay2025_01.Part1(const Input: string): string;
begin
   Result := IntToStr(Solve(Input, 1));
end;

function TDay2025_01.Part2(const Input: string): string;
begin
   Result := IntToStr(Solve(Input, 2));
end;

initialization
   RegisterDay(2025, 1, TDay2025_01);

end.

