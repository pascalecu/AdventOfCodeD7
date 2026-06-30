program TestRunner;

uses
  Forms,
  GUITestRunner,
  TestFramework;

{$R *.res}

begin
  Application.Initialize;
  GUITestRunner.RunRegisteredTests;
end.
