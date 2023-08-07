program Terminator;

uses
  Vcl.Forms,
  main in 'main.pas' {fr_main},
  Terminal in 'lib\Terminal.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfr_main, fr_main);
  Application.Run;
end.
