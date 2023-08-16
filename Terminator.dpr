program Terminator;

uses
  Vcl.Forms,
  main in 'main.pas' {fr_main},
  Terminal in 'lib\Terminal.pas',
  Unit1 in 'forms\Unit1.pas' {fr_Terminal},
  TerminalThread in 'lib\TerminalThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfr_main, fr_main);
  Application.CreateForm(Tfr_Terminal, fr_Terminal);
  Application.Run;
end.
