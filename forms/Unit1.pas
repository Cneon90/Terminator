unit unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  Tfr_Terminal = class(TForm)
    mmTerminal: TMemo;
    plButtons: TPanel;
    btnExit: TButton;
    Button1: TButton;
    Button4: TButton;
    btnGetName: TButton;
    btnInfo: TButton;
    btnWrite: TButton;
    btnRead: TButton;
    btnPing: TButton;
    procedure btnExitClick(Sender: TObject);
    procedure btnPingClick(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure btnGetNameClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fr_Terminal: Tfr_Terminal;

implementation

{$R *.dfm}

uses Terminal, main;

procedure Tfr_Terminal.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure Tfr_Terminal.btnGetNameClick(Sender: TObject);
begin
//   fr_main.sendMessage(fr_main.Terminal.getNameTerminal);
end;

procedure Tfr_Terminal.btnInfoClick(Sender: TObject);
begin
   fr_main.Terminal.info;
end;

procedure Tfr_Terminal.btnPingClick(Sender: TObject);
begin
   fr_main.Terminal.ping;
end;

procedure Tfr_Terminal.btnReadClick(Sender: TObject);
begin
   fr_main.Terminal.getTerminalConfig;
end;

procedure Tfr_Terminal.Button1Click(Sender: TObject);
var
  st : string;
  i : integer;

begin
  st:=st+#13+'TerminalName'+fr_main.Terminal.getNameTerminalConfig;
  mmTerminal.Lines.Append(st);
end;

procedure Tfr_Terminal.Button4Click(Sender: TObject);
begin
  mmTerminal.Clear;
end;

end.
