program AdventOfCode;

uses
   Forms,
   FMain in 'Forms\FMain.pas',
   Y2025 in 'Solutions\Y2025.pas';

{$R *.res}

begin
   Application.Initialize;
   Application.CreateForm(TMainForm, MainForm);
   Application.Run;
end.

