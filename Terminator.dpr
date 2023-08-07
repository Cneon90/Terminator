program Terminator;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  Terminal in 'lib\Terminal.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
