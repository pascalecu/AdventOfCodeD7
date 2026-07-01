unit TestDay2025_01;

interface

uses
   TestFramework, Y2025_Day01;

type
   TTestDay2025_01 = class(TTestCase)
   private
      FDay: TDay2025_01;
   protected
      procedure SetUp; override;
      procedure TearDown; override;
   published
      procedure TestPart1;
      procedure TestPart2;
   end;

implementation

uses
   SysUtils;

procedure TTestDay2025_01.SetUp;
begin
   FDay := TDay2025_01.Create;
end;

procedure TTestDay2025_01.TearDown;
begin
   FDay.Free;
end;

procedure TTestDay2025_01.TestPart1;
const
	Input =
		'L68'#10 +
		'L30'#10 +
		'R48'#10 +
		'L5'#10 +
		'R60'#10 +
		'L55'#10 +
		'L1'#10 +
		'L99'#10 +
		'R14'#10 +
		'L82';
begin
	CheckEquals('3', FDay.Part1(Input));
end;

procedure TTestDay2025_01.TestPart2;
var
	Input: string;
begin
	Input := 'abcdef';
   CheckEquals('6', FDay.Part2(Input));
end;

initialization
   RegisterTest(TTestDay2025_01.Suite);

end.

