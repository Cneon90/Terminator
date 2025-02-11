program Terminator;

uses
  Vcl.Forms,
  main in 'main.pas' {fr_main},
  Terminal in 'lib\Terminal.pas',
  Unit1 in 'forms\Unit1.pas' {fr_Terminal},
  TerminalThread in 'lib\TerminalThread.pas',
  database_setting in 'forms\database_setting.pas' {fr_database},
  decode in 'lib\decode.pas',
  database_load_config in 'forms\database_load_config.pas' {fr_load_config},
  database_save_config in 'forms\database_save_config.pas' {fr_save_config},
  database_select_config in 'forms\database_select_config.pas' {fr_database_load},
  Vcl.Themes,
  Vcl.Styles,
  fr_HWEdit in 'HWEdit\fr_HWEdit.pas' {frHWEdit},
  HWEdit in 'Settings\HWEdit.pas',
  BaseEdit in 'Settings\BaseEdit.pas',
  lib_main in 'lib\lib_main.pas',
  fr_settings in 'HWEdit\fr_settings.pas' {frSettings},
  association in 'Association\association.pas',
  fr_SERVEREdit in 'HWEdit\fr_SERVEREdit.pas' {frServerEdit},
  fr_WIFIEdit in 'HWEdit\fr_WIFIEdit.pas' {frWifiEdit},
  WIFIEdit in 'Settings\WIFIEdit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.Title := 'Terminator';
  Application.CreateForm(Tfr_main, fr_main);
  Application.CreateForm(Tfr_Terminal, fr_Terminal);
  Application.CreateForm(Tfr_database, fr_database);
  Application.CreateForm(Tfr_load_config, fr_load_config);
  Application.CreateForm(Tfr_save_config, fr_save_config);
  Application.CreateForm(Tfr_database_load, fr_database_load);
  Application.CreateForm(TfrHWEdit, frHWEdit);
  Application.CreateForm(TfrSettings, frSettings);
  Application.CreateForm(TfrServerEdit, frServerEdit);
  Application.CreateForm(TfrWifiEdit, frWifiEdit);
  Application.Run;
end.
