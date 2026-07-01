unit TestDay2025_02;

interface

uses
   TestFramework, Y2025_Day02;

type
   TTestDay2025_02 = class(TTestCase)
   private
      FDay: TDay2025_02;
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

procedure TTestDay2025_02.SetUp;
begin
   FDay := TDay2025_02.Create;
end;

procedure TTestDay2025_02.TearDown;
begin
   FDay.Free;
end;

const
   ExampleInput =
      '11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124';

procedure TTestDay2025_02.TestPart1IndividualRanges;
begin
   CheckEquals('33', FDay.Part1('11-22'));
   CheckEquals('99', FDay.Part1('95-115'));
   CheckEquals('1010', FDay.Part1('998-1012'));
   CheckEquals('1188511885', FDay.Part1('1188511880-1188511890'));
   CheckEquals('222222', FDay.Part1('222220-222224'));
   CheckEquals('0', FDay.Part1('1698522-1698528'));
   CheckEquals('446446', FDay.Part1('446443-446449'));
   CheckEquals('38593859', FDay.Part1('38593856-38593862'));
   CheckEquals('0', FDay.Part1('565653-565659'));
   CheckEquals('0', FDay.Part1('824824821-824824827'));
   CheckEquals('0', FDay.Part1('2121212118-2121212124'));
end;

procedure TTestDay2025_02.TestPart1Example;
begin
	CheckEquals('1227775554', FDay.Part1(ExampleInput));
end;

procedure TTestDay2025_02.TestPart2IndividualRanges;
begin
   CheckEquals('33', FDay.Part2('11-22'));
   CheckEquals('210', FDay.Part2('95-115'));
   CheckEquals('2009', FDay.Part2('998-1012'));
   CheckEquals('1188511885', FDay.Part2('1188511880-1188511890'));
   CheckEquals('222222', FDay.Part2('222220-222224'));
   CheckEquals('0', FDay.Part2('1698522-1698528'));
   CheckEquals('446446', FDay.Part2('446443-446449'));
   CheckEquals('38593859', FDay.Part2('38593856-38593862'));
   CheckEquals('565656', FDay.Part2('565653-565659'));
   CheckEquals('824824824', FDay.Part2('824824821-824824827'));
   CheckEquals('2121212121', FDay.Part2('2121212118-2121212124'));
end;

procedure TTestDay2025_02.TestPart2Example;
begin
   CheckEquals('4174379265', FDay.Part2(ExampleInput));
end;

initialization
   RegisterTest(TTestDay2025_02.Suite);

end.

