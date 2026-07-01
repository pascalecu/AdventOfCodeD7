program TestRunner;

uses
   Forms,
   GUITestRunner,
   TestFramework,
   TestDay2025_01 in 'TestDay2025_01.pas',
   TestDay2025_02 in 'TestDay2025_02.pas';

{$R *.res}

begin
   Application.Initialize;
   GUITestRunner.RunRegisteredTests;
end.

