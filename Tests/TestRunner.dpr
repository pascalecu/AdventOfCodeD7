program TestRunner;

uses
  Forms,
  GUITestRunner,
  TestFramework,
  AoC.Types in '..\Core\AoC.Types.pas';

{$R *.res}

begin
  Application.Initialize;
  GUITestRunner.RunRegisteredTests;
end.
