unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CPDrv, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, System.Notification;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnConnection: TButton;
    Button3: TButton;
    Button4: TButton;
    comPort: TCommPortDriver;
    Button5: TButton;
    cbComPorts: TComboBox;
    actList: TActionList;
    actConnect: TAction;
    actDisconnect: TAction;
    switchConnection: TAction;
    Notification1: TNotificationCenter;
    procedure comPortReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actConnectExecute(Sender: TObject);
    procedure actDisconnectExecute(Sender: TObject);
    procedure switchConnectionExecute(Sender: TObject);
  private
    { Private declarations }
    procedure switchButtons;
    procedure sendMessage(message: String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

type
  TtrmCommand = class
  public
    Head : byte;
    Command : array[0..20] of byte;
  end;


implementation

{$R *.dfm}

//test_branch_dev_test


procedure Tform1.sendMessage(message: String);
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


procedure TForm1.switchButtons;
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

procedure TForm1.actConnectExecute(Sender: TObject);
begin
  if cbComPorts.Text = '' then
   begin
       sendMessage('Укажите порт');
   end;
  comPort.PortName := cbComPorts.Text;
  comPort.Connect;
  switchButtons;
end;

procedure TForm1.actDisconnectExecute(Sender: TObject);
begin
  comPort.Disconnect;
  switchButtons;
end;

procedure TForm1.switchConnectionExecute(Sender: TObject);
begin
  if comPort.Connected then actDisconnect.Execute
                       else actConnect.Execute;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  data: Array[0..2] of byte;
begin
  data[0] := $55;
  data[1] := $01;
  data[2] := $A9;
  comPort.SendData(@data[0], Length(data));
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 Memo1.Clear;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  data: Array[0..2] of byte;
begin

  data[0] := $55;
  data[1] := $EC;
  data[2] := $BE;

  comPort.SendData(@data[0], Length(data));
end;

procedure TForm1.comPortReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
var
  s: AnsiString;
  hexString: string;
  i: integer;
  buf:string;
begin
  // Копируем полученные байты в строку s
  SetString(s, PAnsiChar(DataPtr), DataSize);

  // Перебираем все байты в строке и конвертируем каждый байт в формат hex
  hexString := '';
  for i := 1 to Length(s) do
  begin
    hexString := hexString + IntToHex(Ord(s[i]), 2) + ' ';
  end;

  memo1.Lines.Append(hexString);

end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  // Получаем список доступных com ports
  comPort.EnumComPorts(cbComPorts.Items);
  //Если список не пуст, выбираем первый
  if cbComPorts.Items.Count <> 0 then
    cbComPorts.ItemIndex := 0;
end;

end.
