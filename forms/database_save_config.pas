unit database_save_config;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  Tfr_save_config = class(TForm)
    plMain: TPanel;
    Label1: TLabel;
    DBListBox1: TDBListBox;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    l: TScrollBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fr_save_config: Tfr_save_config;

implementation

{$R *.dfm}

end.
