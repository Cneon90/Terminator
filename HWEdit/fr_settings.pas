unit fr_settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Samples.Spin;

type
  TeditSpin = record
    Edit     : TEdit;
    offset   : Double;
    Max      : Double;
    Min      : Double;
    position : Double;
    prescaler: integer;
    Caption  : String;
  end;

  TfrSettings = class(TForm)
    plMain: TPanel;
    tbSetting: TTrackBar;
    Timer: TTimer;
    edValue: TEdit;
    SpinButton: TSpinButton;
    procedure tbSettingChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tbSettingKeyPress(Sender: TObject; var Key: Char);
    procedure TimerTimer(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure edValueChange(Sender: TObject);
    procedure edValueKeyPress(Sender: TObject; var Key: Char);
    procedure SpinButtonDownClick(Sender: TObject);
    procedure SpinButtonUpClick(Sender: TObject);
    procedure edValueDblClick(Sender: TObject);
    procedure edValueClick(Sender: TObject);
  private
    { Private declarations }
    FirstClick : boolean;
    min : integer;
    max : integer;
    SettingCaption : String;
    FData : TeditSpin;
    function IsCursorOutsideForm(Form: TForm): Boolean;
    function IsCursorTrack(Track : TTrackBar): Boolean;
    procedure changeEdit(val:TeditSpin);
  public
    { Public declarations }
    procedure setData(_Data : TeditSpin);
    procedure setCursorF;

    function getResult:real;


  end;

var
  frSettings: TfrSettings;
  HookHandle: HHOOK;
implementation

{$R *.dfm}

function Map(x, in_min, in_max, out_min, out_max: Double): Double;
begin
  Result := (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
end;

procedure TfrSettings.changeEdit(val: TeditSpin);
var floatValue: Double;
begin
  floatValue := StrToFloat(edValue.Text);
  floatValue := floatValue + val.offset;
  if (floatValue <= val.Min)  then floatValue := val.Min;
  if (floatValue >= val.Max)  then floatValue := val.Max;
  edValue.Text := FloatToStr(floatValue);
end;

procedure TfrSettings.edValueChange(Sender: TObject);
begin
  try
    tbSetting.Position := strToInt(edValue.Text) * FData.prescaler;

  except

  end;
end;

procedure TfrSettings.edValueClick(Sender: TObject);
begin
//  setCursorF;
end;

procedure TfrSettings.edValueDblClick(Sender: TObject);
begin
  setCursorF;
end;

procedure TfrSettings.edValueKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then Key := #0; // ������ ����� �������, ���� �� �� �������� ������ ��� Backspace
end;

procedure TfrSettings.FormActivate(Sender: TObject);
begin
  tbSetting.SetFocus;
//  setCursorF;
  FirstClick := true;
end;

procedure TfrSettings.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  setCursorF;
end;

procedure TfrSettings.FormShow(Sender: TObject);
begin
  Timer.Enabled := true;
end;

function TfrSettings.getResult: real;
begin
//  result := tbSetting.Position / Fdata.prescaler;
  result := StrTofloat(edValue.Text);
end;

procedure TfrSettings.setCursorF;
var
  proc   : integer;
  cp     : integer;
  offset : double;
begin
  proc   := round((100 * tbSetting.Position) / tbSetting.Max);                  // �������� ������� � ��������� (��� - 100%)
  cp     := round((tbSetting.Width * proc) / 100);                              // ��������� �������� � ������� (��������� ������� ��������)
  offset := Map(tbSetting.Position, FData.Min, FData.Max, 20, -10);             // ��������
  SetCursorPos((Self.Left + edValue.Width + edValue.Margins.Left + edValue.Margins.Right + cp + round(offset)+7), self.top + tbSetting.Top + 10);   // ������������� ������
end;

procedure TfrSettings.setData(_Data: TeditSpin);
begin
   FData := _Data;
//   if _Data.offset > 2 then FData.offset := FData.Min;

//  lbSettingName.Caption := _Data.Caption;
  edValue.text          := (tbSetting.Position/FData.prescaler).ToString;//round(_Data.position).ToString;
  tbSetting.Max         := round(_Data.Max);
  tbSetting.Min         := round(_Data.Min);
  tbSetting.Position    := round(_Data.position*_Data.prescaler);

end;

procedure TfrSettings.SpinButtonDownClick(Sender: TObject);
begin
  if FData.offset > 0 then FData.offset := (-1) * FData.offset;
//  FData.offset := (-1) * FData.offset;
  changeEdit(FData);
end;

procedure TfrSettings.SpinButtonUpClick(Sender: TObject);
begin
  if FData.offset < 0 then FData.offset := (-1) * FData.offset;
  
//  FData.offset := FData.offset;
  changeEdit(FData);
end;

procedure TfrSettings.tbSettingChange(Sender: TObject);
begin
  edValue.text := (tbSetting.Position/FData.prescaler).ToString;
end;

procedure TfrSettings.tbSettingKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then close;
 if key = '+' then tbSetting.Position := tbSetting.Position + 1;
 if key = '-' then tbSetting.Position := tbSetting.Position - 1;

 setCursorF;
end;

function TfrSettings.IsCursorOutsideForm(Form: TForm): Boolean;
var
  CursorPos: TPoint;
begin
  GetCursorPos(CursorPos);
  Result := not PtInRect(Form.BoundsRect, CursorPos);
end;

function TfrSettings.IsCursorTrack(Track : TTrackBar): Boolean;
var
  TrackCursorPos: TPoint;
begin
  TrackCursorPos := Track.ScreenToClient(Mouse.CursorPos);
  Result := PtInRect(Track.ClientRect, TrackCursorPos);
end;

function IsLeftMouseButtonPressed: Boolean;
begin
  Result := GetAsyncKeyState(VK_LBUTTON) <> 0;
end;

procedure TfrSettings.TimerTimer(Sender: TObject);
var
  CursorPos: TPoint;
begin
  if (IsLeftMouseButtonPressed) then
  begin

    if FirstClick AND (IsCursorTrack(tbSetting)) then
    begin
      FirstClick := false;
      setCursorF;
      exit;
    end;


    if (IsCursorTrack(tbSetting)) then
    begin
      GetCursorPos(CursorPos); // �������� ������� ���������� �������
      SetCursorPos(CursorPos.X, self.top + tbSetting.Top + 10); // ������������� ����� ���������� Y, �������� X ��� ���������  CursorPos.Y := 100;
    end;
  end;
//  else Screen.Cursor := crDefault;

  if IsCursorOutsideForm(Self) then close; // ���� ������ ����� �� ������� �����
end;

end.
