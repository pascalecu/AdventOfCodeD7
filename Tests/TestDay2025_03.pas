unit TestDay2025_03;

interface

uses
   TestFramework, Y2025_Day03;

type
   TTestDay2025_03 = class(TTestCase)
   private
      FDay: TDay2025_03;
   protected
      procedure SetUp; override;
      procedure TearDown; override;
   published
      procedure TestPart1IndividualRanges;
      procedure TestPart1Example;
      procedure TestPart2IndividualRanges;
      procedure TestPart2Example;
   end;

implementation

procedure TTestDay2025_03.SetUp;
begin
   FDay := TDay2025_03.Create;
end;

procedure TTestDay2025_03.TearDown;
begin
   FDay.Free;
end;

const
	(*
	987654321111111
	811111111111119
	234234234234278
	818181911112111
	*)
   ExampleInput = '987654321111111' + #10 + '811111111111119' + #10 + '234234234234278' + #10 + '818181911112111';

procedure TTestDay2025_03.TestPart1IndividualRanges;
begin
   CheckEquals('98', FDay.Part1('987654321111111'));
	CheckEquals('89', FDay.Part1('811111111111119'));
   CheckEquals('78', FDay.Part1('234234234234278'));
   CheckEquals('92', FDay.Part1('818181911112111'));
end;

procedure TTestDay2025_03.TestPart1Example;
begin
   CheckEquals('357', FDay.Part1(ExampleInput));
end;

procedure TTestDay2025_03.TestPart2IndividualRanges;
begin
   CheckEquals('987654321111', FDay.Part2('987654321111111'));
   CheckEquals('811111111119', FDay.Part2('811111111111119'));
   CheckEquals('434234234278', FDay.Part2('234234234234278'));
   CheckEquals('888911112111', FDay.Part2('818181911112111'));
end;

procedure TTestDay2025_03.TestPart2Example;
begin
   CheckEquals('3121910778619', FDay.Part2(ExampleInput));
end;

initialization
   RegisterTest(TTestDay2025_03.Suite);

end.

