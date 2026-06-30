unit AoC.Day;

interface

type
   TAoCDay = class
   public
      function Part1(const Input: string): string; virtual; abstract;
      function Part2(const Input: string): string; virtual; abstract;
   end;

   TAoCDayClass = class of TAoCDay;

implementation

end.

