unit FMain;

interface

uses
   Classes, Controls, Forms, StdCtrls, ExtCtrls;

type
   TMainForm = class(TForm)
      mmoInput: TMemo;
      cbbYear: TComboBox;
      cbbDay: TComboBox;
      rgPart: TRadioGroup;
      lblYear: TLabel;
      lblDay: TLabel;
      btnSolve: TButton;
      procedure FormCreate(Sender: TObject);
      procedure cbbYearChange(Sender: TObject);
      procedure cbbDayChange(Sender: TObject);
      procedure btnSolveClick(Sender: TObject);
   private
      procedure LoadInputToMemo;
      procedure LoadSolveResult;

      function SelectedDay: Integer;
      function SelectedYear: Integer;
   public
   end;

var
   MainForm: TMainForm;

implementation

uses
   AoC.UI, AoC.Runtime, AoC.Input, AoC.Result, SysUtils;

{$R *.dfm}

function TMainForm.SelectedDay: Integer;
begin
   if cbbDay.ItemIndex < 0 then
      Result := 0
   else
      Result := StrToIntDef(cbbDay.Text, 0);
end;

function TMainForm.SelectedYear: Integer;
begin
   if cbbYear.ItemIndex < 0 then
      Result := 0
   else
      Result := StrToIntDef(cbbYear.Text, 0);
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
   Years: array[0..10] of Integer;
   Count, I: Integer;
begin
   cbbYear.Clear;
   FillYears(Years, Count);

   for I := 0 to Count - 1 do
      cbbYear.Items.Add(IntToStr(Years[I]));

   if cbbYear.Items.Count > 0 then
   begin
      cbbYear.ItemIndex := 0;
      cbbYearChange(nil);
   end;
end;

procedure TMainForm.cbbYearChange(Sender: TObject);
var
   Year: Integer;
   Days: array[0..25] of integer;
   Count, i: Integer;
begin
   Year := SelectedYear;
   if Year = 0 then
      Exit;

   cbbDay.OnChange := nil;
   try
      cbbDay.Items.BeginUpdate;
      try
         cbbDay.Clear;

         FillDays(Year, Days, Count);

         for i := 0 to Count - 1 do
            cbbDay.Items.Add(IntToStr(Days[i]));

         if cbbDay.Items.Count > 0 then
            cbbDay.ItemIndex := 0;
      finally
         cbbDay.Items.EndUpdate;
      end;
   finally
      cbbDay.OnChange := cbbDayChange;
   end;

   LoadInputToMemo;
end;

procedure TMainForm.cbbDayChange(Sender: TObject);
begin
   LoadInputToMemo;
end;

procedure TMainForm.LoadInputToMemo;
var
   Year, Day: Integer;
begin
   Year := SelectedYear;
   Day := SelectedDay;

   if (Year = 0) or (Day = 0) then
      Exit;

   try
      mmoInput.Lines.Text := LoadInput(Year, Day);
   except
      on E: Exception do
         mmoInput.Lines.Text := 'Error loading input: ' + E.Message;
   end;

end;

procedure TMainForm.LoadSolveResult;
var
   Y, D, Part: Integer;
   R1, R2: TAoCResult;
begin
   Y := SelectedYear;
   D := SelectedDay;

   if (Y = 0) or (D = 0) then
      Exit;

   mmoInput.Lines.Add('');

   case rgPart.ItemIndex of
      0:
         begin
            R1 := Execute(Y, D, 1);
            mmoInput.Lines.Add('P1: ' + R1.Output);
            mmoInput.Lines.Add('Time: ' + FloatToStr(R1.TimeMs) + ' ms');
         end;

      1:
         begin
            R2 := Execute(Y, D, 2);
            mmoInput.Lines.Add('P2: ' + R2.Output);
            mmoInput.Lines.Add('Time: ' + FloatToStr(R2.TimeMs) + ' ms');
         end;
   else
      R1 := Execute(Y, D, 1);
      R2 := Execute(Y, D, 2);

      mmoInput.Lines.Add('P1: ' + R1.Output);
      mmoInput.Lines.Add('P2: ' + R2.Output);

      mmoInput.Lines.Add('Total: ' + FloatToStr(R1.TimeMs + R2.TimeMs) + ' ms');
   end;
end;

procedure TMainForm.btnSolveClick(Sender: TObject);
begin
   LoadSolveResult;
end;

end.

