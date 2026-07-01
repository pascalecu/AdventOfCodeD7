unit Y2025_Day03;

interface

uses
   AoC.Day, AoC.Registry;

type
   TDay2025_03 = class(TAoCDay)
   public
      function Part1(const Input: string): string; override;
      function Part2(const Input: string): string; override;
   end;

implementation

uses
   SysUtils, Classes;

function MaxJoltage(const S: string; Keep: Integer): Int64;
var
   Stack: string;
   Top, Drop, I: Integer;
begin
   SetLength(Stack, Length(S));

   Top := 0;
   Drop := Length(S) - Keep;

   for I := 1 to Length(S) do
   begin
      while (Drop > 0) and (Top > 0) and (Stack[Top] < S[I]) do
      begin
         Dec(Top);
         Dec(Drop);
      end;

      Inc(Top);
      Stack[Top] := S[I];
   end;

   SetLength(Stack, Keep);
   Result := StrToInt64(Stack);
end;

function Solve(const Input: string; Keep: Integer): Int64;
var
   Lines: TStringList;
   I: Integer;
begin
   Result := 0;
   Lines := TStringList.Create;
   try
      Lines.Text := Input;
      for I := 0 to Lines.Count - 1 do
         if Lines[I] <> '' then
            Inc(Result, MaxJoltage(Lines[I], Keep));
   finally
      Lines.Free;
   end;
end;

function TDay2025_03.Part1(const Input: string): string;
begin
   Result := IntToStr(Solve(Input, 2));
end;

function TDay2025_03.Part2(const Input: string): string;
begin
   Result := IntToStr(Solve(Input, 12));
end;

initialization
   RegisterDay(2025, 3, TDay2025_03);

end.

