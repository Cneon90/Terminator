﻿unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CPDrv, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, System.Notification, terminal, IniFiles, Vcl.Menus,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, SyncObjs, TerminalThread,
  Vcl.Imaging.pngimage, Vcl.Grids, database_setting, Data.DBXMySQL, Data.DB,
  Data.SqlExpr, Data.Win.ADODB, Clipbrd, System.NetEncoding ,decode, Vcl.Mask,
  Vcl.DBCtrls, database_load_config, Vcl.VirtualImage, Vcl.VirtualImageList,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.CustomizeDlg, System.Win.TaskbarCore, Vcl.Taskbar,
  database_select_config, IdURI, Vcl.DBGrids, fr_HWEdit, HWEdit, fr_SERVEREdit
  ,lib_main, association, fr_WIFIEDIT, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet
  ;



type

   TTableType = record
    id:integer;
    Name:String;
    size:integer;
  end;

  TdbReadRec = record
    id : integer;
    Name: String;
    data: Tbytes;
  end;

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
    Label3: TLabel;
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
    plButtons: TPanel;
    btnLoadFromTerminal: TBitBtn;
    btnSaveAllConfig: TBitBtn;
    btnLoadConfAll: TBitBtn;
    gbCAN: TGroupBox;
    gbWIFI: TGroupBox;
    gbServ: TGroupBox;
    btnFirmware: TBitBtn;
    Close1: TMenuItem;
    lbTerminalID: TLabel;
    actTerminalDisconnect: TAction;
    actTerminalConnect: TAction;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    lbconfigAll: TLabel;
    btnOptionCAN: TBitBtn;
    btnOptionWIFI: TBitBtn;
    btnOptionServ: TBitBtn;
    comport : TCommPortDriver;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    gbName: TGroupBox;
    Label8: TLabel;
    edTerminalName: TEdit;
    cbTypeTerminalName: TComboBox;
    chbResetTerminal: TCheckBox;
    Label16: TLabel;
    edOptionCanName: TEdit;
    edOptionCanSpeed: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    edOptionWIFIClSSID: TEdit;
    Label20: TLabel;
    edOptionWIFICLIP: TEdit;
    Label19: TLabel;
    edOptionServerAddress: TEdit;
    Label21: TLabel;
    edOptionServerPort: TEdit;
    Base: TMenuItem;
    Database1: TMenuItem;
    btnbufferTerminalId: TButton;
    Label25: TLabel;
    dbConnection: TADOConnection;
    gbHW: TGroupBox;
    Label15: TLabel;
    Panel2: TPanel;
    btnOptionHW: TBitBtn;
    edOptionHWCan: TEdit;
    btnDbLoadConfAll: TBitBtn;
    mmConnect: TMenuItem;
    mmDisconnect: TMenuItem;
    DbConnect: TAction;
    startConnect: TMenuItem;
    imgList16: TImageList;
    btnExportFromDb: TBitBtn;
    ImgCollection: TImageCollection;
    imgList: TVirtualImageList;
    imgConnectCom: TVirtualImage;
    imgConnectTerminal: TVirtualImage;
    imgConnectDB: TVirtualImage;
    imgList30: TVirtualImageList;
    Panel5: TPanel;
    btnExportHW: TBitBtn;
    btnExportDbHW: TBitBtn;
    Panel6: TPanel;
    btnExportCAN: TBitBtn;
    Panel7: TPanel;
    btnExporWIFI: TBitBtn;
    Panel8: TPanel;
    btnExportSERV: TBitBtn;
    btnExportDbCAN: TBitBtn;
    btnExportDbWIFI: TBitBtn;
    btnExportDbServer: TBitBtn;
    pm: TPopupMenu;
    miFromDateBase: TMenuItem;
    miFromFile: TMenuItem;
    actHwFromFile: TAction;
    actCanFromFile: TAction;
    actWifiFromFile: TAction;
    actServerFromFile: TAction;
    actHwFromDb: TAction;
    actCanFromDb: TAction;
    actWifiFromDb: TAction;
    actServerFromDb: TAction;
    imgMainMenu: TImageList;
    ImgCollectionOperators: TImageCollection;
    ADOQuery: TADOQuery;
    ADOQueryid: TIntegerField;
    ADOQueryname: TStringField;
    Connect1: TMenuItem;
    vImgCopy: TVirtualImageList;
    imgCollects: TImageCollection;
    vMainMenuImg: TVirtualImageList;
    ImageCollection: TImageCollection;
    Label24: TLabel;
    edOptionWIFIAPSSID: TEdit;
    edOptionWIFIMode: TEdit;
    Label26: TLabel;
    viHW: TVirtualImage;
    viCan: TVirtualImage;
    ViWifi: TVirtualImage;
    ViServer: TVirtualImage;
    plInfo: TPanel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label22: TLabel;
    Label10: TLabel;
    VirtualImage5: TVirtualImage;
    edInfoDataProd: TEdit;
    edInfoMacST: TEdit;
    edInfoMacAP: TEdit;
    edInfoSimID: TEdit;
    edInfoSW: TEdit;
    edInfoCode: TEdit;
    edInfoTerminalName: TEdit;
    btnBufferMacST: TButton;
    btnBufferMacAP: TButton;
    btnBufferSimId: TButton;
    btnBufferSW: TButton;
    Panel9: TPanel;
    vimgOperator: TVirtualImage;
    lbGsmOperator: TLabel;
    edOptionHWAccelerometr: TEdit;
    Label23: TLabel;
    vImgTerm: TVirtualImageList;
    ADOQuerydata: TBlobField;
    procedure FormCreate(Sender: TObject);
    procedure actConnectExecute(Sender: TObject);
    procedure actDisconnectExecute(Sender: TObject);
    procedure switchConnectionExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure trmAvailableComportsTimer(Sender: TObject);
    procedure showfrTerminalExecute(Sender: TObject);
    procedure cbTypeTerminalNameChange(Sender: TObject);
    procedure edNameModelChange(Sender: TObject);
    procedure actTerminalConnectExecute(Sender: TObject);
    procedure actTerminalDisconnectExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Database1Click(Sender: TObject);
    procedure btnbufferTerminalIdClick(Sender: TObject);
    procedure btnBufferMacSTClick(Sender: TObject);
    procedure btnBufferMacAPClick(Sender: TObject);
    procedure btnBufferSimIdClick(Sender: TObject);
    procedure btnBufferSWClick(Sender: TObject);
    procedure btnBufferCodeClick(Sender: TObject);
//    procedure btnExportDbHW1Click(Sender: TObject);
    procedure dbConnectionAfterConnect(Sender: TObject);
    procedure dbConnectionAfterDisconnect(Sender: TObject);
    procedure btnDbLoadConfAllClick(Sender: TObject);
    procedure mmDisconnectClick(Sender: TObject);
    procedure DbConnectExecute(Sender: TObject);
    procedure startConnectClick(Sender: TObject);
    procedure btnExportFromDbClick(Sender: TObject);
    procedure btnExportDbHWClick(Sender: TObject);
    procedure btnExportDbCANClick(Sender: TObject);
    procedure btnExportDbWIFIClick(Sender: TObject);
    procedure btnExportDbServerClick(Sender: TObject);
    procedure btnOptionHWMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actHwFromFileExecute(Sender: TObject);
    procedure actCanFromFileExecute(Sender: TObject);
    procedure actWifiFromFileExecute(Sender: TObject);
    procedure actServerFromFileExecute(Sender: TObject);

    procedure btnOptionCANMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnOptionWIFIMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnOptionServMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actHwFromDbExecute(Sender: TObject);
    procedure actCanFromDbExecute(Sender: TObject);
    procedure actWifiFromDbExecute(Sender: TObject);
    procedure actServerFromDbExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lbGsmOperatorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure gbHWClick(Sender: TObject);
    procedure viHWMouseLeave(Sender: TObject);
    procedure viHWMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure viCanMouseLeave(Sender: TObject);
    procedure ViWifiMouseLeave(Sender: TObject);
    procedure ViServerMouseLeave(Sender: TObject);
    procedure viCanMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ViWifiMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ViServerMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ViServerClick(Sender: TObject);
    procedure ViWifiClick(Sender: TObject);
  private
    { Private declarations }
    FlagTerminalConfig:boolean;                                                 // Флаг запроса конфигурации терминала
    procedure printInfoTerminal;
    procedure buttonOption(color:Tcolor; text:String);
    procedure OnTerminalDataReceived(const Data: TArray<Byte>);
    procedure generatorName(isEdit:boolean);
    procedure updateInfo(Terminalinfo:Tterminal);
    procedure showMenuButton(actFile: Taction; actDb:Taction);
    procedure parserBuffer(Text: String);
    function LoadConfigFromDB(TableName:String; caption:String; DataSize: integer): TdbReadRec;

  public
    { Public declarations }
    var
      dbHost      : String;                                                     // Хост базы данных
      dbPort      : integer;                                                    // Порт базы данных
      dbName      : String;                                                     // Имя базы данных
      dbLogin     : String;                                                     // Логин базы данных
      dbPassword  : String;                                                     // Пароль базы данных
      dbPathDllDB : String;                                                     // Путь к DLL
      Terminal: Tterminal;                    // Данные Терминала
      TerminalBuf: Tterminal;                 // Буфер данных Терминала
      procedure SaveSettings;                 // Сохранение INI
      procedure LoadSettings;                 // Загрузка INI
      procedure switchButtons;                // Переключение кнопок connect/disconnect
      procedure getAvalibleComPorts;          // Получение доступных COM портов
      procedure print(buf:Tarray<byte>);      // Вывод байтов
      procedure sendMessage(message: String); // Отправка уведомлений
      function connectDB(host: String;       // Подключение к базе данных
                             port:String;
                             dbName: String;
                             login: String;
                             Password : String):boolean;
      procedure dbDeleteRecord(tablename:String; id:integer); //Удаление записи
      procedure dbRestoreRecord(tablename:String; id:integer);//Восстановление записи   
     
      function dbInsertConfig(configfHex: array of Byte; name: String; tableName: String):boolean;
      function dbGetRecord(tablename:String; id:integer;size:integer):Boolean;
      function dbGetConfig(tableName: String): TStringList;
      function dbinitialTables:boolean;
      function getCustomName:Tbytes;
      function getType(TableName: String): TTableType;
  end;

  //Запись бд
  TdbRecord = record
    id : integer;
    name : String;
  end;

Const
  CMD_HEAD_REQUST    = $55;  // Заголовок запроса
  CMD_HEAD_RESPONSE  = $AA;  // Заголовок ответа
  CMD_TEST_CONNECT   = $01;  // Тест соединения
  CMD_CONFIG_READ    = $EC;  // Прочитать конфигурацию
  CMD_CONFIG_WRITE   = $ED;  // Записать конфигурацию
  CMD_TERMINAL_INFO  = $0F;  // Информация о терминале

  //Длина секций имени терминала
  SERIAL_LENGH = 7;
  CLIENT_LENGH = 7;
  MODEL_LENGH  = 9;
  PARK_LENGH   = 2;

  //Названия таблиц
  TB_HW         = 'hw';
  TB_CAN        = 'can';
  TB_WIFI       = 'wifi';
  TB_SERVER     = 'serv';
  TB_GSM        = 'gsm';
  TB_WHOLE      = 'template';
  TB_WIFI_SERV  = 'wifi+server';
  Base_DSN      =  'Terminator';

  TB_NEW_VER='terminal_configuration';

  //Размеры секций в байтах
  SIZE_HW_BYTE   = 69;
  SIZE_CAN_BYTE  = 120;
  SIZE_WIFI_BYTE = 115;
  SIZE_SERV_BYTE = 40;
  SIZE_ALLCONFIG = 380;

  //--img index--
  CONNECT_GREEN  = 7;
  CONNECT_RED    = 8;
  CONNECT_YELLOW = 9;

  //Индекс OpenDialog
  OPEN_DIALOG_HW   = 0;
  OPEN_DIALOG_CAN  = 1;
  OPEN_DIALOG_WIFI = 2;
  OPEN_DIALOG_SERV = 3;
  OPEN_DIALOG_All  = 4;

  BUTTON_COLOR_CUSTOM = clAqua; //clWebMediumSlateBlue;
  BUTTON_COLOR_BASE   = clMenuHighlight;
  BUTTON_COLOR_FILE   = clLime;

var
  fr_main: Tfr_main;
  autoConnect: Boolean;        // Автоподключение (INI)
  TerminalInfo: TStringList; // информации о терминале
  TerminalInfoBuf: TStringList;
  TerminalHead: TTerminalThread;
  TerminalConnect: boolean;
  confugBuf: TterminalConfig;
  DirBufferOpen:array[0..4] of String; //Путь для Диалоговых окон
  DirBufferSave:array[0..4] of String; //Путь для Диалоговых окон

  //Парсинг строки URL 
  prHW, prCan, prWIFI, prServ : integer;
  prClient, prModel, prSN, prPark : String; 

  waitFirmware: boolean; //Ожидания загрузки 

implementation

{$R *.dfm}

uses Unit1;
{$I-}

procedure Tfr_main.updateInfo(Terminalinfo:Tterminal);
begin
  //HW
  edOptionHWCan.Text := Terminalinfo.getHWcanStatus;
  edOptionHWAccelerometr.Text := Terminalinfo.getAccelerometr;
  //CAN
  edOptionCanName.Text := Terminalinfo.getCANDriverName;
  edOptionCanSpeed.Text := Terminalinfo.getCANSpeed;
  //WIFI
  edOptionWIFIClSSID.text := TerminalInfo.getWifiNameClientPoint;
  edOptionWIFICLIP.text   := TerminalInfo.getWifiIPClientPoint;
  edOptionWIFIAPSSID.text := TerminalInfo.getWifiNameAccessPoint;
  edOptionWIFIMode.text   := TerminalInfo.getWifiMode;
  //SERV
  edOptionServerAddress.Text := Terminalinfo.getServerAdress;
  edOptionServerPort.Text := IntToStr(Terminalinfo.getServerPort);
end;


procedure Tfr_main.viCanMouseLeave(Sender: TObject);
begin
  viCan.ImageIndex:= 4;
end;

procedure Tfr_main.viCanMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  viCan.ImageIndex:= 11;
end;

procedure Tfr_main.viHWMouseLeave(Sender: TObject);
begin
  viHW.ImageIndex := 5;
end;

procedure Tfr_main.viHWMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin

  viHW.ImageIndex := 12;
end;

procedure Tfr_main.ViServerClick(Sender: TObject);
var EditModal : TfrServerEdit;
begin
   EditModal := TfrServerEdit.Create(nil);
   EditModal.setServerSettings(TerminalBuf.TermianlConfig.config);
   EditModal.ShowModal;
   TerminalBuf.setServ(EditModal.getServerSettings);
   updateInfo(TerminalBuf);
   if EditModal.getisChange then
   begin
    btnOptionServ.Font.Color := BUTTON_COLOR_CUSTOM;
    btnOptionServ.Caption := 'Custom';
   end;
end;

procedure Tfr_main.ViServerMouseLeave(Sender: TObject);
begin
  ViServer.ImageIndex := 7;
end;

procedure Tfr_main.ViServerMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  ViServer.ImageIndex := 14;
end;

procedure Tfr_main.ViWifiClick(Sender: TObject);
var EditModal : TfrWifiEdit;
begin
   EditModal := TfrWifiEdit.Create(nil);
   EditModal.setServerSettings(TerminalBuf.TermianlConfig.config);
   EditModal.ShowModal;
   TerminalBuf.setwifi(EditModal.getWifiSettings);
   updateInfo(TerminalBuf);
  if EditModal.getisChange then
   begin
    btnOptionWIFI.Font.Color := BUTTON_COLOR_CUSTOM;
    btnOptionWIFI.Caption := 'Custom';
   end;
end;

procedure Tfr_main.ViWifiMouseLeave(Sender: TObject);
begin
  ViWifi.ImageIndex := 10;
end;

procedure Tfr_main.ViWifiMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  ViWifi.ImageIndex := 13;
end;

//Подключение к базе данных
function Tfr_main.connectDB(host: String;
                             port: String;
                             dbName: String;
                             login: String;
                             Password : String):boolean;
begin
  result := false;
  if dbConnection.Connected then dbConnection.close;
  try
    dbConnection.ConnectionString := Format(
     'Provider=MSDASQL.1;'+
     'Password=%s;'+
     'Persist Security Info=False;'+
     'User ID=%s;' +
     'Extended Properties="'+
     'DSN='+Base_DSN+';'+
     'DESCRIPTION=terminal;'+
     'SERVER=%s;'+
     'UID=%s;'+
     'PWD=%s;'+
     'DATABASE=%s;'+
     'PORT=%s"',
    [Password,login,host,login,Password,dbName,port]);
    dbConnection.Open;
    result:=true;
  except
   on E: Exception do
    begin
      imgConnectDB.ImageIndex := CONNECT_RED;
      sendMessage('Ошибка подключения к БД '+ E.Message);
      result := false;
    end;
  end;

end;

// Кнопки опций
procedure Tfr_main.buttonOption(color:Tcolor; text:String);
begin
  btnOptionHW.Font.Color := color;
  btnOptionCAN.Font.Color := color;
  btnOptionWIFI.Font.Color := color;
  btnOptionServ.Font.Color := color;
  btnOptionHW.Caption := text;
  btnOptionCAN.Caption := text;
  btnOptionWIFI.Caption := text;
  btnOptionServ.Caption := text;      
end;

//Вывод информации о терминале
procedure Tfr_main.printInfoTerminal;
var
  i : integer;
  len, lenBuf : String;
  GsmOperator : TGsmOperator;
begin

  //Заполняем информацию в буфер
  TerminalInfobuf.Clear;
  TerminalInfobuf.Add(Terminal.getProdDate);
  TerminalInfobuf.Add(Terminal.getMacST);
  TerminalInfobuf.Add(Terminal.getSimID);
  TerminalInfobuf.Add(Terminal.getMacAp);
  TerminalInfobuf.Add(Terminal.getSW);
  TerminalInfobuf.Add(Terminal.decodeCoding);

  //Буфер отличается от выводимой информации
  if Length(TerminalInfo.Text) <> Length(TerminalInfoBuf.Text) then
    begin
     TerminalInfo.Text    := TerminalInfoBuf.Text;
     edInfoDataProd.Text  := TerminalInfo[0];
     edInfoMacST.Text     := TerminalInfo[1];
     edInfoSimID.Text     := TerminalInfo[2];
     edInfoMacAP.Text     := TerminalInfo[3];
     edInfoSW.Text        := TerminalInfo[4];
     edInfoCode.Text      := Terminalinfo[5];
     edInfoTerminalName.Text := terminal.getNameTerminal;

     lbTerminalID.Caption := 'ID:'+Terminal.getTerminalID;

     GsmOperator := Terminal.getGsmOperator;
     lbGsmOperator.Font.Color := GsmOperator.color;
     lbGsmOperator.caption := GsmOperator.Name;

     vimgOperator.ImageIndex := GsmOperator.id;
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

procedure Tfr_main.startConnectClick(Sender: TObject);
begin
if startConnect.Checked then startConnect.Checked := false
                        else startConnect.Checked := true;
end;

//Подключение/Отключение
procedure Tfr_main.switchButtons;
begin
 if comPort.Connected then btnConnection.Caption := 'Отключиться'
                      else btnConnection.Caption := 'Подключиться';
end;

//Чтение из базы Can
procedure Tfr_main.actCanFromDbExecute(Sender: TObject);
var
  configHex : Tbytes;
  name: String;
  dbRead : TdbReadRec;
begin
  dbRead := LoadConfigFromDB(TB_Can,'Can', 120);
  configHex := dbRead.data;
  if Length(configHex) = 0 then exit;
  TerminalBuf.setCAN(configHex);
  updateInfo(TerminalBuf);
  btnOptionCAN.Font.Color := BUTTON_COLOR_BASE;
  btnOptionCAN.Caption := 'DB:' + dbRead.name;
end;

procedure Tfr_main.actCanFromFileExecute(Sender: TObject);
var
  FileStream: TFileStream;
  i : integer;
  buffer: TBytes;
begin
  OpenDialog.CleanupInstance;
  if DirBufferOpen[OPEN_DIALOG_CAN] <> '' then OpenDialog.InitialDir := DirBufferOpen[OPEN_DIALOG_CAN];
  OpenDialog.Filter := 'CAN DATA |*.cdf| Can driver (*.tccn)|*.tccn';

  OpenDialog.DefaultExt := '.cdf';
  if OpenDialog.Execute then
  begin
    OpenDialog.FilterIndex;
    FileStream := TFileStream.Create(OpenDialog.FileName, fmOpenRead);
    DirBufferOpen[OPEN_DIALOG_CAN] := ExtractFilePath(OpenDialog.FileName);
    try
      if OpenDialog.FilterIndex = 1 then //Если файл формата *.cdf
        begin                            //Читаем 100 байт драйвера
          TerminalBuf.setCanDriverName(ExtractFileName(OpenDialog.FileName));
          FileStream.ReadBuffer(TerminalBuf.TermianlConfig.config.CANDriverData[0], 100); // Читаем байты из файла 100 байт в буфер
        end;

      if OpenDialog.FilterIndex = 2 then //Если файл формата *.tccn
        begin                            //читаем имя файла-16 байт,метку времени-4 байта,драйвера-100 байт=120 байт
          SetLength(buffer, FileStream.Size);
          FileStream.Read(buffer[0], FileStream.Size);
          TerminalBuf.setCAN(Buffer);
        end;

      updateInfo(TerminalBuf);
    finally
      FileStream.Free;
      btnOptionCAN.Font.Color := BUTTON_COLOR_FILE;
      btnOptionCAN.Caption := ExtractFileName(OpenDialog.FileName);
    end;
  end;
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
    imgConnectCom.ImageIndex := CONNECT_GREEN;
  fr_terminal.btnPing.Enabled:=true;
  fr_terminal.btnRead.Enabled:=true;
  fr_terminal.btnWrite.Enabled:=true;
  fr_terminal.btnInfo.Enabled:=true;
  fr_terminal.btnGetName.Enabled:=true;
//  btnLoadFromTerminal.Enabled := true;
  btnbufferTerminalId.Enabled := true;
  btnBufferMacST.Enabled := true;
  btnBufferMacAP.Enabled := true;
  btnBufferSimId.Enabled := true;
  btnBufferSW.Enabled := true;
end;

// Событие подключения терминала
procedure Tfr_main.actTerminalConnectExecute(Sender: TObject);
begin
  imgConnectTerminal.ImageIndex := CONNECT_GREEN;
end;

//Отключение UART
procedure Tfr_main.actDisconnectExecute(Sender: TObject);
begin
  comPort.Disconnect;
  actTerminalDisconnect.Execute;
  switchButtons;
  imgConnectCom.ImageIndex := CONNECT_RED;
  imgConnectTerminal.ImageIndex := CONNECT_RED;
  fr_terminal.btnPing.Enabled:=false;
  fr_terminal.btnRead.Enabled:=false;
  fr_terminal.btnWrite.Enabled:=false;
  fr_terminal.btnInfo.Enabled:=false;
  fr_terminal.btnGetName.Enabled:=false;
  btnLoadFromTerminal.Enabled := false;
  btnbufferTerminalId.Enabled := false;
  btnBufferMacST.Enabled := false;
  btnBufferMacAP.Enabled := false;
  btnBufferSimId.Enabled := false;
  btnBufferSW.Enabled := false;
end;

//Чтение из базы HW
procedure Tfr_main.actHwFromDbExecute(Sender: TObject);
var
  configHex : Tbytes;
  name: String;
  dbRead : TdbReadRec;
begin
  dbRead :=  LoadConfigFromDB(TB_HW,'HW', 69);
  configHex := dbRead.data;
  if Length(configHex) = 0 then exit;

  TerminalBuf.setHW(configHex);

  updateInfo(TerminalBuf);
  btnOptionHW.Font.Color := BUTTON_COLOR_BASE;
  btnOptionHW.Caption := 'DB:'+dbRead.name;
end;

procedure Tfr_main.actHwFromFileExecute(Sender: TObject);
var
  FileStream: TFileStream;
  i : integer;
  buffer: TBytes;
begin
  OpenDialog.CleanupInstance;
  if DirBufferOpen[OPEN_DIALOG_HW] <> ' ' then OpenDialog.InitialDir := DirBufferOpen[OPEN_DIALOG_HW];
  OpenDialog.Filter := 'HW setting|*.tchw';
  if OpenDialog.Execute then
  begin
    FileStream := TFileStream.Create(OpenDialog.FileName, fmOpenRead);
    DirBufferOpen[OPEN_DIALOG_HW] := ExtractFilePath(OpenDialog.FileName);
    try
      SetLength(buffer, FileStream.Size);
      FileStream.Read(buffer[0], FileStream.Size);
      TerminalBuf.setHW(buffer);
      updateInfo(TerminalBuf);
    finally
      FileStream.Free;
      btnOptionHW.Font.Color := BUTTON_COLOR_FILE;
      btnOptionHW.Caption := ExtractFileName(OpenDialog.FileName);
    end;
  end;
end;

//Чтение из базы Server
procedure Tfr_main.actServerFromDbExecute(Sender: TObject);
var
  configHex : Tbytes;
  name: String;
  dbRead : TdbReadRec;
begin
  dbRead := LoadConfigFromDB(TB_SERVER,'Server', 40);
  configHex := dbRead.data;
  if Length(configHex) = 0 then exit;
  TerminalBuf.setServ(configHex);
  updateInfo(TerminalBuf);
  btnOptionServ.Font.Color := BUTTON_COLOR_BASE;
  btnOptionServ.Caption := 'DB:' + dbRead.name;
end;

procedure Tfr_main.actServerFromFileExecute(Sender: TObject);
var
  FileStream: TFileStream;
  i : integer;
  buffer: TBytes;
begin
  OpenDialog.CleanupInstance;
  if DirBufferOpen[OPEN_DIALOG_SERV] <> '' then OpenDialog.InitialDir := DirBufferOpen[OPEN_DIALOG_SERV];
  OpenDialog.Filter := 'Server|*.tcsr| Wifi+Server|*.tcwfsr';
  if OpenDialog.Execute then
  begin
    FileStream := TFileStream.Create(OpenDialog.FileName, fmOpenRead);
    try
      if OpenDialog.FilterIndex = 1 then
      begin
        SetLength(buffer, FileStream.Size);
        FileStream.Read(buffer[0], FileStream.Size);
        TerminalBuf.setServ(buffer);
      end;

      if OpenDialog.FilterIndex = 2 then // Если файл формата *.tccn
      begin
        SetLength(buffer, FileStream.Size);
        FileStream.Read(buffer[0], FileStream.Size);
        TerminalBuf.setWifiServ(buffer);
      end;

      UpdateInfo(TerminalBuf);
      DirBufferOpen[OPEN_DIALOG_SERV] := ExtractFilePath(OpenDialog.FileName);

    finally
      FileStream.Free;
      btnOptionServ.Font.Color := BUTTON_COLOR_FILE;
      btnOptionServ.Caption := ExtractFileName(OpenDialog.FileName);
    end;
  end;
end;

//Отключение Терминала
procedure Tfr_main.actTerminalDisconnectExecute(Sender: TObject);
begin
  Terminal.clearInfo;
  Terminal.clearConfigInfo;
  imgConnectTerminal.ImageIndex := CONNECT_RED;
  lbTerminalID.Caption := '-';
  TerminalInfo.Clear;
  TerminalInfobuf.Clear;
  TerminalInfo.Text    := TerminalInfoBuf.Text;
  edInfoDataProd.Text  := '00.00.00';
  edInfoMacST.Text     := '-:-:-:-:-:-';
  edInfoSimID.Text     := '-';
  edInfoMacAP.Text     := '-:-:-:-:-:-';
  edInfoSW.Text        := 'v0.00(00.00.00)';
  edInfoCode.Text      := '-';
  lbGsmOperator.caption:= '';
  vimgOperator.ImageIndex := -1;
  edInfoTerminalName.text := '';
end;

//Чтение из базы Wifi
procedure Tfr_main.actWifiFromDbExecute(Sender: TObject);
var
  configHex : Tbytes;
  name: String;
  dbRead: TdbReadRec;
begin
  dbRead := LoadConfigFromDB(TB_wifi,'Wifi', 115);
  configHex := dbRead.data;
  if Length(configHex) = 0 then exit;
  TerminalBuf.setWifi(configHex);
  updateInfo(TerminalBuf);
  btnOptionWIFI.Font.Color := BUTTON_COLOR_BASE;
  btnOptionWIFI.Caption := 'DB:' + dbRead.name;
end;

//чтение из файла Wifi
procedure Tfr_main.actWifiFromFileExecute(Sender: TObject);
var
  FileStream: TFileStream;
  buffer: TBytes;
begin
  OpenDialog.CleanupInstance;
  if DirBufferOpen[OPEN_DIALOG_WIFI] <> '' then OpenDialog.InitialDir := DirBufferOpen[OPEN_DIALOG_WIFI];
  OpenDialog.Filter := 'wi-fi setting|*.tcwf';
  if OpenDialog.Execute then
  begin
    FileStream := TFileStream.Create(OpenDialog.FileName, fmOpenRead);
    try
      SetLength(buffer, FileStream.Size);
      FileStream.Read(buffer[0], FileStream.Size);
      TerminalBuf.setWifi(Buffer);
      DirBufferOpen[OPEN_DIALOG_WIFI] := ExtractFilePath(OpenDialog.FileName);
      updateInfo(TerminalBuf);
    finally
      FileStream.Free;
      btnOptionWIFI.Font.Color := BUTTON_COLOR_FILE;
      btnOptionWIFI.Caption := ExtractFileName(OpenDialog.FileName);
    end;
  end;
end;

//Вставка в базу данных полной конфигурации
procedure Tfr_main.btnExportFromDbClick(Sender: TObject);
var
  name: String;
  buffer: array of Byte;
  isAdd: boolean;
begin
  isAdd := false;
  while not isAdd do
  begin
    name := InputBox('Введите название конфигурации', 'Название:', '');
    if Length(trim(name)) = 0 then exit;
    SetLength(buffer, SizeOf(TerminalBuf.TermianlConfig.config));
    Move(TerminalBuf.TermianlConfig.config, buffer[0], SizeOf(TerminalBuf.TermianlConfig.config));
    isAdd := dbInsertConfig(buffer, name, TB_WHOLE);
  end;  
end;

//Добавление в базу HW
procedure Tfr_main.btnExportDbHWClick(Sender: TObject);
var
 buffer: array of Byte;
 len: integer;
 name: String;
 isAdd: boolean;
begin
  isAdd := false;
  while not isAdd do
  begin
   name := InputBox('Введите название HW', 'Название:', '');
   if Length(Trim(name)) = 0 then exit;
   SetLength(buffer, 69);
   move(TerminalBuf.TermianlConfig.config.HWSetting1,buffer[0], Length(TerminalBuf.Termianlconfig.Config.HWSetting1));
   move(TerminalBuf.TermianlConfig.config.HWSetting2,buffer[4], Length(TerminalBuf.TermianlConfig.config.HWSetting2));
   move(TerminalBuf.TermianlConfig.config.HWSetting3,buffer[49], Length(TerminalBuf.TermianlConfig.config.HWSetting3));
   isAdd := dbInsertConfig(buffer, name, TB_HW);
  end;
end;

//Загрузка полной конфигурации из базы данных
procedure Tfr_main.btnDbLoadConfAllClick(Sender: TObject);
var
  configHex : Tbytes;
  name: String;
  dbRead : TdbReadRec;
begin
  dbRead := LoadConfigFromDB(TB_WHOLE,'Полную конфигурацию', SIZE_ALLCONFIG);
  configHex := dbRead.data;
  if Length(configHex) = 0 then exit;
  configHex := dbRead.data;
  TerminalBuf.loadConfig(configHex);
  updateInfo(TerminalBuf);
  buttonOption(clWebGold, 'Database');
  lbconfigAll.Caption := 'Конфигурация "'+dbRead.name+'" загружена из базы данных ';
end;

// Чтение всей конфигурации из терминала
procedure Tfr_main.btnLoadFromTerminalClick(Sender: TObject);
begin
  try
    FlagTerminalConfig := false;
    btnLoadFromTerminal.Enabled := false;
  finally
    buttonOption(clred, 'Terminal');
  end;
end;

//Сохранение полной конфигурации в файл
procedure Tfr_main.btnSaveAllConfigClick(Sender: TObject);
var
  FileStream: TFileStream;
begin
  SaveDialog.CleanupInstance;
  if DirBufferSave[OPEN_DIALOG_All] <> '' then SaveDialog.InitialDir := DirBufferSave[OPEN_DIALOG_All];
  SaveDialog.Filter := 'all config|*.cfgt';
  SaveDialog.DefaultExt := '.cfgt';
  if SaveDialog.Execute then
  begin
    FileStream := TFileStream.Create(SaveDialog.FileName, fmCreate);
    DirBufferSave[OPEN_DIALOG_All] := ExtractFilePath(SaveDialog.FileName);
    try
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.TerminalName, Length(TerminalBuf.TermianlConfig.config.TerminalName));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.ServerSyncTS, Length(TerminalBuf.TermianlConfig.config.ServerSyncTS));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.HWSetting1, Length(TerminalBuf.TermianlConfig.config.HWSetting1));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.CANDriverName, Length(TerminalBuf.TermianlConfig.config.CANDriverName));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.CANDriverTS, Length(TerminalBuf.TermianlConfig.config.CANDriverTS));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.CANDriverData, Length(TerminalBuf.TermianlConfig.config.CANDriverData));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.HWSetting2, Length(TerminalBuf.TermianlConfig.config.HWSetting2));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.WIFICfg, Length(TerminalBuf.TermianlConfig.config.WIFICfg));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.ServerAddress, Length(TerminalBuf.TermianlConfig.config.ServerAddress));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.ServerPort, Length(TerminalBuf.TermianlConfig.config.ServerPort));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.HWSetting3, Length(TerminalBuf.TermianlConfig.config.HWSetting3));
    finally
      FileStream.Free;
    end;
  end;
end;

procedure Tfr_main.Button1Click(Sender: TObject);
begin

end;

//Сохранение в базу CAN
procedure Tfr_main.btnExportDbCANClick(Sender: TObject);
var
  buffer: array of Byte;
  len: integer;
  name: String;
 isAdd: boolean;
begin
  isAdd := false;
  while not isAdd do
    begin
    name := InputBox('Введите название Can', 'Название:', '');
    if Length(Trim(name)) = 0 then exit;
    SetLength(buffer, 120);
    move(TerminalBuf.TermianlConfig.config.CANDriverName, buffer[0], Length(TerminalBuf.TermianlConfig.config.CANDriverName));
    move(TerminalBuf.TermianlConfig.config.CANDriverTS, buffer[16], Length(TerminalBuf.TermianlConfig.config.CANDriverTS));
    move(TerminalBuf.TermianlConfig.config.CANDriverData, buffer[20], Length(TerminalBuf.TermianlConfig.config.CANDriverData));
    isAdd:=dbInsertConfig(buffer, name, TB_CAN);
  end;
end;

//Сохранение в базу WIFI
procedure Tfr_main.btnExportDbWIFIClick(Sender: TObject);
var
  buffer: array of Byte;
  len: integer;
  name: String;
 isAdd: boolean;
begin
  isAdd := false;
  while not isAdd do
    begin
      name := InputBox('Введите название Wifi', 'Название:', '');
      if Length(Trim(name)) = 0 then exit;
      SetLength(buffer, 115);
      move(TerminalBuf.TermianlConfig.config.WIFICfg, buffer[0], Length(TerminalBuf.TermianlConfig.config.WIFICfg));
      isAdd := dbInsertConfig(buffer, name, TB_WIFI);
    end;
end;

//Сохранение в базу Server
procedure Tfr_main.btnExportDbServerClick(Sender: TObject);
var
  buffer: array of Byte;
  len: integer;
  name: String;
 isAdd: boolean;
begin
  isAdd := false;
  while not isAdd do
    begin
      name := InputBox('Введите название Server', 'Название:', '');
      if Length(Trim(name)) = 0 then exit;   
      SetLength(buffer, 40);
      move(TerminalBuf.TermianlConfig.config.ServerAddress, buffer[0], Length(TerminalBuf.TermianlConfig.config.ServerAddress));
      move(TerminalBuf.TermianlConfig.config.ServerPort, buffer[38], Length(TerminalBuf.TermianlConfig.config.ServerPort));
      isAdd := dbInsertConfig(buffer, name, TB_SERVER);
    end;
end;

procedure Tfr_main.btnBufferMacSTClick(Sender: TObject);
begin
  Clipboard.AsText := Terminal.getMacST;
end;

procedure Tfr_main.btnBufferMacAPClick(Sender: TObject);
begin
  Clipboard.AsText := Terminal.getMacAp;
end;

procedure Tfr_main.btnBufferSimIdClick(Sender: TObject);
begin
  Clipboard.AsText := Terminal.getSimID;
end;

procedure Tfr_main.btnBufferSWClick(Sender: TObject);
begin
  Clipboard.AsText := Terminal.getSW;
end;

procedure Tfr_main.btnBufferCodeClick(Sender: TObject);
begin
  Clipboard.AsText := Terminal.decodeCoding;
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

procedure Tfr_main.lbGsmOperatorClick(Sender: TObject);
begin
  Clipboard.AsText :=  lbGsmOperator.Caption;
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

  SetLength(name,32);
  SetLength(_config, SIZE_ALLCONFIG);
  case cbTypeTerminalName.ItemIndex of
  0: //Default
    begin
      //Брать имя которое было в терминале
      move(Terminal.TerminalInfo.name,name[0],32);
      for I := 0 to Length(name)-1 do
        TerminalBuf.TermianlConfig.config.TerminalName[i] := name[i];
    end;
  1: //Custom
    begin
      for i := 1 to edTerminalName.MaxLength do
        if i < Length(edTerminalName.Text)+1 then TerminalBuf.TermianlConfig.config.TerminalName[i-1] := Ord(edTerminalName.Text[i])
                                             else TerminalBuf.TermianlConfig.config.TerminalName[i-1] := $20;
    end;
  2://Generate
    begin
      name := getCustomName;
      for I := 0 to Length(name)-1 do
        TerminalBuf.TermianlConfig.config.TerminalName[i] := name[i];
    end;
  end;

  if TerminalBuf.CanDriverNameBuf <> ''  then
    TerminalBuf.setCanDriverName(TerminalBuf.CanDriverNameBuf);
  move(TerminalBuf.TermianlConfig,Terminal.TermianlConfig,sizeOf(Terminal.TermianlConfig));

  waitFirmware := True;
  btnFirmware.Enabled := false;
  Terminal.firmware();   
end;

procedure Tfr_main.btnLoadConfAllClick(Sender: TObject);
var
  i : integer;
  buf : Tarray<byte>;
  FileStream: TFileStream;
begin
  OpenDialog.CleanupInstance;
  if DirBufferOpen[OPEN_DIALOG_ALL] <> '' then OpenDialog.InitialDir := DirBufferOpen[OPEN_DIALOG_ALL];
  OpenDialog.Filter := 'all config|*.cfgt';
  if OpenDialog.Execute then
  begin
    SetLength(buf, SIZE_ALLCONFIG);
    FileStream := TFileStream.Create(OpenDialog.FileName, fmOpenRead);
    DirBufferOpen[OPEN_DIALOG_ALL] := ExtractFilePath(OpenDialog.FileName);
    try
      FileStream.ReadBuffer(buf[0], SIZE_ALLCONFIG);
      TerminalBuf.loadConfig(buf);
      buttonOption(clred,'File');
      lbconfigAll.Caption := 'Конфигурация "'+ ExtractFileName(OpenDialog.FileName)+'" загружена из файла ';
      updateInfo(TerminalBuf);
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
  SaveDialog.CleanupInstance;
  if DirBufferSave[OPEN_DIALOG_HW] <> '' then SaveDialog.InitialDir := DirBufferSave[OPEN_DIALOG_HW];
  SaveDialog.Filter := 'HW setting|*.tchw';
  SaveDialog.DefaultExt := '.tchw';
  if SaveDialog.Execute then
  begin
    FileStream := TFileStream.Create(SaveDialog.FileName, fmCreate);
    DirBufferSave[OPEN_DIALOG_HW] := ExtractFilePath(SaveDialog.FileName);
    try
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.HWSetting1, Length(TerminalBuf.TermianlConfig.config.HWSetting1));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.HWSetting2, Length(TerminalBuf.TermianlConfig.config.HWSetting2));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.HWSetting3, Length(TerminalBuf.TermianlConfig.config.HWSetting3));
    finally
      FileStream.Free;
    end;
  end;
end;

//Сохранение в отдельный файл из общей конфигурации
procedure Tfr_main.btnbufferTerminalIdClick(Sender: TObject);
begin
  Clipboard.AsText := Terminal.getTerminalID;
end;

procedure Tfr_main.btnExportCANClick(Sender: TObject);
var
  FileStream: TFileStream;
begin
  SaveDialog.CleanupInstance;
  if DirBufferSave[OPEN_DIALOG_CAN] <> '' then SaveDialog.InitialDir := DirBufferSave[OPEN_DIALOG_CAN];
  if TerminalBuf.getCANDriverName <> '' then SaveDialog.FileName := TerminalBuf.getCANDriverName;
  SaveDialog.Filter := 'CAN DATA |*.cdf| Can driver (*.tccn)|*.tccn';
  SaveDialog.DefaultExt := '.cdf';
  if SaveDialog.Execute then
  begin
    FileStream := TFileStream.Create(SaveDialog.FileName, fmCreate);
    DirBufferSave[OPEN_DIALOG_CAN] := ExtractFilePath(SaveDialog.FileName);
    try
      if SaveDialog.FilterIndex = 1 then //Если .cdf 100 байт (данные драйвера)
        FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.CANDriverData, Length(TerminalBuf.TermianlConfig.config.CANDriverData));
      if SaveDialog.FilterIndex = 2 then //Если .tccn 120 байт (16 - имя, 4 - время, 100 - данные)
      begin
        FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.CANDriverName, Length(TerminalBuf.TermianlConfig.config.CANDriverName));
        FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.CANDriverTS, Length(TerminalBuf.TermianlConfig.config.CANDriverTS));
        FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.CANDriverData, Length(TerminalBuf.TermianlConfig.config.CANDriverData));
      end;
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
  SaveDialog.CleanupInstance;
  if DirBufferSave[OPEN_DIALOG_WIFI] <> '' then SaveDialog.InitialDir := DirBufferSave[OPEN_DIALOG_WIFI];
  SaveDialog.Filter := 'wi-fi setting|*.tcwf';
  SaveDialog.DefaultExt := '.tcwf';
  if SaveDialog.Execute then
  begin
    FileStream := TFileStream.Create(SaveDialog.FileName, fmCreate);
    DirBufferSave[OPEN_DIALOG_WIFI] := ExtractFilePath(SaveDialog.FileName);
    try
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.WIFICfg, Length(TerminalBuf.TermianlConfig.config.WIFICfg));
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
  SaveDialog.CleanupInstance;
  if DirBufferSave[OPEN_DIALOG_SERV] <> '' then SaveDialog.InitialDir := DirBufferSave[OPEN_DIALOG_SERV];
  SaveDialog.Filter := 'Server |*.tcsr';
  SaveDialog.DefaultExt := '.tcsr';
  if SaveDialog.Execute then
  begin
    FileStream := TFileStream.Create(SaveDialog.FileName, fmCreate);
    DirBufferSave[OPEN_DIALOG_SERV] := ExtractFilePath(SaveDialog.FileName);
    try
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.ServerAddress, Length(TerminalBuf.TermianlConfig.config.ServerAddress));
      FileStream.WriteBuffer(TerminalBuf.TermianlConfig.config.ServerPort, Length(TerminalBuf.TermianlConfig.config.ServerPort));
    finally
      FileStream.Free;
    end;
  end;
end;

//Общий загрузка из файла
procedure Tfr_main.showMenuButton(actFile: Taction; actDb:Taction);
begin
  miFromFile.Action := actFile;
  miFromDateBase.Action := actDb;
  pm.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

//Чтение файла конфигурации CAN (DATA)
procedure Tfr_main.btnOptionCANMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  showMenuButton(actCanFromFile, actCanFromDb);
end;

// Чтение файла конфигурации HW
procedure Tfr_main.btnOptionHWMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  showMenuButton(actHwFromFile, actHwFromDb);
end;

// Чтение файла конфигурации Сервера
procedure Tfr_main.btnOptionServMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  showMenuButton(actServerFromFile, actServerFromDb);
end;

//Чтение файла конфигурации wi-fi
procedure Tfr_main.btnOptionWIFIMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  showMenuButton(actWifiFromFile, actWifiFromDb);
end;

//Переключение (подключено/отключено)
procedure Tfr_main.switchConnectionExecute(Sender: TObject);
begin
  if comPort.Connected then actDisconnect.Execute
                       else actConnect.Execute;
end;

//Обновляем список доступных компортов
procedure Tfr_main.trmAvailableComportsTimer(Sender: TObject);
begin
  getAvalibleComPorts;
end;

//
procedure Tfr_main.gbHWClick(Sender: TObject);
var EditModal : TfrHWEdit;
begin
   EditModal := TfrHWEdit.Create(nil);
   EditModal.setHWSetting(TerminalBuf.TermianlConfig.config);
   EditModal.ShowModal;
   TerminalBuf.setHW(EditModal.getHWSetting);
   updateInfo(TerminalBuf);
   if EditModal.getisChange then
   begin
    btnOptionHW.Font.Color := BUTTON_COLOR_CUSTOM;
    btnOptionHW.Caption := 'Custom';
   end;
end;

procedure Tfr_main.generatorName(isEdit:boolean);
begin
  edNameSN.Enabled:=isEdit;
  edNameModel.Enabled:=isEdit;
  edNameClient.Enabled:=isEdit;
  edNameParkNumber.Enabled:=isEdit;
end;

//
procedure Tfr_main.cbTypeTerminalNameChange(Sender: TObject);
begin
  generatorName(False);
  case cbTypeTerminalName.ItemIndex of
  0:
    begin
      edTerminalName.ReadOnly := True;
      edTerminalName.Clear;
    end;
  1: edTerminalName.ReadOnly := false;
  2:
    begin
      generatorName(True);
      edTerminalName.ReadOnly := True;
      edTerminalName.Text := edNameModel.Text  +' '+
                             edNameSN.Text     +' '+
                             edNameClient.Text +' '+
                             edNameParkNumber.Text;
    end;

   3: edTerminalName.Text := TerminalBuf.getNameTerminalConfig;
  end;

end;

procedure Tfr_main.Database1Click(Sender: TObject);
begin
  fr_database.Show;
end;

//Подключение к базе данных
procedure Tfr_main.DbConnectExecute(Sender: TObject);
begin
  fr_main.connectDB(dbHost,
                    intToStr(dbPort),
                    dbName,
                    dbLogin,
                    dbPassword);
end;

//После установки соединения с базой данных
procedure Tfr_main.dbConnectionAfterConnect(Sender: TObject);
begin
  imgConnectDB.ImageIndex := CONNECT_GREEN;
  sendMessage('Соединение c БД установлено');
  btnDbLoadConfAll.Enabled := True;
  btnExportDbHW.Enabled := True;
  btnExportDbCAN.Enabled := True;
  btnExportDbWIFI.Enabled := True;
  btnExportDbServer.Enabled := True;
  actHwFromDb.Enabled := True;
  actCanFromDb.Enabled := True;
  actWifiFromDb.Enabled := True;
  actServerFromDb.Enabled := True;
  mmDisconnect.Enabled := true;
  btnExportFromDb.Enabled := true;
  mmConnect.Enabled := false;
end;

//После отключения от базы данных
procedure Tfr_main.dbConnectionAfterDisconnect(Sender: TObject);
begin
  imgConnectDB.ImageIndex := CONNECT_RED;
  sendMessage('Отключение от базы данных');
  btnDbLoadConfAll.Enabled := False;
  btnExportDbHW.Enabled := False;
  btnExportDbCAN.Enabled := False;
  btnExportDbWIFI.Enabled := False;
  btnExportDbServer.Enabled := False;
  actHwFromDb.Enabled := false;
  actCanFromDb.Enabled := false;
  actWifiFromDb.Enabled := false;
  actServerFromDb.Enabled := false;
  mmDisconnect.Enabled := false;
  btnExportFromDb.Enabled := false;
  mmConnect.Enabled := true;
end;

procedure Tfr_main.edNameClientKeyPress(Sender: TObject; var Key: Char);
begin
  if key > chr(128) then key:=#0;
end;

//Берем последнии символы из все строки
function lastSymbol(st : String; num : integer):String;
var buf:string;
    i:integer;
begin
  buf:= st;
  if Length(st) > num then buf := Copy(st, Length(buf) - (num-1), num);
  result:= buf;
end;

//Добиваем пробелами
function PadRight(const Str: string; TotalWidth: Integer; PaddingChar: Char = ' '): string;
var
  PaddingCount: Integer;
begin
  PaddingCount := TotalWidth - Length(Str);
  if PaddingCount > 0 then
    Result := Str + StringOfChar(PaddingChar, PaddingCount)
  else
    Result := Str;
end;

procedure Tfr_main.edNameModelChange(Sender: TObject);
begin
  if cbTypeTerminalName.ItemIndex = 2 then
  edTerminalName.Text := PadRight(edNameModel.Text,edNameModel.MaxLength)  +' '+
                         PadRight(lastSymbol(edNameSN.Text, 8),8) +' '+
                         PadRight(edNameClient.Text,edNameClient.MaxLength) +' '+
                         PadRight(lastSymbol(edNameParkNumber.Text,3),3);
end;

procedure Tfr_main.edNameModelKeyPress(Sender: TObject; var Key: Char);
begin
  if key > chr(128) then key:=#0;
end;

procedure Tfr_main.edNameParkNumberKeyPress(Sender: TObject; var Key: Char);
begin
  if key > chr(128) then key:=#0;
end;

procedure Tfr_main.edNameSNKeyPress(Sender: TObject; var Key: Char);
begin
  if key > chr(128) then key:=#0;
end;

procedure Tfr_main.edTerminalNameKeyPress(Sender: TObject; var Key: Char);
begin
  if key > chr(128) then key:=#0;
end;

procedure Tfr_main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveSettings;
end;

procedure Tfr_main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := false;
  if MessageDlg('Вы уверены, что хотите закрыть приложение?', TMsgDlgType.mtInformation, [mbyes, mbno], 0) = mryes then
  begin
    CanClose := true;
  end;
end;

procedure Tfr_main.FormCreate(Sender: TObject);
var assoc     : TAssociation;
    assocHW : TAssocData;
begin
  FlagTerminalConfig := true;

  TerminalBuf := Tterminal.Create();     // Буферный файл
  Terminal := Tterminal.Create(comport); // Терминал (Передача компонента)
  TerminalInfo := TstringList.Create;    // информации о терминале
  TerminalInfoBuf := TStringList.Create; // Буфер информации о терминале
  getAvalibleComPorts;                   // Доступные COM порты
  LoadSettings;                          // Загрузка ini
  cbTypeTerminalName.ItemIndex := 0;
  TerminalHead := TTerminalThread.Create(comport, OnTerminalDataReceived);
  TerminalHead.TerminateEvent := TEvent.Create(nil, True, False, '');
  TerminalHead.Start;
  waitFirmware := false;
  if startConnect.Checked then
    DbConnect.Execute;

  CreateDSN(                                                                    // Создание записи в реестре для MYSQL
    Base_DSN,                                                            // Название подключения
    dbPathDllDB,                                                                // Путь до DLL
    dbHost,                                                                     // Хост
    dbName,                                                                     // Название базы
    dbLogin,                                                                    // Имя пользователя
    dbPassword                                                                  // Пароль
  );

  N1.Visible := false;
  {$IFDEF DEBUG}
    N1.Visible := true;
  {$ENDIF}

  //---Создание ассоциаций----
  assoc := TAssociation.create;

  assocHW.Extension   := 'tchw';
  assocHW.KeyName     := 'Terminator';
  assocHW.Description := 'Hardware';
  assocHW.AppName     := 'Terminator.exe';

  assoc.add(assocHW);

end;

//Удаление объектов
procedure Tfr_main.FormDestroy(Sender: TObject);
begin
  Terminal.Free;
  TerminalBuf.Free;
  TerminalInfo.Free;
  TerminalInfoBuf.Free;
end;


procedure Tfr_main.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var isSuccess:boolean;
begin
  //ctrl+v вставка буфера
  if (Shift = [ssCtrl]) and (Key = Ord('V')) then
  begin
    if Clipboard.HasFormat(CF_TEXT) then
      begin
       parserBuffer(Clipboard.AsText);
       {$IFDEF DEBUG}
          sendMessage(Clipboard.AsText);
       {$ENDIF}
      end;
    Key := 0; // Устанавливаем Key в 0, чтобы предотвратить стандартное действие клавиши
  end;
end;

procedure Tfr_main.FormShow(Sender: TObject);
begin

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
   if (comPortList.Count >= 1)  then
   begin
      try
        cbComPorts.ItemIndex := 0; // выбираем первый ком порт,и пытаемся подключиться
      except
      end;
   end;

  end;
 comPortlist.Free;
end;

//Загрузка настроек файла INI
procedure Tfr_main.LoadSettings;
var
  IniFile: TIniFile;
  iniPath : string;
  passwordDecode : string;
begin
  iniPath := ExtractFilePath(Application.ExeName) + 'settings.ini';
  IniFile := TIniFile.Create(iniPath);
  try
    startConnect.Checked := IniFile.ReadBool('General', 'autoConnect', true);
    chbResetTerminal.Checked        := IniFile.ReadBool('General', 'ResetTertminal', true);
    DirBufferOpen[OPEN_DIALOG_HW]   := IniFile.ReadString('OpenDialog', 'HW','C:\');
    DirBufferOpen[OPEN_DIALOG_CAN]  := IniFile.ReadString('OpenDialog', 'CAN','C:\');
    DirBufferOpen[OPEN_DIALOG_WIFI] := IniFile.ReadString('OpenDialog', 'WIFI','C:\');
    DirBufferOpen[OPEN_DIALOG_SERV] := IniFile.ReadString('OpenDialog', 'SERVER','C:\');
    DirBufferOpen[OPEN_DIALOG_ALL]  := IniFile.ReadString('OpenDialog', 'all','C:\');
    DirBufferSave[OPEN_DIALOG_HW]   := IniFile.ReadString('SaveDialog', 'HW','C:\');
    DirBufferSave[OPEN_DIALOG_CAN]  := IniFile.ReadString('SaveDialog', 'CAN','C:\');
    DirBufferSave[OPEN_DIALOG_WIFI] := IniFile.ReadString('SaveDialog', 'WIFI','C:\');
    DirBufferSave[OPEN_DIALOG_SERV] := IniFile.ReadString('SaveDialog', 'SERVER','C:\');
    DirBufferSave[OPEN_DIALOG_ALL]  := IniFile.ReadString('SaveDialog', 'all','C:\');

    cbComPorts.ItemIndex := IniFile.ReadInteger('main','comport', 0);

    dbHost     := IniFile.ReadString('db', 'host','localhost');
    dbPort     := IniFile.ReadInteger('db','port', 3306);
    dbName     := IniFile.ReadString('db', 'name', 'terminal_config');
    dbLogin    := IniFile.ReadString('db', 'login','root');
    dbPathDllDB := IniFile.ReadString('db','dll', 'C:\Program Files (x86)\MySQL\Connector ODBC 8.0\myodbc8w.dll');
    passwordDecode := IniFile.ReadString('db', 'password','password');
    dbPassword := TNetEncoding.Base64.Decode(passwordDecode);
  finally
    IniFile.Free;
  end;
end;

// Сохранение настроек в файл INI
procedure Tfr_main.SaveSettings;
var
  IniFile: TIniFile;
  iniPath : string;
  passwordEncode : string;
begin
  iniPath := ExtractFilePath(Application.ExeName) + 'settings.ini';
  IniFile := TIniFile.Create(iniPath);
  try
    IniFile.WriteBool('General', 'autoConnect', startConnect.Checked);
    iniFile.WriteBool('General', 'ResetTertminal', chbResetTerminal.Checked);
    iniFile.WriteString('OpenDialog', 'HW', DirBufferOpen[OPEN_DIALOG_HW]);
    iniFile.WriteString('OpenDialog', 'CAN', DirBufferOpen[OPEN_DIALOG_CAN]);
    iniFile.WriteString('OpenDialog', 'WIFI', DirBufferOpen[OPEN_DIALOG_WIFI]);
    iniFile.WriteString('OpenDialog', 'SERVER', DirBufferOpen[OPEN_DIALOG_SERV]);
    iniFile.WriteString('OpenDialog', 'all', DirBufferOpen[OPEN_DIALOG_ALL]);
    iniFile.WriteString('SaveDialog', 'HW', DirBufferSave[OPEN_DIALOG_HW]);
    iniFile.WriteString('SaveDialog', 'CAN', DirBufferSave[OPEN_DIALOG_CAN]);
    iniFile.WriteString('SaveDialog', 'WIFI', DirBufferSave[OPEN_DIALOG_WIFI]);
    iniFile.WriteString('SaveDialog', 'SERVER', DirBufferSave[OPEN_DIALOG_SERV]);
    iniFile.WriteString('SaveDialog', 'all', DirBufferSave[OPEN_DIALOG_ALL]);


    iniFile.WriteInteger('main', 'comport', cbComPorts.ItemIndex);

    IniFile.WriteString('db','host', dbHost);
    IniFile.WriteInteger('db','port', dbPort);
    IniFile.WriteString('db','name', dbName);
    IniFile.WriteString('db','login', dbLogin);
    IniFile.WriteString('db', 'dll', dbPathDllDB);

    passwordEncode := TNetEncoding.Base64.Encode(dbPassword);
    IniFile.WriteString('db','password', passwordEncode);
  finally
    IniFile.Free;
  end;
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

  if FlagTerminalConfig = false then Terminal.getTerminalConfig;

   //Если информация о терминале
  if Data[1] = CMD_TERMINAL_INFO then
  begin
    printInfoTerminal;
    btnLoadFromTerminal.Enabled := true;
  end;

  if data[1] = $ED then
    begin
      waitFirmware:=false;
      btnFirmware.Enabled := true;
      sendMessage('Write Configuration: Successful');
      if (chbResetTerminal.Checked) then Terminal.resetTerminal;
    end;

  if Data[1] = CMD_CONFIG_READ then
  begin
    move(Terminal.TermianlConfig,TerminalBuf.TermianlConfig,sizeOf(TerminalBuf.TermianlConfig));
    lbconfigAll.Caption := 'Конфигурация загружена из Терминала';
    updateInfo(Terminal);
    FlagTerminalConfig := true;
    btnLoadFromTerminal.Enabled := true;
  end;

  if waitFirmware then
  begin
    Terminal.firmware();
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

//----------------------------------db---------------------------------------

//Сохранение конфигурации в базу
function Tfr_main.dbInsertConfig(configfHex: array of Byte; name: String; tableName: String):Boolean;
var
  Query: TADOQuery;
  buffer: array of Byte;
  len: integer;
  TableType:TTableType;
begin
  Query := TADOQuery.Create(nil);
  try
    Query.Connection := dbConnection;
    if not dbConnection.Connected then
      dbConnection.Connected := True;
    Query.SQL.Text := Format('SELECT * FROM '+ dbName +'.%s', [TB_NEW_VER]);
    Query.Open;
    TableType := getType(tablename);
    len := Length(configfHex);
    SetLength(buffer, len);
    move(configfHex, buffer[0], len);
    try
      Query.Insert;
      Query.FieldByName('name').Value := name;
      Query.FieldByName('type_id').Value := TableType.id;
      Query.FieldByName('data').Value := buffer;
      Query.FieldByName('timestamp').Value := Now;
//      Query.FieldByName('active').Value := '1';
      Query.Post;
      MessageDlg('Запись успешно создана', TMsgDlgType.mtInformation,[mbOk],0);
      result := true;
    except
      on E: Exception do
      begin
        if pos('denied', E.Message ) > 0  then
          begin
             MessageDlg('Не хватает прав доступа', mtWarning,[mbOk], 0);
             result := true;
             exit;
          END;

        if pos('Duplicate', E.Message ) > 0  then
          MessageDlg('Запись с таким именем уже существует.', mtWarning,[mbOk], 0);


//        MessageDlg(E.Message, mtWarning,[mbOk], 0);
        result := false;
      end;
    end;
    Query.Close;
  finally
    Query.Free;
  end;
end;

//Получение списка конфигураций
function Tfr_main.dbGetConfig(tableName: String): TStringList;
var
  Query: TADOQuery;
  buffer: array of Byte;
  len: integer;
  ResultList: TStringList;
  TableType:TTableType;
begin
  Query := TADOQuery.Create(nil);
  ResultList := TStringList.Create;
  try
    TableType := getType(tablename);
    Query.Connection := dbConnection;
    Query.SQL.Text := Format('SELECT * FROM '+ dbName +'.%s WHERE deleted=0', [tableName]);
    Query.Open;
    while not Query.Eof do
    begin
      ResultList.Add(Query.FieldByName('name').AsString);
      Query.Next;
    end;
    Query.Close;
    result := ResultList;
  finally
    Query.Free;
  end;
end;

//Удаление записи
procedure Tfr_main.dbDeleteRecord(tablename:String; id:integer);
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(nil);
  try
    Query.Connection := dbConnection;
    Query.SQL.Text := Format('UPDATE %s SET active = 0 WHERE id = ''%d''', [tablename, id]);
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

//Восстановлеение записи
procedure Tfr_main.dbRestoreRecord(tablename:String; id:integer);
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(nil);
  try
    Query.Connection := dbConnection;
    Query.SQL.Text := Format('UPDATE %s SET active = 1 WHERE id = ''%d''', [tablename, id]);
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;    

//Поиск записи в базе, и добавление в буфер если нашлась
function Tfr_main.dbGetRecord(tablename:String; id:integer; size:integer):Boolean;
var TableType:TTableType;
begin
  try
    TableType := getType(tablename);
    ADOQuerydata.Size := size;
    ADOQuery.SQL.Text := 'SELECT * FROM '+dbName+'.'+TB_NEW_VER+' WHERE id='+intTostr(id) + ' AND type_id='+TableType.id.ToString;
    ADOQuery.Open;

    result:=false;
    if ADOQuery.RecordCount = 0  then exit;

    if tablename = TB_HW then
    begin 
      TerminalBuf.setHW(ADOQuerydata.Value);
      btnOptionHW.Font.Color := clWebFuchsia;
      btnOptionHW.Caption := 'Buffer';
    end;
    if tablename = TB_CAN then
    begin 
      TerminalBuf.setCAN(ADOQuerydata.Value);  
      btnOptionCAN.Font.Color := clWebFuchsia;
      btnOptionCAN.Caption := 'Buffer';
    end;
    
    if tablename = TB_WIFI then
    begin 
      TerminalBuf.setwifi(ADOQuerydata.Value);
      btnOptionWIFI.Font.Color := clWebFuchsia;
      btnOptionWIFI.Caption := 'Buffer';
    end;
    
    if tablename = TB_SERVER then
    begin
      TerminalBuf.setServ(ADOQuerydata.Value);
      btnOptionServ.Font.Color := clWebFuchsia;
      btnOptionServ.Caption := 'Buffer';
    end;
     
   
    updateInfo(TerminalBuf);
    result:=true;
  finally
    ADOQuery.close;   
  end;
end;

//Отключение от базы
procedure Tfr_main.mmDisconnectClick(Sender: TObject);
begin
  dbConnection.Connected := False;
end;        

//Создание таблиц в базе
function Tfr_main.dbinitialTables:boolean;
var
  Command: TADOCommand;
begin
  try
    Command := TADOCommand.create(nil);
    try
      Command.Connection := dbConnection;
      Command.CommandText := 'CREATE TABLE ' + TB_NEW_VER + ' (' +
        'id INT AUTO_INCREMENT PRIMARY KEY, ' +
        'type_id int(11), ' +
        'name VARCHAR(255) UNIQUE, ' +
        'data BLOB, ' +
        'timestamp DATETIME,' +
         'deleted BOOL DEFAULT 0' +
        ')';
      Command.Execute;

      result := true;
    except
      on E: Exception do
      begin
        result := false;
        if Pos('already exists', AnsiLowerCase(E.Message)) > 0 then
//        fr_main.sendMessage('Таблицы уже существуют');
      end;
    end;
  finally
    Command.Free;
  end;
end;

//Чтение конфигурации из базы
function Tfr_main.LoadConfigFromDB(tableName:String; caption:String; DataSize: integer): TdbReadRec;
var
  LoadConfigForm: Tfr_database_load;
begin
  LoadConfigForm := Tfr_database_load.Create(nil);
  try
    LoadConfigForm.tableName := tableName;
    LoadConfigForm.Caption:= 'Выберите:'+caption;
    LoadConfigForm.Querydata.Size := DataSize;
    LoadConfigForm.ShowModal;

    if Length(LoadConfigForm.FieldHexData) <> 0 then
    begin
        Result.id := LoadConfigForm.FieldId;
        result.Name := LoadConfigForm.FieldName;
        result.data := LoadConfigForm.FieldHexData;
    end;
  finally
    LoadConfigForm.Free;
  end;
end;
//---------------DataBase-------------------------------------------------------

//Парсинг строки
procedure ParseGETRequest(const URL: string);
var
  Params: TStringList;
  URI: TIdURI;
  I: Integer;
  ParamName, ParamValue: string;  
begin
  Params := TStringList.Create;
  URI := TIdURI.Create(URL);
  try
    // Получаем список параметров из URL
    Params.Delimiter := '&';
    Params.DelimitedText := URI.Params;

    // Обрабатываем каждый параметр
    for I := 0 to Params.Count - 1 do
    begin
      // Разделяем имя и значение параметра по символу '='
      ParamName := Params.Names[I];
      ParamValue := Params.ValueFromIndex[I];

      if ParamName = 'hw' then
        prHw := strToint(ParamValue)
      else if ParamName = 'can' then
        prcan := strToint(ParamValue)
      else if ParamName = 'wifi' then
        prwifi := strToint(ParamValue)
      else if ParamName = 'serv' then
        prserv := strToint(ParamValue)   
      else if ParamName = 'model' then
        prModel := ParamValue  
      else if ParamName = 'sn' then
        prsn := ParamValue 
      else if ParamName = 'park' then
        prpark := ParamValue    
      else if ParamName = 'client' then
        prClient:= ParamValue   
    end;    

  finally
    Params.Free;
    URI.Free;
  end;
end;

//Парсинг буффера
//Пример https://tech.vizor.ru/?hw=1&can=2&wifi=5&serv=4&model=linda&client=lerua&sn=15673567&park=156
procedure Tfr_main.parserBuffer(Text: String);
var 
  msg: TStringlist;
begin
  prHW := 0;
  prCAN := 0;
  prWIFI := 0;
  prServ := 0;
  prClient := '';
  prModel := '';
  prSN := '';
  prPark := '';
  
  ParseGETRequest(Text); //Парсим 
  msg := TstringList.Create;  
  //Если в буфере содержались индыксы
  if (prHW <> 0) OR
     (prCAN <> 0) OR
     (prWIFI <> 0) OR
     (prServ <> 0) then 
  begin
    //Парсинг конфигурации
    if not dbGetRecord(TB_HW, prHW, SIZE_HW_BYTE) then msg.Add('HW');
    if not dbGetRecord(TB_CAN, prCAN, SIZE_CAN_BYTE) then msg.Add('CAN');
    if not dbGetRecord(TB_WIFI, prWIFI, SIZE_WIFI_BYTE) then msg.Add('WIFI');
    if not dbGetRecord(TB_SERVER, prServ, SIZE_SERV_BYTE) then msg.Add('SERVER');
    if msg.Count <> 0 then 
      MessageDlg('Не удалось найти: ' + msg.CommaText, TMsgDlgType.mtInformation, [mbOK], 0);
  end;

  //Если в буфере содержалось имя 
  if (prClient <> '') OR
     (prModel <> '') OR
     (prSN <> '') OR
     (prPark <> '')  then
  begin  
    cbTypeTerminalName.ItemIndex:=2;
    generatorName(True);
    edNameSN.Text         := PadRight(lastSymbol(prSN,     8), 8);
    edNameModel.Text      := PadRight(lastSymbol(prModel , 10),10);
    edNameClient.Text     := PadRight(lastSymbol(prClient, 8), 8);
    edNameParkNumber.Text := PadRight(lastSymbol(prPark,   3), 3);
  end;
  
  msg.Free;
end;


// Получение типа записи
function Tfr_main.getType(TableName: String): TTableType;
begin

  if TableName = TB_HW  then
  begin
    Result.id := 1;
    Result.Name := 'HW';
    Result.size := 69;
  end;

  if TableName = TB_CAN  then
  begin
    Result.id := 2;
    Result.Name := 'CAN';
    Result.size := 120;
  end;

  if TableName = TB_WIFI  then
  begin
    Result.id := 3;
    Result.Name := 'WIFI';
    Result.size := 115;
  end;

  if TableName = TB_SERVER  then
  begin
    Result.id := 4;
    Result.Name := 'SRV';
    Result.size := 40;
  end;

  if TableName = TB_WHOLE  then
  begin
    Result.id := 5;
    Result.Name := 'TMPL';
    Result.size := 380;
  end;

//  if TableName = TB_WIFI_SERV  then
//  begin
//    Result.id := 6;
//    Result.Name := 'WIFI+SERVER';
//    Result.size := 155;
//  end;

end;

end.
