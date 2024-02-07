unit fr_HWEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, HWEdit, Terminal,
  Vcl.Samples.Spin, Vcl.WinXCtrls, fr_settings, lib_main;

const
 MSG_CLOSING_REQUST = '��������� �������?';

type

  TfrHWEdit = class(TForm)
    plButtons: TPanel;
    btnClose: TButton;
    btnSave: TButton;
    btnReset: TButton;
    ScrollBox: TScrollBox;
    plAccessControl: TPanel;
    lbAccessControl: TLabel;
    cbAccessControl: TComboBox;
    plBeep2: TPanel;
    lbBeep2: TLabel;
    cbBeep2Mode: TComboBox;
    plCanDriver: TPanel;
    lbCanDriverLabel: TLabel;
    cbCanDriver: TComboBox;
    plCardEnabledTimeout: TPanel;
    lbCardEnabledTimeoutLablel: TLabel;
    plIgnitionControlPowerRelay: TPanel;
    lbPowerRelayLabel: TLabel;
    cbIgnBreakRelay: TComboBox;
    plOperatorSessionTimeout: TPanel;
    lbOperatorSessionTimeout: TLabel;
    spOperatorSessionTimeout: TSpinEdit;
    plPowerOnSignal: TPanel;
    lbPowerOnSignal: TLabel;
    cbPowerOnSignal: TComboBox;
    plPowerRelay: TPanel;
    lbPowerRelay: TLabel;
    cbPowerRelay: TComboBox;
    plRelayModuleType: TPanel;
    lbRelayModuleType: TLabel;
    cbRelayModuleType: TComboBox;
    plRemoteModuleID: TPanel;
    lbRemoteModuleID: TLabel;
    spRemoteModuleID: TSpinEdit;
    plRFIDReadMode: TPanel;
    lbRFIDReadMode: TLabel;
    cbRFIDReadMode: TComboBox;
    plSignalRelay: TPanel;
    lbSignalRelayLabel: TLabel;
    cbSignalRelay: TComboBox;
    plSignalSourceCharge: TPanel;
    lbSignalSourceCharge: TLabel;
    cbSignalSourceCharge: TComboBox;
    plSignalSourceEngine: TPanel;
    lbSignalSourceEngine: TLabel;
    cbSignalSourceEngine: TComboBox;
    plSignalSourceIgnition: TPanel;
    lbSignalSourceIgnition: TLabel;
    cbSignalSourceIgnition: TComboBox;
    plSignalSourceLevel: TPanel;
    lbSignalSourceLevel: TLabel;
    cbSignalSourceLevel: TComboBox;
    plSignalSourceMech: TPanel;
    lbSignalSourceMech: TLabel;
    cbSignalSourceMech: TComboBox;
    plSignalSourceMove: TPanel;
    lbSignalSourceMove: TLabel;
    cbSignalSourceMove: TComboBox;
    plSignalSourceSpeed: TPanel;
    lbSignalSourceSpeed: TLabel;
    cbSignalSourceSpeed: TComboBox;
    plSignalSourceTurboTimer: TPanel;
    lbSignalSourceTurboTimer: TLabel;
    tsSignalSourceTurboTimer: TToggleSwitch;
    plSpeedSensorKoefficient: TPanel;
    lbSpeedSensorKoefficient: TLabel;
    plMassFactor: TPanel;
    lbMassFactor: TLabel;
    plMotionSensorCoefficient: TPanel;
    lbMotionSensorCoefficient: TLabel;
    plSignalMechBeep: TPanel;
    lbSignalMechBeep: TLabel;
    tgSignalMechBeep: TToggleSwitch;
    plAccelerometr: TPanel;
    lbAccelerometr: TLabel;
    cbAccel: TComboBox;
    plAccelTimeout: TPanel;
    lbAccelTimeout: TLabel;
    cbAccelTimeout: TComboBox;
    plDeviceProtocol: TPanel;
    lbDeviceProtocol: TLabel;
    spDeviceProtocol: TSpinEdit;
    plDeviceKoef: TPanel;
    lbDeviceKoef: TLabel;
    plMaxSpeed: TPanel;
    lbMaxSpeed: TLabel;
    spMaxSpeed: TSpinEdit;
    plSpeedLimitType: TPanel;
    plUsageMode: TPanel;
    lbSpeedLimitType: TLabel;
    cbSpeedLimitType: TComboBox;
    lbUsageMode: TLabel;
    cbUsageMode: TComboBox;
    edSpeedSensorKoefficient: TEdit;
    sbSpeedSensorKoefficient: TSpinButton;
    edMassFactor: TEdit;
    sbMassFactor: TSpinButton;
    edMotionSensorCoefficient: TEdit;
    SpinButton1: TSpinButton;
    edDeviceKoef: TEdit;
    sbDeviceKoef: TSpinButton;
    lbCardEnabled: TLabel;
    lbOperatorSeesion: TLabel;
    lbMaxSpeedLabel: TLabel;
    edCardEnabledTimeout: TEdit;
    sbCardEnabledTimeout: TSpinButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure sbSpeedSensorKoefficientDownClick(Sender: TObject);
    procedure sbSpeedSensorKoefficientUpClick(Sender: TObject);
    procedure sbMassFactorUpClick(Sender: TObject);
    procedure sbMassFactorDownClick(Sender: TObject);
    procedure SpinButton1DownClick(Sender: TObject);
    procedure SpinButton1UpClick(Sender: TObject);
    procedure sbDeviceKoefDownClick(Sender: TObject);
    procedure sbDeviceKoefUpClick(Sender: TObject);
    procedure edSpeedSensorKoefficientChange(Sender: TObject);
    procedure edMotionSensorCoefficientChange(Sender: TObject);
    procedure edDeviceKoefChange(Sender: TObject);
    procedure edMassFactorChange(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure edSpeedSensorKoefficientClick(Sender: TObject);
    procedure spRemoteModuleIDClick(Sender: TObject);
    procedure edMassFactorClick(Sender: TObject);
    procedure edMotionSensorCoefficientClick(Sender: TObject);
    procedure spMaxSpeedClick(Sender: TObject);
    procedure spOperatorSessionTimeoutClick(Sender: TObject);
    procedure spDeviceProtocolClick(Sender: TObject);
    procedure edDeviceKoefClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edCardEnabledTimeoutClick(Sender: TObject);
    procedure edCardEnabledTimeoutChange(Sender: TObject);
    procedure sbCardEnabledTimeoutDownClick(Sender: TObject);
    procedure sbCardEnabledTimeoutUpClick(Sender: TObject);
    procedure edCardEnabledTimeoutMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure spRemoteModuleIDMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edSpeedSensorKoefficientMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure edMassFactorMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edMotionSensorCoefficientMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure spDeviceProtocolMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edDeviceKoefMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure spOperatorSessionTimeoutMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure spMaxSpeedMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ScrollBoxMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure ScrollBoxMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure edCardEnabledTimeoutKeyPress(Sender: TObject; var Key: Char);
    procedure spRemoteModuleIDKeyPress(Sender: TObject; var Key: Char);
    procedure edSpeedSensorKoefficientKeyPress(Sender: TObject; var Key: Char);
    procedure edMassFactorKeyPress(Sender: TObject; var Key: Char);
    procedure edMotionSensorCoefficientKeyPress(Sender: TObject; var Key: Char);
    procedure spDeviceProtocolKeyPress(Sender: TObject; var Key: Char);
    procedure edDeviceKoefKeyPress(Sender: TObject; var Key: Char);
    procedure spOperatorSessionTimeoutKeyPress(Sender: TObject; var Key: Char);
    procedure spMaxSpeedKeyPress(Sender: TObject; var Key: Char);
    procedure edSpeedSensorKoefficientKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCardEnabledTimeoutKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edMassFactorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edMotionSensorCoefficientKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDeviceKoefKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    HardWare  : THWEdit;
    FConfBuf  : TConfig;
    FConfCurr : Tconfig;
    FConfSave : TConfig;
    settings  : TfrSettings;
    FChange   : Boolean;
    function createFormSettings(param : TWinControl; _val : TeditSpin):real;
    procedure closeFormSettings;
    procedure ParamsFilling;
    procedure ComboBoxLoad(var _combobox: TComboBox; val : byte);
    procedure changeEdit(val:TeditSpin);
    procedure setEditLimit(Edit: Tedit; min, max:real);
    procedure Save;
  public
    { Public declarations }
    procedure setHWSetting(_HWSettings : Tconfig);
    function  getHWSetting: Tconfig;
    function  getisChange:Boolean;
  end;

var
  frHWEdit: TfrHWEdit;

implementation

{$R *.dfm}

procedure TfrHWEdit.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrHWEdit.btnResetClick(Sender: TObject);
begin
  setHWSetting(FConfBuf);                                                       // ���������� ����������� ���������
end;

procedure TfrHWEdit.btnSaveClick(Sender: TObject);
begin
  try
    Save;
    FConfSave := HardWare.getHardWare;
  except on E: Exception do
    begin
      messageDlg('"�� ��������� ����" ������: ' + E.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      exit;
    end;
  end;

  FChange := True;
  close;
end;

procedure TfrHWEdit.changeEdit(val:TeditSpin);
var floatValue: Double;
begin
  floatValue := StrToFloat(val.edit.Text);
  floatValue := floatValue + val.offset;
  if (floatValue <= val.Min)  then floatValue := val.Min;
  if (floatValue >= val.Max ) then floatValue := val.Max;
  val.edit.Text := FloatToStr(floatValue);
end;

procedure TfrHWEdit.closeFormSettings;
begin
  if settings = nil then exit;

  settings.Close;
end;

procedure TfrHWEdit.ComboBoxLoad(var _combobox: TComboBox; val : byte);
begin
  _combobox.ItemIndex := _combobox.Items.IndexOfObject(TObject(val));
  if _combobox.ItemIndex = -1 then _combobox.ItemIndex := 0;                    // ���� �� ������ ����� ��������, �� �������� ������ �� ������
end;


function TfrHWEdit.createFormSettings(param : TWinControl; _val : TeditSpin) : real;
begin
  try
    settings      := TfrSettings.Create(nil);
    settings.Top  := self.Top  + param.Top  + 30;
    settings.Left := self.Left + 345 + 10;
    settings.setData(_val);
    settings.ShowModal;
    param.SetFocus;
  finally
    result := settings.getResult;
    settings.Free;
  end;
end;

procedure TfrHWEdit.edCardEnabledTimeoutChange(Sender: TObject);
begin
  setEditLimit(edCardEnabledTimeout, 0.1, 25.0);
end;

procedure TfrHWEdit.edCardEnabledTimeoutClick(Sender: TObject);
var val : TeditSpin;
    res : real;
begin
  val.Edit   := edCardEnabledTimeout;
  val.offset := 0.1;
  val.Min    := 1;
  val.Max    := 250;
  val.position :=  StrToFloat(edCardEnabledTimeout.Text);
  val.prescaler := 10;
//  val.Caption := Trim(lbCardEnabkedTimeout.Caption);
  res := createFormSettings(plCardEnabledTimeout, val);
  edCardEnabledTimeout.Text := FloatToStr(res);
end;

procedure TfrHWEdit.edCardEnabledTimeoutKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_UP then edCardEnabledTimeout.Text := (strToFloat(edCardEnabledTimeout.Text)+0.1).ToString;
  if key = VK_DOWN then edCardEnabledTimeout.Text := (strToFloat(edCardEnabledTimeout.Text)-0.1).ToString;
end;

procedure TfrHWEdit.edCardEnabledTimeoutKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = '+' then edCardEnabledTimeout.Text := (strToFloat(edCardEnabledTimeout.Text)+0.1).ToString;
  if key = '-' then edCardEnabledTimeout.Text := (strToFloat(edCardEnabledTimeout.Text)-0.1).ToString;

  key:=#0;
end;

procedure TfrHWEdit.edCardEnabledTimeoutMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var val : TeditSpin;
    res : real;
begin
  val.Edit   := edCardEnabledTimeout;
  val.offset := 0.1;
  val.Min    := 0.1;
  val.Max    := 250;
  val.position :=  StrToFloat(edCardEnabledTimeout.Text);
  val.prescaler := 10;
//  val.Caption := Trim(lbCardEnabkedTimeout.Caption);
  res := createFormSettings(plCardEnabledTimeout, val);
  edCardEnabledTimeout.Text := FloatToStr(res);
end;

procedure TfrHWEdit.edDeviceKoefChange(Sender: TObject);
begin
  setEditLimit(edDeviceKoef, 0.000 , 65.535);
end;


procedure TfrHWEdit.edDeviceKoefClick(Sender: TObject);
var val : TeditSpin;
    res : real;
begin
  val.Edit      := edDeviceKoef;
  val.Min       := 0;
  val.Max       := 65535;
  val.position  := StrToFloat(edDeviceKoef.Text);
  val.prescaler := 1000;
  val.Caption   := Trim(lbDeviceKoef.Caption);
  res := createFormSettings(plDeviceKoef, val);
  edDeviceKoef.Text := FloatToStr(res);
end;

procedure TfrHWEdit.edDeviceKoefKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up   then edDeviceKoef.Text := (strToFloat(edDeviceKoef.Text)+0.1).ToString;
  if Key = vk_down then edDeviceKoef.Text := (strToFloat(edDeviceKoef.Text)-0.1).ToString;
end;

procedure TfrHWEdit.edDeviceKoefKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '+' then edDeviceKoef.Text := (strToFloat(edDeviceKoef.Text)+0.01).ToString;
  if key = '-' then edDeviceKoef.Text := (strToFloat(edDeviceKoef.Text)-0.01).ToString;

  key := #0;
end;

procedure TfrHWEdit.edDeviceKoefMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var val : TeditSpin;
    res : real;
begin
  val.Edit      := edDeviceKoef;
  val.Min       := 0;
  val.Max       := 65534;
  val.position  := StrToFloat(edDeviceKoef.Text);
  val.prescaler := 1000;
  val.offset    := 0.01;
  val.Caption   := Trim(lbDeviceKoef.Caption);
  res := createFormSettings(plDeviceKoef, val);
  edDeviceKoef.Text := FloatToStr(res);
end;

procedure TfrHWEdit.edMassFactorChange(Sender: TObject);
begin
  setEditLimit(edMassFactor, 0.1, 4.0);
end;

procedure TfrHWEdit.edMassFactorClick(Sender: TObject);
var val : TeditSpin;
    res : real;
begin
  val.Edit      := edMassFactor;
  val.offset    := -0.1;
//  val.Min       := 0;
  val.Min       := 0.1;
  val.Max       := 40;
  val.position  := StrToFloat(edMassFactor.Text);
  val.prescaler := 10;
  val.Caption   := Trim(lbMassFactor.Caption);

  res := createFormSettings(plMassFactor, val);
  edMassFactor.Text := FloatToStr(res);
end;

procedure TfrHWEdit.edMassFactorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up   then edMassFactor.Text := (strToFloat(edMassFactor.Text)+0.1).ToString;
  if Key = vk_down then edMassFactor.Text := (strToFloat(edMassFactor.Text)-0.1).ToString;
end;

procedure TfrHWEdit.edMassFactorKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '+' then edMassFactor.Text := (strToFloat(edMassFactor.Text)+0.1).ToString;
  if key = '-' then edMassFactor.Text := (strToFloat(edMassFactor.Text)-0.1).ToString;

  key:=#0;
end;

procedure TfrHWEdit.edMassFactorMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var val : TeditSpin;
    res : real;
begin
  val.Edit      := edMassFactor;
  val.offset    := -0.1;
  val.Min       := 0.1;
  val.Max       := 40;
  val.position  := StrToFloat(edMassFactor.Text);
  val.prescaler := 10;
  val.Caption   := Trim(lbMassFactor.Caption);

  res := createFormSettings(plMassFactor, val);
  edMassFactor.Text := FloatToStr(res);
end;

procedure TfrHWEdit.edMotionSensorCoefficientChange(Sender: TObject);
begin
  setEditLimit(edMotionSensorCoefficient, 0.1, 4.0);
end;

procedure TfrHWEdit.edMotionSensorCoefficientClick(Sender: TObject);
var val : TeditSpin;
    res : real;
begin
  val.Edit      := edMotionSensorCoefficient;
  val.Min       := 0.1;
  val.Max       := 40;
  val.position  := StrToFloat(edMotionSensorCoefficient.Text);
  val.prescaler := 10;
  val.Caption   := Trim(lbMotionSensorCoefficient.Caption);

  res := createFormSettings(plMotionSensorCoefficient, val);
  edMotionSensorCoefficient.Text := FloatToStr(res);
end;

procedure TfrHWEdit.edMotionSensorCoefficientKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_up   then edMotionSensorCoefficient.Text := (strToFloat(edMotionSensorCoefficient.Text)+0.1).ToString;
  if Key = vk_down then edMotionSensorCoefficient.Text := (strToFloat(edMotionSensorCoefficient.Text)-0.1).ToString;
end;

procedure TfrHWEdit.edMotionSensorCoefficientKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = '+' then edMotionSensorCoefficient.Text := (strToFloat(edMotionSensorCoefficient.Text)+0.1).ToString;
  if key = '-' then edMotionSensorCoefficient.Text := (strToFloat(edMotionSensorCoefficient.Text)-0.1).ToString;


  key:=#0;
end;

procedure TfrHWEdit.edMotionSensorCoefficientMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var val : TeditSpin;
    res : real;
begin
  val.Edit      := edMotionSensorCoefficient;
  val.offset    := 0.1;
  val.Min       := 0.1;
  val.Max       := 40;
  val.position  := StrToFloat(edMotionSensorCoefficient.Text);
  val.prescaler := 10;
  val.Caption   := Trim(lbMotionSensorCoefficient.Caption);

  res := createFormSettings(plMotionSensorCoefficient, val);
  edMotionSensorCoefficient.Text := FloatToStr(res);
end;

procedure TfrHWEdit.edSpeedSensorKoefficientChange(Sender: TObject);
begin
  setEditLimit(edSpeedSensorKoefficient, 0, 65.534);
end;

procedure TfrHWEdit.edSpeedSensorKoefficientClick(Sender: TObject);
var val : TeditSpin;
    res : real;
begin
  val.Edit   := edSpeedSensorKoefficient;
  val.offset := -0.001;
  val.Min    := 0.000;
  val.Max    := 65534;
  val.position :=  StrToFloat(edSpeedSensorKoefficient.Text);
  val.prescaler := 1000;
  val.Caption := Trim(lbSpeedSensorKoefficient.Caption);
  res := createFormSettings(plSpeedSensorKoefficient, val);
  edSpeedSensorKoefficient.Text := FloatToStr(res);
end;

procedure TfrHWEdit.edSpeedSensorKoefficientKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then edSpeedSensorKoefficient.Text := (strToFloat(edSpeedSensorKoefficient.Text)+0.1).ToString;
  if Key = VK_DOWN then edSpeedSensorKoefficient.Text := (strToFloat(edSpeedSensorKoefficient.Text)-0.1).ToString;
end;

procedure TfrHWEdit.edSpeedSensorKoefficientKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = '+' then edSpeedSensorKoefficient.Text := (strToFloat(edSpeedSensorKoefficient.Text)+0.01).ToString;
  if key = '-' then edSpeedSensorKoefficient.Text := (strToFloat(edSpeedSensorKoefficient.Text)-0.01).ToString;


  key:=#0;
end;

procedure TfrHWEdit.edSpeedSensorKoefficientMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var val : TeditSpin;
    res : real;
begin
  val.Edit   := edSpeedSensorKoefficient;
  val.offset := 0.001;
  val.Min    := 0.000;
  val.Max    := 65534;
  val.position :=  StrToFloat(edSpeedSensorKoefficient.Text);
  val.prescaler := 1000;
  val.Caption := Trim(lbSpeedSensorKoefficient.Caption);
  res := createFormSettings(plSpeedSensorKoefficient, val);
  edSpeedSensorKoefficient.Text := FloatToStr(res);
end;

procedure TfrHWEdit.FormActivate(Sender: TObject);
begin
  ScrollBox.VertScrollBar.Position := 0;
  FChange := false;
end;

procedure TfrHWEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Save;

  if StructuresEqual(FConfCurr, FConfSave)
  then exit;                                                                    // ���� ����������� ������������ ����� �����������


  if MessageDlg(MSG_CLOSING_REQUST, mtConfirmation, [mbyes, mbNo], 0 ) = mrNo
  then
    begin
      setHWSetting(FConfBuf);                                                   // ���������� ����������� ���������
      Save;
    end
  else FChange := True;

  CanClose := true;
end;

procedure TfrHWEdit.FormCreate(Sender: TObject);
begin
  ParamsFilling;
end;

function TfrHWEdit.getHWSetting: Tconfig;
begin
  result := HardWare.getHardWare;
end;

function TfrHWEdit.getisChange: Boolean;
begin
  result := FChange;
end;

procedure TfrHWEdit.ParamsFilling;
begin
  cbAccessControl.Items.AddObject(ACCESS_MODE_EXT_KEY,      TObject(am_OFF));
  cbAccessControl.Items.AddObject(ACCESS_MODE_ANY_CARD,     TObject(am_Any_Card));
  cbAccessControl.Items.AddObject(ACCESS_MODE_AUTHED_CARD,  TObject(am_Only_admitted));
  cbAccessControl.Items.AddObject(ACCESS_MODE_ONLY_SERVICE, TObject(am_Only_service));
  cbAccessControl.Items.AddObject(ACCESS_MODE_BLOCK,        TObject(am_Nobody));

  cbRelayModuleType.Items.AddObject(RELAY_MODULE_TYPE_V2, TObject(Version_2));
  cbRelayModuleType.Items.AddObject(RELAY_MODULE_TYPE_V3, TObject(Version_3));
  cbRelayModuleType.Items.AddObject(RELAY_MODULE_TYPE_V4, TObject(Version_4));

  cbBeep2Mode.Items.AddObject(IGNITION_CONTROL_DISABLED,     TObject(b2_disabled));
  cbBeep2Mode.Items.AddObject(IGNITION_CONTROL_BEEP1,        TObject(b2_beep1));
  cbBeep2Mode.Items.AddObject(IGNITION_CONTROL_SPEED_ALARM,  TObject(b2_speed_alarm));
  cbBeep2Mode.Items.AddObject(IGNITION_CONTROL_SPEED,        TObject(b2_speed));
  cbBeep2Mode.Items.AddObject(IGNITION_CONTROL_ALARM,        TObject(b2_alarm));
  cbBeep2Mode.Items.AddObject(IGNITION_CONTROL_ALWAYS_ON,    TObject(b2_always_on));
  cbBeep2Mode.Items.AddObject(IGNITION_CONTROL_SIGNAL_RELAY, TObject(b2_signal_relay));

  cbCanDriver.Items.AddObject(CAN_DRIVER_DISABLED, TObject(can_disabled));
  cbCanDriver.Items.AddObject(CAN_DRIVER_TEST,     TObject(can_test));
  cbCanDriver.Items.AddObject(CAN_DRIVER_PASSIVE,  TObject(can_file_passive));
  cbCanDriver.Items.AddObject(CAN_DRIVER_ACTIVE,   TObject(can_file_active));

  cbIgnBreakRelay.Items.AddObject(BREAK_RELAY_ON_OFF,    TObject(br_OnOff));
  cbIgnBreakRelay.Items.AddObject(BREAK_RELAY_TILL_IGN,  TObject(br_impulse_till_IGN));
  cbIgnBreakRelay.Items.AddObject(BREAK_RELAY_IMPULS_05, TObject(br_impulse_05s));
  cbIgnBreakRelay.Items.AddObject(BREAK_RELAY_IMPULS_1,  TObject(br_impuls_1s));
  cbIgnBreakRelay.Items.AddObject(BREAK_RELAY_IMPULS_2,  TObject(br_impuls_2s));
  cbIgnBreakRelay.Items.AddObject(BREAK_RELAY_IMPULS_3,  TObject(br_impuls_3s));
  cbIgnBreakRelay.Items.AddObject(BREAK_RELAY_DISABLED,  TObject(br_disabled));

  cbPowerRelay.Items.AddObject(POWER_RELAY_DISABLED_EXT, TObject(pr_External_signal));
  cbPowerRelay.Items.AddObject(POWER_RELAY_DISABLED_INT, TObject(pr_Internal_signal));
  cbPowerRelay.Items.AddObject(POWER_RELAY_ENABLED_HOLD, TObject(pr_Power_hold_mode));
  cbPowerRelay.Items.AddObject(POWER_RELAY_ENABLED_NC,   TObject(pr_NC));

  cbSignalRelay.Items.AddObject(SIGNAL_RELAY_DISABLED,      TObject(sr_Disabled));
  cbSignalRelay.Items.AddObject(SIGNAL_RELAY_IGN,           TObject(sr_IGN));
  cbSignalRelay.Items.AddObject(SIGNAL_RELAY_INV_IGN,       TObject(sr_INV_IGN));
  cbSignalRelay.Items.AddObject(SIGNAL_RELAY_INV_IGN_DELAY, TObject(sr_INV_IGN_DELAY));
  cbSignalRelay.Items.AddObject(SIGNAL_RELAY_SPEED_ALARM,   TObject(sr_Speed_Alartm));
  cbSignalRelay.Items.AddObject(SIGNAL_RELAY_SPEED,         TObject(sr_Speed));
  cbSignalRelay.Items.AddObject(SIGNAL_RELAY_ALARM,         TObject(sr_Alarm));

  cbRFIDReadMode.Items.AddObject(RFID_WIEGAND_SINGLE,  TObject(rf_wiegand_single));
  cbRFIDReadMode.Items.AddObject(RFID_WIRE_SINGLE,     TObject(rf_wire_single));
  cbRFIDReadMode.Items.AddObject(RFID_WIRE_CONTINIOUS, TObject(rf_wire_continious));

  cbPowerOnSignal.Items.AddObject(POWER_SIGNAL_ALWAYS_ON, TObject(ps_always_on));
  cbPowerOnSignal.Items.AddObject(POWER_SIGNAL_IGN_IN,    TObject(ps_ign_in));
  cbPowerOnSignal.Items.AddObject(POWER_SIGNAL_CAN_IGN,   TObject(ps_can_ign));
  cbPowerOnSignal.Items.AddObject(POWER_SIGNAL_XIN1,      TObject(ps_xin1));
  cbPowerOnSignal.Items.AddObject(POWER_SIGNAL_XIN2,      TObject(ps_xin2));
  cbPowerOnSignal.Items.AddObject(POWER_SIGNAL_AIN,       TObject(ps_ain));

  cbSignalSourceIgnition.Items.AddObject(IGN_SIGNAL_EXT_IGN,     TObject(iss_ext_IGN));
  cbSignalSourceIgnition.Items.AddObject(IGN_SIGNAL_EXT_IGN_REL, TObject(iss_ext_IGN_REL));
  cbSignalSourceIgnition.Items.AddObject(IGN_SIGNAL_CAN,         TObject(iss_Can));
  cbSignalSourceIgnition.Items.AddObject(IGN_SIGANL_XIN1,        TObject(iss_XIN1));
  cbSignalSourceIgnition.Items.AddObject(IGN_SIGNAL_XIN2,        TObject(iss_XIN2));
  cbSignalSourceIgnition.Items.AddObject(IGN_SIGNAL_IGN_S,       TObject(iss_IGN_S));
  cbSignalSourceIgnition.Items.AddObject(IGN_SIGNAL_AIN,         TObject(iss_AIN));

  cbSignalSourceEngine.Items.AddObject(Engine_SIGNAL_Disabled,   TObject(sse_disabled));
  cbSignalSourceEngine.Items.AddObject(Engine_SIGNAL_CAN,        TObject(sse_CAN));
  cbSignalSourceEngine.Items.AddObject(Engine_SIGNAL_XIN1,       TObject(sse_XIN1));
  cbSignalSourceEngine.Items.AddObject(Engine_SIGNAL_XIN2,       TObject(sse_XIN2));
  cbSignalSourceEngine.Items.AddObject(Engine_SIGNAL_XIN3,       TObject(sse_XIN3));
  cbSignalSourceEngine.Items.AddObject(Engine_SIGNAL_IGN_S,      TObject(sse_IGN_S));
  cbSignalSourceEngine.Items.AddObject(Engine_SIGNAL_AIN,        TObject(sse_AIN));
  cbSignalSourceEngine.Items.AddObject(Engine_SIGNAL_IGN_STATE,  TObject(see_IGN_STATE));

  cbSignalSourceMove.Items.AddObject(MOVE_SIGNAL_DIABLED,  TObject(tss_Disabled));
  cbSignalSourceMove.Items.AddObject(MOVE_SIGNAL_MOTION_S, TObject(tss_Motion_s));
  cbSignalSourceMove.Items.AddObject(MOVE_SIGNAL_CAN,      TObject(tss_CAN));
  cbSignalSourceMove.Items.AddObject(MOVE_SIGNAL_XIN1,     TObject(tss_XIN1));
  cbSignalSourceMove.Items.AddObject(MOVE_SIGNAL_XIN2,     TObject(tss_XIN2));
  cbSignalSourceMove.Items.AddObject(MOVE_SIGNAL_XIN3,     TObject(tss_XIN3));
  cbSignalSourceMove.Items.AddObject(MOVE_SIGNAL_IGN_S,    TObject(tss_IGN_S));
  cbSignalSourceMove.Items.AddObject(MOVE_SIGNAL_AIN,      TObject(tss_AIN));
  cbSignalSourceMove.Items.AddObject(MOVE_SIGNAL_SPEED,    TObject(tss_Speed));
  cbSignalSourceMove.Items.AddObject(MOVE_SIGNAL_N_XIN1,   TObject(tss_N_XIN1));
  cbSignalSourceMove.Items.AddObject(MOVE_SIGNAL_N_XIN2,   TObject(tss_N_XIN2));

  cbSignalSourceMech.Items.AddObject(MECH_SIGNAL_DISABLED, TObject(tsm_Disabled));
  cbSignalSourceMech.Items.AddObject(MECH_SIGNAL_MOTION_S, TObject(tsm_Motion_sensor));
  cbSignalSourceMech.Items.AddObject(MECH_SIGNAL_CAN,      TObject(tsm_CAN));
  cbSignalSourceMech.Items.AddObject(MECH_SIGNAL_IN1,      TObject(tsm_IN1));
  cbSignalSourceMech.Items.AddObject(MECH_SIGNAL_IN2,      TObject(tsm_IN2));
  cbSignalSourceMech.Items.AddObject(MECH_SIGNAL_IN3,      TObject(tsm_IN3));
  cbSignalSourceMech.Items.AddObject(MECH_SIGNAL_IGN_S,    TObject(tsm_IGN_S));
  cbSignalSourceMech.Items.AddObject(MECH_SIGNAL_AIN,      TObject(tsm_AIN));
  cbSignalSourceMech.Items.AddObject(MECH_SIGNAL_N_XIN1,   TObject(tsm_N_XIN1));
  cbSignalSourceMech.Items.AddObject(MECH_SIGNAL_N_XIN2,   TObject(tsm_N_XIN2));

  cbSignalSourceSpeed.Items.AddObject(SPEED_SIGNAL_DISABLED,  TObject(sss_disabled));
  cbSignalSourceSpeed.Items.AddObject(SPEED_SIGNAL_CAN,       TObject(sss_Can));
  cbSignalSourceSpeed.Items.AddObject(SPEED_SIGNAL_AIN1,      TObject(sss_AIN1));
  cbSignalSourceSpeed.Items.AddObject(SPEED_SIGNAL_AIN2,      TObject(sss_AIN2));
  cbSignalSourceSpeed.Items.AddObject(SPEED_SIGNAL_AIN3,      TObject(sss_AIN3));
  cbSignalSourceSpeed.Items.AddObject(SPEED_SIGNAL_DIN1,      TObject(sss_DIN1));
  cbSignalSourceSpeed.Items.AddObject(SPEED_SIGNAL_DIN2,      TObject(sss_DIN2));
  cbSignalSourceSpeed.Items.AddObject(SPEED_SIGNAL_AIN2_AIN1, TObject(sss_AIN2_AIN1));

  cbSignalSourceLevel.Items.AddObject(LEVEL_SIGNAL_DISABLED, TObject(ssl_Disabled));
  cbSignalSourceLevel.Items.AddObject(LEVEL_SIGNAL_CAN,      TObject(ssl_CAN));
  cbSignalSourceLevel.Items.AddObject(LEVEL_SIGNAL_EXT,      TObject(ssl_Ext_device));
  cbSignalSourceLevel.Items.AddObject(LEVEL_SIGNAL_BAT_12v,  TObject(ssl_BAT_12v));
  cbSignalSourceLevel.Items.AddObject(LEVEL_SIGNAL_BAT_24v,  TObject(ssl_BAT_24v));
  cbSignalSourceLevel.Items.AddObject(LEVEL_SIGNAL_BAT_48v,  TObject(ssl_BAT_48v));
  cbSignalSourceLevel.Items.AddObject(LEVEL_SIGNAL_BAT_72v,  TObject(ssl_BAT_72v));
  cbSignalSourceLevel.Items.AddObject(LEVEL_SIGNAL_BAT_80v,  TObject(ssl_BAT_80v));

  cbSignalSourceCharge.Items.AddObject(CHARGE_SIGNAL_DISABLED, TObject(ssc_Disabled));
  cbSignalSourceCharge.Items.AddObject(CHARGE_SIGNAL_CAN,      TObject(ssc_CAN));
  cbSignalSourceCharge.Items.AddObject(CHARGE_SIGNAL_XIN1,     TObject(ssc_XIN1));
  cbSignalSourceCharge.Items.AddObject(CHARGE_SIGNAL_XIN2,     TObject(ssc_XIN2));
  cbSignalSourceCharge.Items.AddObject(CHARGE_SIGNAL_XIN3,     TObject(ssc_XIN3));
  cbSignalSourceCharge.Items.AddObject(CHARGE_SIGNAL_IGN_S,    TObject(ssc_IGN_S));
  cbSignalSourceCharge.Items.AddObject(CHARGE_SIGNAL_AIN,      TObject(ssc_AIN));
  cbSignalSourceCharge.Items.AddObject(CHARGE_SIGNAL_N_XIN1,   TObject(ssc_N_XIN1));
  cbSignalSourceCharge.Items.AddObject(CHARGE_SIGNAL_N_XIN2,   TObject(ssc_N_XIN2));


  cbAccel.Items.AddObject(ACCEL_TYPE_DISABLED, TObject(al_disabled));
  cbAccel.Items.AddObject(ACCEL_TYPE_INTERNAL, TObject(al_internal));
  cbAccel.Items.AddObject(ACCEL_TYPE_EXTERNAL, TObject(al_external));
  cbAccel.Items.AddObject(ACCEL_TYPE_AUTO,     TObject(al_auto));

  cbAccelTimeout.Items.AddObject(RELAY_POWER_TIMEOUT_48h, TObject(pt_48h));
  cbAccelTimeout.Items.AddObject(RELAY_POWER_TIMEOUT_24h, TObject(pt_24h));
  cbAccelTimeout.Items.AddObject(RELAY_POWER_TIMEOUT_12h, TObject(pt_12h));
  cbAccelTimeout.Items.AddObject(RELAY_POWER_TIMEOUT_6h,  TObject(pt_6h));
  cbAccelTimeout.Items.AddObject(RELAY_POWER_TIMEOUT_3h,  TObject(pt_3h));
  cbAccelTimeout.Items.AddObject(RELAY_POWER_TIMEOUT_2h,  TObject(pt_2h));
  cbAccelTimeout.Items.AddObject(RELAY_POWER_TIMEOUT_1h,  TObject(pt_1h));
  cbAccelTimeout.Items.AddObject(RELAY_POWER_TIMEOUT_30m, TObject(pt_30m));
  cbAccelTimeout.Items.AddObject(RELAY_POWER_TIMEOUT_15m, TObject(pt_15m));
  cbAccelTimeout.Items.AddObject(RELAY_POWER_TIMEOUT_10m, TObject(pt_10m));
  cbAccelTimeout.Items.AddObject(RELAY_POWER_TIMEOUT_05m, TObject(pt_5m));
  cbAccelTimeout.Items.AddObject(RELAY_POWER_TIMEOUT_off, TObject(pt_disabled));

  cbSpeedLimitType.Items.AddObject(SPEED_LIMIT_DISABLED,    TObject(sm_disabled));
  cbSpeedLimitType.Items.AddObject(SPEED_LIMIT_BEEP_ONLY,   TObject(sm_beepOnly));
  cbSpeedLimitType.Items.AddObject(SPEED_LIMIT_BLOCK_PAUSE, TObject(sm_block_P));
  cbSpeedLimitType.Items.AddObject(SPEED_LIMIT_FULL_BLOCK,  TObject(sm_full_B));

  cbUsageMode.Items.AddObject(USAGE_MODE_EXPLOATATION,  TObject(um_explotation));
  cbUsageMode.Items.AddObject(USAGE_MODE_SERVICE,       TObject(um_service));
  cbUsageMode.Items.AddObject(USAGE_MODE_MAINTENANCE,   TObject(um_maintenance));
  cbUsageMode.Items.AddObject(USAGE_MODE_REPAIR,        TObject(um_repair));
  cbUsageMode.Items.AddObject(USAGE_MODE_CONSERVATION,  TObject(um_conservation));
end;


procedure TfrHWEdit.Save;
var buf : word;
begin
  HardWare.setAccessMode(TypeAccessMode(cbAccessControl.Items.Objects[cbAccessControl.ItemIndex]));
  HardWare.setRelayModuleType(TypeRelayModuleType(cbRelayModuleType.Items.Objects[cbRelayModuleType.ItemIndex]));
  HardWare.setBeep2(TypeBeep2(cbBeep2Mode.Items.Objects[cbBeep2Mode.ItemIndex]));
  HardWare.setCanDriver(TypeCanDriver(cbCanDriver.Items.Objects[cbCanDriver.ItemIndex]));
  HardWare.setOperatorSessionTimeout(spOperatorSessionTimeout.Value);
  HardWare.setBreakRelay(TypeIgnBreakRelay(cbIgnBreakRelay.Items.Objects[cbIgnBreakRelay.ItemIndex]));

  HardWare.setPowerRelay(TypePowerRelay(cbPowerRelay.Items.Objects[cbPowerRelay.ItemIndex]));
  HardWare.setSignalRelay(TypeSignalRelay(cbSignalRelay.Items.Objects[cbSignalRelay.ItemIndex]));
  HardWare.setRfidReadMode(TypeRFIDReadMode(cbRFIDReadMode.Items.Objects[cbRFIDReadMode.ItemIndex]));
  HardWare.setRemoteModuleID(spRemoteModuleID.Value);
  HardWare.setPowerOnSignal(TypePowerSignal(cbPowerOnSignal.Items.Objects[cbPowerOnSignal.ItemIndex]));
  HardWare.setSignalSourceIgnition(TypeSignalSourceIGN(cbSignalSourceIgnition.Items.Objects[cbSignalSourceIgnition.ItemIndex]));
  HardWare.setSignalSourceEngine(TypeSignalSourceEngine(cbSignalSourceEngine.Items.Objects[cbSignalSourceEngine.ItemIndex]));
  HardWare.setSignalSourceMech(TypeSignalSourceMech(cbSignalSourceMech.Items.Objects[cbSignalSourceMech.ItemIndex]));
  HardWare.setSignalSourceSpeed(TypeSignalSourceSpeed(cbSignalSourceSpeed.Items.Objects[cbSignalSourceSpeed.ItemIndex]));


//  HardWare.setCardEnabledTimeout(spCardEnabkedTimeout.Value);
 try
    HardWare.setCardEnabledTimeout(round(StrToFloat(edCardEnabledTimeout.Text)*10));
  except
    on EConvertError do
      ShowMessage('���������� ��������������� � ����� � ��������� ������');
  end;

  //  HardWare.setSpeedSensorKoefficient(spSpeedSensorKoefficient.Value);
  try
    HardWare.setSpeedSensorKoefficient(round(StrToFloat(edSpeedSensorKoefficient.Text)*1000));
  except
    on EConvertError do
      ShowMessage('���������� ��������������� � ����� � ��������� ������');
  end;
//  Label1.Caption :=  FloatToStr(buf);

  HardWare.setSignalSourceLevel(TypeSignalSourceLevel(cbSignalSourceLevel.Items.Objects[cbSignalSourceLevel.ItemIndex]));
  HardWare.setSignalSourceCharge(TypeSignalSourceCharge(cbSignalSourceCharge.Items.Objects[cbSignalSourceCharge.ItemIndex]));

  HardWare.setSignalSourceTurboTimer(ttOFF);
  if tsSignalSourceTurboTimer.State = tssOn
  then HardWare.setSignalSourceTurboTimer(ttON);


  HardWare.setSignalSourceMove(TypeSingalSourceMove(cbSignalSourceMove.Items.Objects[cbSignalSourceMove.ItemIndex]));
//  HardWare.setMassFactor(spMassFactor.Value);
  try
    HardWare.setMassFactor(round(StrToFloat(edMassFactor.Text)*10));
    // ����������� floatValue � ����� ����
  except
    on EConvertError do
      ShowMessage('���������� ��������������� � ����� � ��������� ������');
  end;


//  HardWare.setMotionSensorCoefficient(spMotionSensorCoefficient.Value);


  try
    HardWare.setMotionSensorCoefficient(round(StrToFloat(edMotionSensorCoefficient.Text)*10));
    // ����������� floatValue � ����� ����
  except
    on EConvertError do
      ShowMessage('���������� ��������������� � ����� � ��������� ������');
  end;


  HardWare.setSignalMechBeep(FALSE);
  if tgSignalMechBeep.State = tssOn
  then HardWare.setSignalMechBeep(TRUE);

  HardWare.setAccelerometr(TypeAccel(cbAccel.Items.Objects[cbAccel.ItemIndex]));
  HardWare.setAccelTimeout(Type12vPowerOffTimeout(cbAccelTimeout.Items.Objects[cbAccelTimeout.ItemIndex]));
  HardWare.setDeviceProtocol(spDeviceProtocol.Value);

//  HardWare.setExtDeviceCoefficient(spDeviceKoef.Value);
    try
      buf := round(StrToFloat(edDeviceKoef.Text)*1000);
      HardWare.setExtDeviceCoefficient(buf);
    // ����������� floatValue � ����� ����
  except
    on EConvertError do
      ShowMessage('���������� ��������������� � ����� � ��������� ������');
  end;

  HardWare.setMaxSpeed(spMaxSpeed.Value);

  HardWare.setSpeedModeType(TypeSpeedMode(cbSpeedLimitType.Items.Objects[cbSpeedLimitType.ItemIndex]));
  HardWare.setUsageMode(TypeUsageMode(cbUsageMode.Items.Objects[cbUsageMode.ItemIndex]));
  FConfCurr := HardWare.getHardWare;
end;

procedure TfrHWEdit.setEditLimit(Edit: Tedit; min, max: real);
begin
  try
    if StrToFloat(Edit.Text) >= max then edit.Text := FloatToStr(max);
    if StrToFloat(Edit.Text) <= min then edit.Text := FloatToStr(min);
  except
//    on EConvertError do
//      ShowMessage('���������� ��������������� � ����� � ��������� ������');
  end;
end;

procedure TfrHWEdit.setHWSetting(_HWSettings: Tconfig);
begin
  HardWare := THWEdit.Create;
  HardWare.setHWSettings(_HWSettings);

  FConfBuf  := _HWSettings;                                                     // ��������� ����������� ��������� (��� ����������� ��������)
  FConfSave := _HWSettings;                                                     // ��� �������� �� ��������� ����� ���������

  ComboBoxLoad(cbAccessControl,        HardWare.getAccessMode);
  ComboBoxLoad(cbPowerRelay,           HardWare.getPowerRelay);
  ComboBoxLoad(cbBeep2Mode,            HardWare.getIgnitionControlBeep2);
  ComboBoxLoad(cbCanDriver,            HardWare.getCanDriver);
  ComboBoxLoad(cbIgnBreakRelay,        HardWare.getBreakRelay);
  ComboBoxLoad(cbRelayModuleType,      HardWare.getRelayModuleType);
  ComboBoxLoad(cbSignalRelay,          HardWare.getSignalRelay);
  ComboBoxLoad(cbRFIDReadMode,         HardWare.getRFIDReadMode);
  ComboBoxLoad(cbPowerOnSignal,        HardWare.getPowerOnSignal);
  ComboBoxLoad(cbSignalSourceIgnition, HardWare.getSignalSourceIgnition);
  ComboBoxLoad(cbSignalSourceEngine,   HardWare.getSignalSourceEngine);
  ComboBoxLoad(cbSignalSourceMove,     HardWare.getSignalSourceMove);
  ComboBoxLoad(cbSignalSourceMech,     HardWare.getSignalSourceMech);
  ComboBoxLoad(cbSignalSourceSpeed,    HardWare.getSignalSourceSpeed);
  ComboBoxLoad(cbSignalSourceLevel,    HardWare.getSignalSourceLevel);
  ComboBoxLoad(cbSignalSourceCharge,   HardWare.getSignalSourceCharge);
  ComboBoxLoad(cbAccel,                HardWare.getAccelerometr);
  ComboBoxLoad(cbAccelTimeout,         HardWare.getAccelTimeout);
  ComboBoxLoad(cbSpeedLimitType,       HardWare.getSpeedLimitType);
  ComboBoxLoad(cbUsageMode,            HardWare.getUsegeMode);

  tsSignalSourceTurboTimer.State := tssOFF;
  if HardWare.getSignalSourceTurboTimer
  then tsSignalSourceTurboTimer.State := tssOn;

//  spCardEnabledTimeout.Value      := HardWare.getCardEnabledTimeout;
  edCardEnabledTimeout.Text       := FloatToStr(HardWare.getCardEnabledTimeout/10);
  spOperatorSessionTimeout.value  := HardWare.getOperatorSessionTimeout;
  spRemoteModuleID.Value          := HardWare.getRemoteModuleID;
//  spSpeedSensorKoefficient.Value  := HardWare.getSpeedSensorKoefficient;
  edSpeedSensorKoefficient.text   := FloatToStr(HardWare.getSpeedSensorKoefficient/1000);
//  spMassFactor.Value              := HardWare.getMassFactor;
  edMassFactor.text               := FloatToStr(HardWare.getMassFactor/10);
//  spMotionSensorCoefficient.Value := HardWare.getMotionSensorCoefficient;
  edMotionSensorCoefficient.Text  := FloatToStr(HardWare.getMotionSensorCoefficient/10);
  spDeviceProtocol.Value          := HardWare.getDeviceProtocol;
//  spDeviceKoef.Value              := HardWare.getExtDeviceCoefficient;
  edDeviceKoef.Text               := FloatToStr(HardWare.getExtDeviceCoefficient/1000);
  spMaxSpeed.Value                := HardWare.getMaxSpeed;

  tgSignalMechBeep.State := tssOFF;
  if HardWare.getSignalMechBeep
  then tgSignalMechBeep.State := tssOn;

end;

procedure TfrHWEdit.spDeviceProtocolClick(Sender: TObject);
var val : TeditSpin;
    res : real;
begin
  val.Min       := spDeviceProtocol.MinValue;
  val.Max       := spDeviceProtocol.MaxValue;
  val.position  := spDeviceProtocol.Value;
  val.prescaler := 1;
  val.Caption   := Trim(lbDeviceProtocol.Caption);
  res := createFormSettings(plDeviceProtocol, val);
  spDeviceProtocol.Value := round(res);
end;

procedure TfrHWEdit.spDeviceProtocolKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '+' then spDeviceProtocol.Value := spDeviceProtocol.Value+1;
  if key = '-' then spDeviceProtocol.Value := spDeviceProtocol.Value-1;

  if key = #24 then spDeviceProtocol.Value := spDeviceProtocol.Value+1;
  if key = #25 then spDeviceProtocol.Value := spDeviceProtocol.Value-1;

  key:=#0;
end;

procedure TfrHWEdit.spDeviceProtocolMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var val : TeditSpin;
    res : real;
begin
  val.Min       := spDeviceProtocol.MinValue;
  val.Max       := spDeviceProtocol.MaxValue;
  val.position  := spDeviceProtocol.Value;
  val.offset    := 1;
  val.prescaler := 1;
  val.Caption   := Trim(lbDeviceProtocol.Caption);
  res := createFormSettings(plDeviceProtocol, val);
  spDeviceProtocol.Value := round(res);
end;
procedure TfrHWEdit.SpinButton1DownClick(Sender: TObject);
var val : TeditSpin;
begin
  val.Edit   := edMotionSensorCoefficient;
  val.offset := -0.1;
  val.Min    := 0.1;
  val.Max    := 4.0;
  changeEdit(val);
end;

procedure TfrHWEdit.SpinButton1UpClick(Sender: TObject);
var val : TeditSpin;
begin
  val.Edit   := edMotionSensorCoefficient;
  val.offset := 0.1;
  val.Min    := 0.1;
  val.Max    := 4.0;
  changeEdit(val);
end;



procedure TfrHWEdit.sbCardEnabledTimeoutDownClick(Sender: TObject);
var val : TeditSpin;
begin
  val.Edit   := edCardEnabledTimeout;
  val.offset := -0.1;
  val.Min    := 0.1;
  val.Max    := 25.0;
  changeEdit(val);
end;

procedure TfrHWEdit.sbCardEnabledTimeoutUpClick(Sender: TObject);
var val : TeditSpin;
begin
  val.Edit   := edCardEnabledTimeout;
  val.offset := 0.1;
  val.Min    := 0.1;
  val.Max    := 25.0;
  changeEdit(val);
end;

procedure TfrHWEdit.spMaxSpeedClick(Sender: TObject);
var val : TeditSpin;
    res : real;
begin
  val.Min       := spMaxSpeed.MinValue;
  val.Max       := spMaxSpeed.MaxValue;
  val.position  := spMaxSpeed.Value;
  val.prescaler := 1;
  val.Caption   := Trim(lbMaxSpeed.Caption);
  res := createFormSettings(plMaxSpeed, val);
  spMaxSpeed.Value := round(res);
end;



procedure TfrHWEdit.spMaxSpeedKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '+' then spMaxSpeed.Value := spMaxSpeed.Value+1;
  if key = '-' then spMaxSpeed.Value := spMaxSpeed.Value-1;

  if key = #24 then spMaxSpeed.Value := spMaxSpeed.Value+1;
  if key = #25 then spMaxSpeed.Value := spMaxSpeed.Value-1;

  key:=#0;
end;

procedure TfrHWEdit.spMaxSpeedMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var val : TeditSpin;
    res : real;
begin
  val.Min       := spMaxSpeed.MinValue;
  val.Max       := spMaxSpeed.MaxValue;
  val.position  := spMaxSpeed.Value;
  val.offset    := 1;
  val.prescaler := 1;
  val.Caption   := Trim(lbMaxSpeed.Caption);
  res := createFormSettings(plMaxSpeed, val);
  spMaxSpeed.Value := round(res);
end;

procedure TfrHWEdit.spOperatorSessionTimeoutClick(Sender: TObject);
var val : TeditSpin;
    res : real;
begin
  val.Min       := spOperatorSessionTimeout.MinValue;
  val.Max       := spOperatorSessionTimeout.MaxValue;
  val.position  := spOperatorSessionTimeout.Value;
  val.prescaler := 1;
  val.Caption   := Trim(lbOperatorSessionTimeout.Caption);
  res := createFormSettings(plOperatorSessionTimeout, val);
  spOperatorSessionTimeout.Value := round(res);
end;

procedure TfrHWEdit.spOperatorSessionTimeoutKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = '+' then spOperatorSessionTimeout.Value := spOperatorSessionTimeout.Value+1;
  if key = '-' then spOperatorSessionTimeout.Value := spOperatorSessionTimeout.Value-1;

  if key = #24 then spOperatorSessionTimeout.Value := spOperatorSessionTimeout.Value+1;
  if key = #25 then spOperatorSessionTimeout.Value := spOperatorSessionTimeout.Value-1;

  key:=#0;
end;

procedure TfrHWEdit.spOperatorSessionTimeoutMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var val : TeditSpin;
    res : real;
begin
  val.Min       := spOperatorSessionTimeout.MinValue;
  val.Max       := spOperatorSessionTimeout.MaxValue;
  val.position  := spOperatorSessionTimeout.Value;
  val.offset    := 1;
  val.prescaler := 1;
  val.Caption   := Trim(lbOperatorSessionTimeout.Caption);
  res := createFormSettings(plOperatorSessionTimeout, val);
  spOperatorSessionTimeout.Value := round(res);
end;

procedure TfrHWEdit.spRemoteModuleIDClick(Sender: TObject);
var val : TeditSpin;
    res : real;
begin
  val.Min       := spRemoteModuleID.MinValue;
  val.Max       := spRemoteModuleID.MaxValue;
  val.position  := spRemoteModuleID.Value;
  val.prescaler := 1;
  val.Caption   := Trim(lbRemoteModuleID.Caption);
  res := createFormSettings(plRemoteModuleID, val);
  spRemoteModuleID.Value := round(res);
end;

procedure TfrHWEdit.spRemoteModuleIDKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '+' then spRemoteModuleID.Value := spRemoteModuleID.Value+1;
  if key = '-' then spRemoteModuleID.Value := spRemoteModuleID.Value-1;

  if key = #24 then spRemoteModuleID.Value := spRemoteModuleID.Value+1;
  if key = #25 then spRemoteModuleID.Value := spRemoteModuleID.Value-1;


  key:=#0;
end;

procedure TfrHWEdit.spRemoteModuleIDMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var val : TeditSpin;
    res : real;
begin
  val.Min       := spRemoteModuleID.MinValue;
  val.Max       := spRemoteModuleID.MaxValue;
  val.position  := spRemoteModuleID.Value;
  val.offset    := 1;
  val.prescaler := 1;
  val.Caption   := Trim(lbRemoteModuleID.Caption);
  res := createFormSettings(plRemoteModuleID, val);
  spRemoteModuleID.Value := round(res);
end;

procedure TfrHWEdit.sbDeviceKoefDownClick(Sender: TObject);
var val : TeditSpin;
begin
  val.Edit   := edDeviceKoef;
  val.offset := -0.001;
  val.Min    := 0.000;
  val.Max    := 65.534;
  changeEdit(val);
end;

procedure TfrHWEdit.sbDeviceKoefUpClick(Sender: TObject);
var val : TeditSpin;
begin
  val.Edit   := edDeviceKoef;
  val.offset := 0.001;
  val.Min    := 0.000;
  val.Max    := 65.534;
  changeEdit(val);
end;

procedure TfrHWEdit.sbMassFactorDownClick(Sender: TObject);
var val : TeditSpin;
begin
  val.Edit   := edMassFactor;
  val.offset := -0.1;
  val.Min    := 0.1;
  val.Max    := 4.0;
  changeEdit(val);
end;

procedure TfrHWEdit.sbMassFactorUpClick(Sender: TObject);
var val : TeditSpin;
begin
  val.Edit   := edMassFactor;
  val.offset := 0.1;
  val.Min    := 0.1;
  val.Max    := 4.0;
  changeEdit(val);
end;

procedure TfrHWEdit.sbSpeedSensorKoefficientDownClick(Sender: TObject);
var val : TeditSpin;
begin
  val.Edit   := edSpeedSensorKoefficient;
  val.offset := -0.001;
  val.Min    := 0.000;
  val.Max    := 65.534;
  changeEdit(val);
end;

procedure TfrHWEdit.sbSpeedSensorKoefficientUpClick(Sender: TObject);
var val : TeditSpin;
begin
  val.Edit   := edSpeedSensorKoefficient;
  val.offset := 0.001;
  val.Min    := 0.000;
  val.Max    := 65.534;
  changeEdit(val);
end;

procedure TfrHWEdit.ScrollBoxMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  ScrollBox.VertScrollBar.Position := ScrollBox.VertScrollBar.Position + 60;
  Handled := True;
end;

procedure TfrHWEdit.ScrollBoxMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  ScrollBox.VertScrollBar.Position := ScrollBox.VertScrollBar.Position - 60;
  Handled := True;
end;

end.
