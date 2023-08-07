﻿unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CPDrv, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, System.Notification, terminal;

type
  Tfr_main = class(TForm)
    mmTerminal: TMemo;
    btnConnection: TButton;
    btnPing: TButton;
    Button4: TButton;
    comPort: TCommPortDriver;
    btnRead: TButton;
    cbComPorts: TComboBox;
    actList: TActionList;
    actConnect: TAction;
    actDisconnect: TAction;
    switchConnection: TAction;
    Notification1: TNotificationCenter;
    btnWrite: TButton;
    btnClose: TButton;
    actClose: TAction;
    btnInfo: TButton;
    lbInfo: TLabel;
    procedure comPortReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure btnPingClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actConnectExecute(Sender: TObject);
    procedure actDisconnectExecute(Sender: TObject);
    procedure switchConnectionExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
  private
    { Private declarations }
    procedure switchButtons;
    procedure print(buf:Tarray<byte>);
    procedure sendMessage(message: String);
  public
    { Public declarations }
  end;

var
  fr_main: Tfr_main;
  Terminal: Tterminal;
implementation

{$R *.dfm}

//test_branch_dev_test

//Распечатать массив
procedure Tfr_main.Print(buf: TArray<byte>);
var
hexString: string;
i: Integer;
begin
hexString := '';

  for i := 0 to Length(buf) - 1 do
  begin
    hexString := hexString + IntToHex(buf[i], 2) + ' ';
  end;

mmTerminal.Lines.Append(hexString);
end;




procedure Tfr_main.sendMessage(message: String);
var
  Notification: TNotification;
begin
  // Создаем и отправляем уведомление
  Notification := Notification1.CreateNotification;
  try
    Notification.Name := 'MyNotification';
    Notification.AlertBody := message;
    Notification1.PresentNotification(Notification);
  finally
    Notification.Free;
  end;
end;


procedure Tfr_main.switchButtons;
begin
 if comPort.Connected then
  begin
    btnConnection.Caption := 'Disconnect';
//    sendMessage('Подключен');
  end else
  begin
    btnConnection.Caption := 'Connect';
//    sendMessage('Отключен');
  end;
end;

procedure Tfr_main.actCloseExecute(Sender: TObject);
begin
  close;
end;

procedure Tfr_main.actConnectExecute(Sender: TObject);
begin
  if cbComPorts.Text = '' then
   begin
       sendMessage('Укажите порт');
   end;
  comPort.PortName := cbComPorts.Text;
  comPort.Connect;
  switchButtons;
end;

procedure Tfr_main.actDisconnectExecute(Sender: TObject);
begin
  comPort.Disconnect;
  switchButtons;
end;

procedure Tfr_main.switchConnectionExecute(Sender: TObject);
begin
  if comPort.Connected then actDisconnect.Execute
                       else actConnect.Execute;
end;

procedure Tfr_main.btnInfoClick(Sender: TObject);
var i:integer;
begin
  Terminal.info;

  lbInfo.Caption:='';
  if Length(Terminal.serialNumber) = 4 then
    for I := 0 to 3 do
      lbInfo.Caption := lbInfo.Caption + IntToHex(Terminal.serialNumber[i], 2);



end;

procedure Tfr_main.btnPingClick(Sender: TObject);
begin
  Terminal.ping;
end;

procedure Tfr_main.Button4Click(Sender: TObject);
begin
 mmTerminal.Clear;
end;

procedure Tfr_main.btnReadClick(Sender: TObject);
begin
  Terminal.getTerminalConfig;
end;

procedure Tfr_main.comPortReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
var
  s: AnsiString;
  hexString: string;
  i: integer;
  buf: TArray<byte>;
begin
  SetLength(buf, DataSize);
  Move(DataPtr^, buf[0], DataSize);
  Print(buf);
  Terminal.checkAnswer(buf);
end;


procedure Tfr_main.FormCreate(Sender: TObject);
begin
   //Передача компонента
   Terminal := Tterminal.Create(comPort);

  // Получаем список доступных com ports
  comPort.EnumComPorts(cbComPorts.Items);
  //Если список не пуст, выбираем первый
  if cbComPorts.Items.Count <> 0 then
    cbComPorts.ItemIndex := 0;

end;

end.
