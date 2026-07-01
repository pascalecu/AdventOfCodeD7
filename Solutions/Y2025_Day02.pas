unit Y2025_Day02;

interface

uses
   AoC.Day, AoC.Registry;

type
   TRange = record
      First: Int64;
      Last: Int64;
   end;

   TDay2025_02 = class(TAoCDay)
   public
      function Part1(const Input: string): string; override;
      function Part2(const Input: string): string; override;
   end;

implementation

uses
   SysUtils;

function ParseInt64(const S: string; var P: Integer): Int64;
begin
   Result := 0;
   while (P <= Length(S)) and (S[P] in ['0'..'9']) do
   begin
      Result := Result * 10 + Ord(S[P]) - Ord('0');
      Inc(P);
   end;
end;

function ParseRange(const S: string; var P: Integer): TRange;
begin
   Result.First := ParseInt64(S, P);
   Inc(P); // '-'
   Result.Last := ParseInt64(S, P);

   if (P <= Length(S)) and (S[P] = ',') then
      Inc(P);
end;

function IsRepeatedTwice(N: Int64): Boolean;
var
   Half, Divisor, Tmp: Int64;
   Digits: Integer;
begin
   Result := False;

   if N < 10 then
      Exit;

   Tmp := N;
   Digits := 0;

   while Tmp > 0 do
   begin
      Inc(Digits);
      Tmp := Tmp div 10;
   end;

   if Odd(Digits) then
      Exit;

   Half := Digits div 2;

   Divisor := 1;
   while Half > 0 do
   begin
      Divisor := Divisor * 10;
      Dec(Half);
   end;

   Result := (N div Divisor) = (N mod Divisor);
end;

function IsRepeatedAtLeastTwice(N: Int64): Boolean;
var
   S, Tmp: Int64;
   Len, PatternLen, RepeatCount: Int64;
   Base, Pattern: Int64;
begin
   Result := False;

   if N < 10 then
      Exit;

   Tmp := N;
   Len := 0;

   while Tmp > 0 do
   begin
      Inc(Len);
      Tmp := Tmp div 10;
   end;

   PatternLen := 1;
   while PatternLen <= (Len div 2) do
   begin
		if Len mod PatternLen <> 0 then
		begin
			Inc(PatternLen);
			Continue;
		end;

      Base := 1;
      Tmp := 1;
      while Tmp <= PatternLen do
      begin
         Base := Base * 10;
         Inc(Tmp);
      end;

      Pattern := N mod Base;

      S := N;
      Result := True;
      RepeatCount := Len div PatternLen;

      while RepeatCount > 1 do
      begin
         S := S div Base;
         if (S mod Base) <> Pattern then
         begin
            Result := False;
            Break;
         end;

         Dec(RepeatCount);
      end;

      if Result then
         Exit;

      Inc(PatternLen);
   end;
end;

function SolvePart1(const Input: string): Int64;
var
   P: Integer;
   R: TRange;
   X: Int64;
begin
   Result := 0;
   P := 1;

   while P <= Length(Input) do
   begin
      R := ParseRange(Input, P);

      X := R.First;
      while X <= R.Last do
      begin
         if IsRepeatedTwice(X) then
            Inc(Result, X);
         Inc(X);
      end;
   end;
end;

function SolvePart2(const Input: string): Int64;
var
   P: Integer;
   R: TRange;
   X: Int64;
begin
   Result := 0;
   P := 1;

   while P <= Length(Input) do
   begin
      R := ParseRange(Input, P);

      X := R.First;
      while X <= R.Last do
      begin
         if IsRepeatedAtLeastTwice(X) then
            Inc(Result, X);
         Inc(X);
      end;
   end;
end;

function TDay2025_02.Part1(const Input: string): string;
begin
   Result := IntToStr(SolvePart1(Input));
end;

function TDay2025_02.Part2(const Input: string): string;
begin
   Result := IntToStr(SolvePart2(Input));
end;

initialization
   RegisterDay(2025, 2, TDay2025_02);

end.

