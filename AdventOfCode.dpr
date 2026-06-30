program AdventOfCode;

uses
  Forms,
  TMainForm in 'Forms\TMainForm.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
