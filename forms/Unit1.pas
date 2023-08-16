unit unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

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


//  st:=st+#13+'TerminalName';
//  for I := 0 to 31 do
//    st := st + IntToHex(fr_main.Terminal.TerminalName[i], 2)+' ';
//  st:=st+#13+'Sync';
//
//  for I := 0 to 3 do
//    st := st + IntToHex(fr_main.Terminal.ServerSyncTS[i], 2)+' ';
//  st:=st+#13+'HW Settings 1';
//  for I := 0 to 3 do
//    st := st + IntToHex(fr_main.Terminal.HWSetting1[i], 2)+' ';
//
//    st:=st+#13+'Can Driver Name:';
//  for I := 0 to 15 do
//    st := st + IntToHex(fr_main.Terminal.CANDriverName[i], 2)+' ';
//
//  st:=st+#13+'Can Driver TS:';
//  for I := 0 to 3 do
//    st := st + IntToHex(fr_main.Terminal.CANDriverTS[i], 2)+' ';
//
//  st:=st+#13+'Can Driver Data:';
//  for I := 0 to 99 do
//    st := st + IntToHex(fr_main.Terminal.CANDriverData[i], 2)+' ';
//
//  st:=st+#13+'HWSetting2:';
//  for I := 0 to 44 do
//    st := st + IntToHex(fr_main.Terminal.HWSetting2[i], 2)+' ';
//
//  st:=st+#13+'WiFi Cfg:';
//  for I := 0 to 114 do
//    st := st + IntToHex(fr_main.Terminal.WIFICfg[i], 2)+' ';
//
//  st:=st+#13+'Port:';
//  for I := 0 to 1 do
//    st := st + IntToHex(fr_main.Terminal.ServerPort[i], 2)+' ';

//  st:=st+#13+'HW Settings 3:';
//  for I := 0 to 19 do
//    st := st + IntToHex(fr_main.Terminal.HWSetting3[i], 2)+' ';



 mmTerminal.Lines.Append(st);
end;

procedure Tfr_Terminal.Button4Click(Sender: TObject);
begin
 mmTerminal.Clear;
end;

end.
