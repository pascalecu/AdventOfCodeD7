program AdventOfCode;

uses
  Forms,
  FMain in 'Forms\FMain.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
