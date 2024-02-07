unit fr_SERVEREdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin, Terminal, fr_settings, lib_main;

const
  MSG_CLOSING_REQUST = '��������� �������?';
  MSG_ERROR_HOST = '������ "�����" �� ������ ��������� 38 ��������';

type
  TfrServerEdit = class(TForm)
    plMain: TPanel;
    plButtons: TPanel;
    btnClose: TButton;
    btnSave: TButton;
    btnReset: TButton;
    plHost: TPanel;
    plPort: TPanel;
    lbHost: TLabel;
    lbPort: TLabel;
    edHost: TEdit;
    spPort: TSpinEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure spPortMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure spPortKeyPress(Sender: TObject; var Key: Char);
    procedure edHostKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FConfBuf  : TConfig;                                                        // ������ ��� �������� ��������
    FConfCurr : Tconfig;                                                        // ������� ���������
    FConfSave : TConfig;                                                        // ����������� ���������
    settings  : TfrSettings;
    FChange   : Boolean;
    procedure save;
    function  getServerAddress         : String;
    function  setHost(_host : String)  : boolean;
    function  setPort(_Port : Word)    : boolean;
    function  createFormSettings(param : TWinControl; _val : TeditSpin) : real;
  public
    { Public declarations }
    procedure setServerSettings(_ServerSettings: Tconfig);                      // ���������� �������� ���������
    function  getServerSettings:Tbytes;                                         // ������� ������������� ���������
    function  getisChange:Boolean;
  end;

var
  frServerEdit: TfrServerEdit;

implementation

{$R *.dfm}

function TfrServerEdit.getisChange: Boolean;
begin
  result := FChange;
end;

function TfrServerEdit.getServerAddress: String;
var buff : TBytes;
begin
  SetLength(buff, 40);
  move(FConfCurr.ServerAddress[0], buff[0], 38);
  buff[39] := 0;
  result := PAnsiChar(@buff[0]);
end;

procedure TfrServerEdit.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrServerEdit.btnResetClick(Sender: TObject);
begin
  setServerSettings(FConfBuf);
end;

procedure TfrServerEdit.btnSaveClick(Sender: TObject);
begin
  save;
  FConfSave := FConfCurr;
  FChange := True;
  close;
end;

function TfrServerEdit.getServerSettings: Tbytes;
begin
  SetLength(result, 40);
  move(FConfCurr.ServerAddress[0], result[0], 38);
  move(FConfCurr.ServerPort[0],    result[38], 2);
end;

procedure TfrServerEdit.save;
begin
  setHost(edHost.Text);
  setPort(spPort.Value);
end;

function TfrServerEdit.setHost(_host: String) : Boolean;
var buf : TBytes;
begin
  result:=true;

  if Length(_host) > sizeOf(FConfCurr.ServerAddress) then
  begin
    MessageDlg(MSG_ERROR_HOST,TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
    result:=false;
    exit;
  end;

  try
    buf := TEncoding.UTF8.GetBytes(_host);
    FillChar(FConfCurr.ServerAddress[0], SizeOf(FConfCurr.ServerAddress), 0);         // ������� ������� ����� ������������
    Move(buf[0], FConfCurr.ServerAddress[0], Length(buf));
  except
    result := false;
  end;
end;

function TfrServerEdit.setPort(_Port: word) : Boolean;
begin
  result := true;
  try
    FConfCurr.ServerPort[0] := Hi(_Port);
    FConfCurr.ServerPort[1] := LO(_Port);
  except
    result := false;
  end;
end;

procedure TfrServerEdit.setServerSettings(_ServerSettings: TConfig);
begin
  FConfBuf  := _ServerSettings;
  FConfSave := _ServerSettings;
  FConfCurr := _ServerSettings;


  edHost.Text  :=  getServerAddress;
  spPort.Value := (FConfCurr.ServerPort[0] shl 8) or FConfCurr.ServerPort[1];
end;

function TfrServerEdit.createFormSettings(param : TWinControl; _val : TeditSpin) : real;
begin
  try
    settings      := TfrSettings.Create(nil);
    settings.Top  := self.Top  + param.Top  + 30;
    settings.Left := self.Left + spPort.Left + plPort.Left + plPort.Margins.Left + plPort.Margins.Right;
    settings.setData(_val);
    settings.ShowModal;
    param.SetFocus;
  finally
    result := settings.getResult;
    settings.Free;
  end;
end;

procedure TfrServerEdit.edHostKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then spPort.SetFocus;
end;



procedure TfrServerEdit.FormActivate(Sender: TObject);
begin
  FChange := false;
end;

procedure TfrServerEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   Save;                                                                        // ��������� ������������

  if StructuresEqual(FConfCurr, FConfSave)
  then exit;                                                                     // ���� ����������� ������������ ����� �����������

  if MessageDlg(MSG_CLOSING_REQUST, mtConfirmation, [mbyes, mbNo], 0 ) = mrNo
  then FConfCurr := FConfBuf
  else FChange := True;

  CanClose := true;
end;

procedure TfrServerEdit.spPortKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '+' then spPort.Value := spPort.Value+1;
  if key = '-' then spPort.Value := spPort.Value-1;

  if key = #24 then spPort.Value := spPort.Value+1;
  if key = #25 then spPort.Value := spPort.Value-1;

  if key = #13 then save;

  if not (Key in ['0'..'9', #8]) then
    Key := #0; // ������ ����� �������, ���� �� �� �������� ������ ��� Backspace
end;

procedure TfrServerEdit.spPortMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
//var val : TeditSpin;
//    res : real;
begin
//  val.Min       := spPort.MinValue;
//  val.Max       := spPort.MaxValue;
//  val.offset    := 1;
//  val.position  := spPort.Value;
//  val.prescaler := 1;
//  res := createFormSettings(plPort, val);
//  spPort.Value := round(res);
end;

end.
