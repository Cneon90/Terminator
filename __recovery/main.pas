unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CPDrv, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, System.Notification, terminal, IniFiles, Vcl.Menus,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, SyncObjs, TerminalThread,
  Vcl.Imaging.pngimage;

type
  Tfr_main = class(TForm)
    actList: TActionList;
    actConnect: TAction;
    actDisconnect: TAction;
    switchConnection: TAction;
    Notification1: TNotificationCenter;
    actClose: TAction;
    trmAvailableComports: TTimer;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    showfrTerminal: TAction;
    plConnect: TPanel;
    cbComPorts: TComboBox;
    Label1: TLabel;
    btnConnection: TButton;
    Label2: TLabel;
    spConnectins: TShape;
    Label3: TLabel;
    spTerminal: TShape;
    plGeneratorName: TPanel;
    plFirmware: TPanel;
    Label4: TLabel;
    edNameSN: TEdit;
    Label5: TLabel;
    edNameModel: TEdit;
    edNameClient: TEdit;
    Label6: TLabel;
    edNameParkNumber: TEdit;
    Label7: TLabel;
    imgList: TImageList;
    plButtons: TPanel;
    btnLoadFromTerminal: TBitBtn;
    gbName: TGroupBox;
    edTerminalName: TEdit;
    btnSaveAllConfig: TBitBtn;
    btnLoadConfAll: TBitBtn;
    cbTypeTerminalName: TComboBox;
    Label8: TLabel;
    gbHW: TGroupBox;
    gbCAN: TGroupBox;
    gbWIFI: TGroupBox;
    gbServ: TGroupBox;
    btnFirmware: TBitBtn;
    Close1: TMenuItem;
    lbTerminalID: TLabel;
    plInfo: TPanel;
    actTerminalDisconnect: TAction;
    actTerminalConnect: TAction;
    Panel2: TPanel;
    btnExportHW: TBitBtn;
    lbHW: TLabel;
    lbCan: TLabel;
    Panel1: TPanel;
    btnExportCAN: TBitBtn;
    Panel3: TPanel;
    btnExporWIFI: TBitBtn;
    lbWIFI: TLabel;
    lbServ: TLabel;
    Panel4: TPanel;
    btnExportSERV: TBitBtn;
    mmInfo: TMemo;
    lbConfig: TLabel;
    lbconfigAll: TLabel;
    btnOptionHW: TBitBtn;
    btnOptionCAN: TBitBtn;
    btnOptionWIFI: TBitBtn;
    btnOptionServ: TBitBtn;
    comport : TCommPortDriver;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image1: TImage;
    procedure comPortReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure FormCreate(Sender: TObject);
    procedure actConnectExecute(Sender: TObject);
    procedure actDisconnectExecute(Sender: TObject);
    procedure switchConnectionExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure trmAvailableComportsTimer(Sender: TObject);
    procedure TerminalInfoTimer(Sender: TObject);
    procedure showfrTerminalExecute(Sender: TObject);
    procedure tmrTerminalConnectionTimer(Sender: TObject);
    procedure cbTypeTerminalNameChange(Sender: TObject);
    procedure edNameModelChange(Sender: TObject);
    procedure actTerminalConnectExecute(Sender: TObject);
    procedure actTerminalDisconnectExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOptionCANClick(Sender: TObject);
    procedure btnOptionWIFIClick(Sender: TObject);
    procedure btnOptionServClick(Sender: TObject);
    procedure btnOptionHWClick(Sender: TObject);
    procedure btnLoadConfAllClick(Sender: TObject);
    procedure btnSaveAllConfigClick(Sender: TObject);
    procedure btnExportHWClick(Sender: TObject);
    procedure btnExportCANClick(Sender: TObject);
    procedure btnExporWIFIClick(Sender: TObject);
    procedure btnExportSERVClick(Sender: TObject);
    procedure btnLoadFromTerminalClick(Sender: TObject);
    procedure btnFirmwareClick(Sender: TObject);
    procedure edNameModelKeyPress(Sender: TObject; var Key: Char);
    procedure edNameSNKeyPress(Sender: TObject; var Key: Char);
    procedure edNameClientKeyPress(Sender: TObject; var Key: Char);
    procedure edNameParkNumberKeyPress(Sender: TObject; var Key: Char);
    procedure edTerminalNameKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    procedure printInfoTerminal;
    procedure buttonOptionColorRed;
    procedure OnTerminalDataReceived(const Data: TArray<Byte>);
    procedure OnConnect(connect:boolean);
  public
    { Public declarations }
    Terminal: Tterminal;                    // Данные Терминала
    TerminalBuf: Tterminal;                 // Буфер данных Терминала
    procedure SaveSettings;                 // Сохранение INI
    procedure LoadSettings;                 // Загрузка INI
    procedure switchButtons;                // Переключение кнопок connect/disconnect
    procedure getInfoTerminal;              // Получение информации о Терминале
    procedure getAvalibleComPorts;          // Получение доступных COM портов
    procedure print(buf:Tarray<byte>);      // Вывод байтов
    procedure sendMessage(message: String); // Отправка уведомлений

    function getCustomName:Tbytes;
  end;

Const
  CMD_HEAD_REQUST    = $55;  // Заголовок запроса
  CMD_HEAD_RESPONSE  = $AA;  // Заголовок ответа
  CMD_TEST_CONNECT   = $01;  // Тест соединения
  CMD_CONFIG_READ    = $EC;  // Прочитать конфигурацию
  CMD_CONFIG_WRITE   = $ED;  // Записать конфигурацию
  CMD_TERMINAL_INFO  = $0F;  // Информация о терминале

  SERIAL_LENGH = 7;
  CLIENT_LENGH = 7;
  MODEL_LENGH  = 9;
  PARK_LENGH   = 2;

var
  fr_main: Tfr_main;
  autoConnect : Boolean;       // Автоподключение (INI)
  Terminal_Info : TStringList; // Буфер для хранения информации о терминале
  TerminalHead : TTerminalThread;
  TerminalConnect : boolean;
  confugBuf : TterminalConfig;

implementation

{$R *.dfm}

uses Unit1;

{$I-}

function ContainsLatinLetters(const AText: string): Boolean;
var
  i: Integer;
begin
  Result := False;

  for i := 1 to Length(AText) do
  begin
    if not IsCharAlphaNumeric(AText[i]) then
      Exit;
  end;

  Result := True;
end;

// Кнопки опций в красный цвет
procedure Tfr_main.buttonOptionColorRed;
begin
  btnOptionHW.Font.Color := clred;
  btnOptionCAN.Font.Color := clred;
  btnOptionWIFI.Font.Color := clred;
  btnOptionServ.Font.Color := clred;
end;

//Вывод информации о терминале
procedure Tfr_main.printInfoTerminal;
var
  i : integer;
  len, lenBuf : String;
begin
  //Заполняем информацию в буфер
  Terminal_Info.Clear;
  Terminal_Info.Add('Prod Date:=' + Terminal.getProdDate);
  Terminal_Info.Add('MAC_ST:='    + Terminal.getMacST);
  Terminal_Info.Add('SIM_ID:='    + Terminal.getSimID);
  Terminal_Info.Add('MAC_AP:='    + Terminal.getMacAp);
  Terminal_Info.Add('SW:='        + Terminal.getSW);
  Terminal_Info.Add('Code:='      + Terminal.decodeCoding);

  //Собираем выведенную Информацию
  len:='';
  for i:= 0 to mmInfo.Lines.Count-1 do
    len := len + mmInfo.Lines[i];

  //Собираем Информации в буфере
  lenbuf:='';
  for i:= 0 to  Terminal_Info.Count-1 do
    lenbuf := lenbuf + Terminal_Info[i];

  //Если буфер отличается от информации выведенной - синхронизируем
  if len <> lenBuf then
  begin
    mmInfo.Lines := Terminal_Info;
    lbTerminalID.Caption := 'ID:'+Terminal.getTerminalID;
  end;
end;

//Распечатать массив
procedure Tfr_main.Print(buf: TArray<byte>);
var
  i: Integer;
  hexString: string;
begin
  hexString := '';
  for i := 0 to Length(buf) - 1 do
    hexString := hexString + IntToHex(buf[i], 2) + ' ';
  fr_terminal.mmTerminal.Lines.Append(hexString);
end;

//Отправка уведомления
procedure Tfr_main.sendMessage(message: String);
var
  Notification: TNotification;
begin
  // Создаем и отправляем уведомление
  Notification := Notification1.CreateNotification;
  try
    Notification.Name := 'Terminator';
    Notification.AlertBody := message;
    Notification1.PresentNotification(Notification);
  finally
    Notification.Free;
  end;
end;

procedure Tfr_main.showfrTerminalExecute(Sender: TObject);
begin
  fr_Terminal.Show;
end;

//Подключение/Отключение
procedure Tfr_main.switchButtons;
begin
 if comPort.Connected then btnConnection.Caption := 'Disconnect'
                      else btnConnection.Caption := 'Connect';
end;

procedure Tfr_main.actCloseExecute(Sender: TObject);
begin
  close;
end;

//Подключение к UART
procedure Tfr_main.actConnectExecute(Sender: TObject);
begin
  if cbComPorts.Text = '' then sendMessage('Укажите порт');
  comPort.PortName := cbComPorts.Text;
  comPort.Connect;
  switchButtons;
  if comPort.Connected then
    spConnectins.Brush.Color := clGreen;
  fr_terminal.btnPing.Enabled:=true;
  fr_terminal.btnRead.Enabled:=true;
  fr_terminal.btnWrite.Enabled:=true;
  fr_terminal.btnInfo.Enabled:=true;
  fr_terminal.btnGetName.Enabled:=true;
  btnLoadFromTerminal.Enabled := true;
end;

// Событие подключения терминала
procedure Tfr_main.actTerminalConnectExecute(Sender: TObject);
begin
  spTerminal.Brush.Color := clGreen;
  //Имя терминала при подключении
  if cbTypeTerminalName.ItemIndex = 0 then
    edTerminalName.Text := Terminal.getNameTerminal;
end;

//Отключение UART
procedure Tfr_main.actDisconnectExecute(Sender: TObject);
begin
  comPort.Disconnect;
  actTerminalDisconnect.Execute;
  switchButtons;
  spConnectins.Brush.Color := clRed;
  spTerminal.Brush.Color := clRed;
  fr_terminal.btnPing.Enabled:=false;
  fr_terminal.btnRead.Enabled:=false;
  fr_terminal.btnWrite.Enabled:=false;
  fr_terminal.btnInfo.Enabled:=false;
  fr_terminal.btnGetName.Enabled:=false;
  btnLoadFromTerminal.Enabled := false;
end;

//Отключение Терминала
procedure Tfr_main.actTerminalDisconnectExecute(Sender: TObject);
begin
  Terminal.clearInfo;
  Terminal.clearConfigInfo;
  spTerminal.Brush.Color := clRed;
  lbTerminalID.Caption := '-';
  Terminal_Info.Clear;
  Terminal_Info.Add('Prod Date:= 00.00.00');
  Terminal_Info.Add('MAC_ST:= -:-:-:-:-:-');
  Terminal_Info.Add('SIM_ID:= -:-:-:-:-:-');
  Terminal_Info.Add('MAC_AP:= -:-:-:-:-:-');
  Terminal_Info.Add('SW:= v0.00(00.00.00)');
  Terminal_Info.Add('Code:= -');
  mmInfo.Lines := Terminal_Info;
end;

// Чтение всей конфигурации
procedure Tfr_main.btnLoadFromTerminalClick(Sender: TObject);
var
  i : integer;
begin
    try
      Terminal.getTerminalConfig;
    finally
          buttonOptionColorRed;
          btnOptionHW.Caption := 'Terminal';
          btnOptionCAN.Caption := 'Terminal';
          btnOptionWIFI.Caption := 'Terminal';
          btnOptionServ.Caption := 'Terminal';
    end;
end;

procedure Tfr_main.btnSaveAllConfigClick(Sender: TObject);
var
  FileStream: TFileStream;
begin
  SaveDialog.Filter := 'all config|*.cfgt';
  SaveDialog.DefaultExt := '.cfgt';

  if SaveDialog.Execute then
  begin
    FileStream := TFileStream.Create(SaveDialog.FileName, fmCreate);
    try
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.TerminalName, Length(TerminalBuf.TermianlConfig.TerminalName));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.ServerSyncTS, Length(TerminalBuf.TermianlConfig.ServerSyncTS));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.HWSetting1, Length(TerminalBuf.TermianlConfig.HWSetting1));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.CANDriverName, Length(TerminalBuf.TermianlConfig.CANDriverName));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.CANDriverTS, Length(TerminalBuf.TermianlConfig.CANDriverTS));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.CANDriverData, Length(TerminalBuf.TermianlConfig.CANDriverData));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.HWSetting2, Length(TerminalBuf.TermianlConfig.HWSetting2));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.WIFICfg, Length(TerminalBuf.TermianlConfig.WIFICfg));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.ServerAddress, Length(TerminalBuf.TermianlConfig.ServerAddress));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.ServerPort, Length(TerminalBuf.TermianlConfig.ServerPort));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.HWSetting3, Length(TerminalBuf.TermianlConfig.HWSetting3));
    finally
      FileStream.Free;
    end;
  end;
end;


function Tfr_main.getCustomName:Tbytes;
var
  hexName : Tbytes;
  model : array[0..MODEL_LENGH]  of byte;
  seria : array[0..SERIAL_LENGH] of byte;
  client: array[0..CLIENT_LENGH] of byte;
  park  : array[0..PARK_LENGH]   of byte;
  serialBuf : String;
  textBuf : String;
  i : integer;
begin
   SetLength(hexName, 32);
   FillChar(hexName[0] ,32, $20);

   for i := 0 to MODEL_LENGH  do
      if i < length(edNameModel.Text) then  model[i] := Ord(edNameModel.Text[i+1])
                                      else  model[i] := $20;

   serialBuf := Copy(edNameSN.Text, Length(edNameSN.Text) - 7, 8);
   for i := 0 to SERIAL_LENGH  do
      if i < length(edNameSN.Text) then  seria[i] := Ord(serialBuf[i+1])
                                   else  seria[i] := $20;

   for i := 0 to CLIENT_LENGH  do
      if i < length(edNameClient.Text) then  client[i] := Ord(edNameClient.text[i+1])
                                       else  client[i] := $20;

   for i := 0 to PARK_LENGH  do
      if i < length(edNameParkNumber.Text) then  park[i] := Ord(edNameParkNumber.text[i+1])
                                           else  park[i] := $20;

    hexName[12] := $20;
    hexName[21] := $20;
    hexName[30] := $20;

    move(model,hexName[0],MODEL_LENGH+1);
    move(seria,hexName[11],SERIAL_LENGH+1);
    move(client,hexName[20],CLIENT_LENGH+1);
    move(park,hexName[29],PARK_LENGH+1);
    result := hexName;
end;


procedure Tfr_main.btnFirmwareClick(Sender: TObject);
var
  name : TBytes;
  _config : Tbytes;
  i:integer;
begin

  if not comport.Connect then
  begin
    sendMessage('Нет подключения');
    exit;
  end;

  if Trim(edTerminalName.Text) = '' then
  begin
    sendMessage('Имя терминала не может быть пустым');
    exit;
  end;

  if ContainsLatinLetters(edTerminalName.Text) then
  begin
    sendMessage('Имя терминала содержит недопустимый символ');
    exit;
  end;

  SetLength(name,32);
  SetLength(_config, 380);
  case cbTypeTerminalName.ItemIndex of
  0:move(TerminalBuf.TerminalInfo.name,name[0],32);
  1: //Custom
    begin
      for i := 1 to edTerminalName.MaxLength do
        if i < Length(edTerminalName.Text)+1 then TerminalBuf.TermianlConfig.TerminalName[i-1] := Ord(edTerminalName.Text[i])
                                             else TerminalBuf.TermianlConfig.TerminalName[i-1] := $20;
    end;
  2://Generate
    begin
       if(Trim(edNameSN.Text )     = '') OR
         (Trim(edNameModel.Text)   = '') OR
         (Trim(edNameClient.Text)  = '') OR
         (Trim(edNameParkNumber.Text ) = '')
      then
      begin
        sendMessage('Заполните все поля');
        exit;
      end;

      name := getCustomName;
      for I := 0 to Length(name)-1 do
        TerminalBuf.TermianlConfig.TerminalName[i] := name[i];
    end;
  end;

  move(TerminalBuf.TermianlConfig,Terminal.TermianlConfig,sizeOf(Terminal.TermianlConfig));
  Terminal.firmware();
end;

procedure Tfr_main.btnLoadConfAllClick(Sender: TObject);
var
  i : integer;
  buf : Tarray<byte>;
  FileStream: TFileStream;
begin
  OpenDialog.Filter := 'all config|*.cfgt';
  if OpenDialog.Execute then
  begin
    SetLength(buf, 383);

    FileStream := TFileStream.Create(OpenDialog.FileName, fmOpenRead);
    try

      buf[0] := $aa;
      buf[1] := CMD_CONFIG_READ; // Добавляем байт, указывающий что это конфиг
      buf[382] := $FF;

      FileStream.ReadBuffer(buf[2], 380);
      TerminalBuf.checkAnswer(buf);
      buttonOptionColorRed;
      btnOptionHW.Caption := 'Default';
      btnOptionCAN.Caption := 'Default';
      btnOptionWIFI.Caption := 'Default';
      btnOptionServ.Caption := 'Default';

      //HW
      lbconfigAll.Caption := 'Конфигурация загружена из файла '+ ExtractFileName(OpenDialog.FileName);
      lbHw.Caption :=  'CAN: ' + TerminalBuf.getHWcanStatus;

      //CAN
      lbCan.Caption :=  'Speed: ' + TerminalBuf.getCANSpeed + ' кБит/с';

       //WIFI
       lbWIFI.Caption :='Access point' + #13 +
                        'SSID:' + TerminalBuf.getWifiNameAccessPoint +#13+#13+
                        'Client' + #13 +
                        'SSID:' + TerminalBuf.getWifiNameClientPoint;

       //SERV
       lbServ.Caption :='Address:'+TerminalBuf.getServerAdress + #13+
                        'Port:'+IntToStr(TerminalBuf.getServerPort)+#13;

       edTerminalName.Text := TerminalBuf.getNameTerminalConfig;
    finally
      FileStream.Free;
      lbconfigAll.Color := clred;
    end;
  end;
end;

//Сохранение из общего файла отдельно HW
procedure Tfr_main.btnExportHWClick(Sender: TObject);
var
  FileStream: TFileStream;
begin
  SaveDialog.Filter := 'HW setting|*.hwcfg';
  SaveDialog.DefaultExt := '.hwcfg';
  if SaveDialog.Execute then
  begin
    FileStream := TFileStream.Create(SaveDialog.FileName, fmCreate);
    try
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.HWSetting1, Length(TerminalBuf.TermianlConfig.HWSetting1));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.HWSetting2, Length(TerminalBuf.TermianlConfig.HWSetting2));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.HWSetting3, Length(TerminalBuf.TermianlConfig.HWSetting3));
    finally
      FileStream.Free;
    end;
  end;
end;

//Сохранение в отдельный файл из общей конфигурации
procedure Tfr_main.btnExportCANClick(Sender: TObject);
var
  FileStream: TFileStream;
begin
  SaveDialog.Filter := 'CAN DATA |*.cdf';
  SaveDialog.DefaultExt := '.cdf';
  if SaveDialog.Execute then
  begin
    FileStream := TFileStream.Create(SaveDialog.FileName, fmCreate);
    try
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.CANDriverData, Length(TerminalBuf.TermianlConfig.CANDriverData));
    finally
      FileStream.Free;
    end;
  end;
end;

// Сохранение из общего файла в WI-FI
procedure Tfr_main.btnExporWIFIClick(Sender: TObject);
var
  FileStream: TFileStream;
begin
  SaveDialog.Filter := 'wi-fi setting|*.tcwf';
  SaveDialog.DefaultExt := '.tcwf';
  if SaveDialog.Execute then
  begin
    FileStream := TFileStream.Create(SaveDialog.FileName, fmCreate);
    try
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.WIFICfg, Length(TerminalBuf.TermianlConfig.WIFICfg));
    finally
      FileStream.Free;
    end;
  end;
end;

// Сохранение из общего файла в Serv
procedure Tfr_main.btnExportSERVClick(Sender: TObject);
var
  FileStream: TFileStream;
begin
  SaveDialog.Filter := 'Server |*.tcsr';
  SaveDialog.DefaultExt := '.tcsr';
  if SaveDialog.Execute then
  begin
    FileStream := TFileStream.Create(SaveDialog.FileName, fmCreate);
    try
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.ServerAddress, Length(TerminalBuf.TermianlConfig.ServerAddress));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.ServerPort, Length(TerminalBuf.TermianlConfig.ServerPort));
    finally
      FileStream.Free;
    end;
  end;
end;

//Чтение файла конфигурации CAN (DATA)
procedure Tfr_main.btnOptionCANClick(Sender: TObject);
var
  FileStream: TFileStream;
  i : integer;
begin
  OpenDialog.Filter := 'CAN DATA |*.cdf';
  if OpenDialog.Execute then
  begin
    FileStream := TFileStream.Create(OpenDialog.FileName, fmOpenRead);
    try
      FileStream.ReadBuffer(TerminalBuf.TermianlConfig.CANDriverData[0], 100); // Читаем байты из файла 100 байт в буфер
      lbCan.Caption := 'Speed: ' + TerminalBuf.getCANSpeed + ' кБит/с';
    finally
      FileStream.Free;
      btnOptionCAN.Font.Color := clBlack;
      btnOptionCAN.Caption := ExtractFileName(OpenDialog.FileName);
    end;
  end;
end;

// Чтение файла конфигурации HW
procedure Tfr_main.btnOptionHWClick(Sender: TObject);
var
  FileStream: TFileStream;
  i : integer;
begin
  OpenDialog.Filter := 'HW setting|*.hwcfg';
  if OpenDialog.Execute then
  begin
    FileStream := TFileStream.Create(OpenDialog.FileName, fmOpenRead);
    try
      FileStream.ReadBuffer(TerminalBuf.TermianlConfig.HWSetting1[0], 4);
      FileStream.ReadBuffer(TerminalBuf.TermianlConfig.HWSetting2[0], 45);
      FileStream.ReadBuffer(TerminalBuf.TermianlConfig.HWSetting3[0], 20);
      lbHw.Caption := 'CAN: ' + TerminalBuf.getHWcanStatus;
    finally
      FileStream.Free;
      btnOptionHW.Font.Color := clBlack;
      btnOptionHW.Caption := ExtractFileName(OpenDialog.FileName);
    end;
  end;
end;

// Чтение файла конфигурации Сервера
procedure Tfr_main.btnOptionServClick(Sender: TObject);
var
  FileStream: TFileStream;
  i : integer;
begin
  OpenDialog.Filter:='Server|*.tcsr';
  if OpenDialog.Execute then
  begin
    FileStream := TFileStream.Create(OpenDialog.FileName, fmOpenRead);
    try
      FileStream.ReadBuffer(TerminalBuf.TermianlConfig.ServerAddress[0], 38);
      FileStream.ReadBuffer(TerminalBuf.TermianlConfig.ServerPort[0], 2);

      lbServ.Caption := 'Address:'+TerminalBuf.getServerAdress + #13+
                        'Port:'+IntToStr(TerminalBuf.getServerPort)+#13;
    finally
      FileStream.Free;
      btnOptionServ.Font.Color := clBlack;
      btnOptionServ.Caption := ExtractFileName(OpenDialog.FileName);
    end;
  end;
end;

//Чтение файла конфигурации wi-fi
procedure Tfr_main.btnOptionWIFIClick(Sender: TObject);
var
  FileStream: TFileStream;
  i : integer;
begin
  OpenDialog.Filter := 'wi-fi setting|*.tcwf';
  if OpenDialog.Execute then
  begin
    FileStream := TFileStream.Create(OpenDialog.FileName, fmOpenRead);
    try
      FileStream.ReadBuffer(TerminalBuf.TermianlConfig.WIFICfg[0], 115); // Читаем байты из файла 100 байт в буфер
      lbWIFI.Caption := 'Access point' + #13 +
                        'SSID:' + TerminalBuf.getWifiNameAccessPoint +#13+#13+
                        'Client' + #13 +
                        'SSID:' + TerminalBuf.getWifiNameClientPoint;
    finally
      FileStream.Free;
      btnOptionWIFI.Font.Color := clBlack;
      btnOptionWIFI.Caption := ExtractFileName(OpenDialog.FileName);
    end;
  end;
end;

//Переключение (подключено/отключено)
procedure Tfr_main.switchConnectionExecute(Sender: TObject);
begin
  if comPort.Connected then actDisconnect.Execute
                       else actConnect.Execute;
end;

//Запрашиваем информацию о терминале
procedure Tfr_main.TerminalInfoTimer(Sender: TObject);
begin
//  try
//    if comPort.Connected then Terminal.info;
//  except
//    sendMessage('Error');
//    comPort.Disconnect;
//    actTerminalDisconnect.Execute;
//  end;
end;

// Проверка подключен ли терминал
procedure Tfr_main.tmrTerminalConnectionTimer(Sender: TObject);
begin
//  if Terminal.isConnections then  actTerminalConnect.Execute
//                            else  actTerminalDisconnect.Execute;
end;

//Обновляем список доступных компортов
procedure Tfr_main.trmAvailableComportsTimer(Sender: TObject);
begin
  getAvalibleComPorts;
end;

procedure Tfr_main.cbTypeTerminalNameChange(Sender: TObject);
begin

  case cbTypeTerminalName.ItemIndex of
  0: edTerminalName.ReadOnly := True;
  1: edTerminalName.ReadOnly := false;
  2:begin
      edTerminalName.ReadOnly := True;
      edTerminalName.Text := edNameModel.Text  +' '+
                             edNameSN.Text     +' '+
                             edNameClient.Text +' '+
                             edNameParkNumber.Text;
    end;
  end;

end;

//Приём сообщений из UART
procedure Tfr_main.comPortReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
//var
//  s: AnsiString;
//  hexString: string;
//  i: integer;
//  buf: TArray<byte>;
begin
//  try
//    SetLength(buf, DataSize);
//    Move(DataPtr^, buf[0], DataSize);
//    Terminal.checkAnswer(buf);
//    //Если режим загрузчика, выходим из него
//    if buf[0] = $F0 then terminal.stopBootloader;
//    //Если информация о терминале
//    if buf[0] = CMD_TERMINAL_INFO  then printInfoTerminal;
//
//    //Вывод в терминал
////    Print(buf);
//  except
//  on E: Exception do
//    begin
//      // Обработка исключения
//     sendMessage('Ошибка: ' + E.Message);
//    end;
//  end;
end;


procedure Tfr_main.edNameClientKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['a'..'z', 'A'..'Z','0'..'9', #8]) then // Разрешаем только английские буквы и Backspace
    Key := #0; // Обнуляем символ, чтобы он не добавлялся к тексту
end;

procedure Tfr_main.edNameModelChange(Sender: TObject);
var
  serialBuf : String;
  textBuf : String;
begin

  textBuf := edNameSN.Text;
  if Length(textBuf) > 8 then serialBuf := Copy(textBuf, Length(textBuf) - 7, 8)
                         else serialBuf := textBuf;

  if cbTypeTerminalName.ItemIndex = 2 then
  edTerminalName.Text := edNameModel.Text  +' '+
                         SerialBuf         +' '+
                         edNameClient.Text +' '+
                         edNameParkNumber.Text;
end;

procedure Tfr_main.edNameModelKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['a'..'z', 'A'..'Z','0'..'9', #8]) then // Разрешаем только английские буквы и Backspace
    Key := #0; // Обнуляем символ, чтобы он не добавлялся к тексту
end;

procedure Tfr_main.edNameParkNumberKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['a'..'z', 'A'..'Z','0'..'9', #8]) then // Разрешаем только английские буквы и Backspace
    Key := #0; // Обнуляем символ, чтобы он не добавлялся к тексту
end;

procedure Tfr_main.edNameSNKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['a'..'z', 'A'..'Z','0'..'9', #8]) then // Разрешаем только английские буквы и Backspace
    Key := #0; // Обнуляем символ, чтобы он не добавлялся к тексту
end;

procedure Tfr_main.edTerminalNameKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['a'..'z', 'A'..'Z','0'..'9', #8]) then // Разрешаем только английские буквы и Backspace
    Key := #0; // Обнуляем символ, чтобы он не добавлялся к тексту
end;

procedure Tfr_main.FormCreate(Sender: TObject);
begin
  LoadSettings;                          // Загрузка ini
  TerminalBuf := Tterminal.Create();     // Буферный файл
  Terminal := Tterminal.Create(comport); // Терминал (Передача компонента)

  Terminal_Info := TstringList.Create;   // Буфер для информации о терминале
  getAvalibleComPorts;                   // Доступные COM порты
  cbTypeTerminalName.ItemIndex := 0;

  TerminalHead := TTerminalThread.Create(comport, OnTerminalDataReceived);
  TerminalHead.TerminateEvent := TEvent.Create(nil, True, False, '');
  TerminalHead.Start;
end;

procedure Tfr_main.OnConnect(connect:boolean);
begin

end;

// Received
procedure Tfr_main.OnTerminalDataReceived(const Data: TArray<Byte>);
var
  i: Integer;
  HexString: string;
begin
  HexString := '';
  for i := 0 to High(Data) do
    HexString := HexString + IntToHex(Data[i], 2) + ' ';


  Terminal.checkAnswer(data);
   //Если информация о терминале
  if Data[1] = CMD_TERMINAL_INFO  then printInfoTerminal;
  if data[1] = $ED then sendMessage('Write Configuration: Successful');
  if Data[1] = CMD_CONFIG_READ then
  begin
      move(Terminal.TermianlConfig,TerminalBuf.TermianlConfig,sizeOf(TerminalBuf.TermianlConfig));
      //HW
      lbconfigAll.Caption := 'Конфигурация загружена из Терминала!';
      lbHw.Caption := 'CAN: ' + Terminal.getHWcanStatus;
      //CAN
      lbCan.Caption := 'File name: TERMINAL' + #13+
      'Speed: ' + Terminal.getCANSpeed + ' кБит/с';
       //WIFI
      lbWIFI.Caption := 'Access point' + #13 +
                        'SSID:' + Terminal.getWifiNameAccessPoint +#13+#13+
                        'Client' + #13 +
                        'SSID:' + Terminal.getWifiNameClientPoint;
       //SERV
       lbServ.Caption :='Address:'+Terminal.getServerAdress + #13+
                        'Port:'+IntToStr(Terminal.getServerPort)+#13;

       if cbTypeTerminalName.ItemIndex = 0 then edTerminalName.Text := Terminal.getNameTerminal;
  end;

  if (data[0]=$FF)AND(data[1]=$FF)AND(data[2]=$F0)AND(data[3]=$FE)
    then actTerminalDisconnect.Execute; //терминал отключен

  if (data[0]=$F0)AND(data[1]=$FE)AND(data[2]=$FF)AND(data[3]=$FF)
    then actTerminalConnect.Execute;  //терминал Подключен

  TThread.Queue(nil,
    procedure
    begin

      fr_Terminal.mmTerminal.Lines.Add('Received data: ' + HexString);
    end
  );
end;

//Удаление объектов
procedure Tfr_main.FormDestroy(Sender: TObject);
begin
  Terminal.Free;
  TerminalBuf.Free;
  Terminal_Info.Free;
end;

//------users function ----------------------

// Получаем список доступных com ports
procedure Tfr_main.getAvalibleComPorts;
var comPortlist: TStringList;
begin
  comPortList := TstringList.Create;
  comPort.EnumComPorts(comPortList);  // Получаем список компортов
  //Если полученный список отличается от того что был
  if cbComPorts.Items.Count <> comPortlist.Count  then
  begin
   cbComPorts.Items := comPortlist;
   //Если нет доступных ком портов
   if comPortlist.Count = 0 then
    begin
      actDisconnect.Execute;
      actTerminalDisconnect.Execute;
      sendMessage('Система не обнаружила доступных COM портов');
    end;
    //Если доступен только один ком порт, выбираем его и пытаемся подключиться
   if (comPortList.Count = 1)  then
   begin
      try
        cbComPorts.ItemIndex := 0; // выбираем первый ком порт,и пытаемся подключиться
//        comport.Connect;
//        actConnect.Execute;
      except

      end;
   end;

  end;
 comPortlist.Free;
end;

//Получение информации о терминале
procedure Tfr_main.getInfoTerminal;
begin

end;

//Загрузка настроек в файл INI
procedure Tfr_main.LoadSettings;
var
  IniFile: TIniFile;
  iniPath : string;
begin
  iniPath := ExtractFilePath(Application.ExeName) + 'settings.ini';
  IniFile := TIniFile.Create(iniPath);
  try
    autoConnect := IniFile.ReadBool('General', 'autoConnect', true);
  finally
    IniFile.Free;
  end;
end;

// Сохранение настроек в файл INI
procedure Tfr_main.SaveSettings;
var
  IniFile: TIniFile;
  iniPath : string;
begin
  iniPath := ExtractFilePath(Application.ExeName) + 'settings.ini';
  IniFile := TIniFile.Create(iniPath);
  try
    IniFile.WriteBool('General', 'autoConnect', True);
  finally
    IniFile.Free;
  end;
end;


end.