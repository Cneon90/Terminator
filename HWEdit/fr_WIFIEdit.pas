unit fr_WIFIEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Terminal, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin, Vcl.WinXCtrls, wifiEdit, lib_main;


const
  MSG_CLOSING_REQUST = '��������� �������?';
  EDIT_ASCI_START   = #32;
  EDIT_ASCI_END     = #126;

type
  TfrWifiEdit = class(TForm)
    gbCommonSettings: TGroupBox;
    lbMode: TLabel;
    cbMode: TComboBox;
    lbAPChannel: TLabel;
    cbAPChannel: TComboBox;
    lbInternalServerPort: TLabel;
    spInternalServerPort: TSpinEdit;
    plMain: TPanel;
    plButtons: TPanel;
    btnReset: TButton;
    btnSave: TButton;
    btnClose: TButton;
    gbAPSettongs: TGroupBox;
    gbCLSettings: TGroupBox;
    plAPVisibility: TPanel;
    plAPSecurity: TPanel;
    plAPSSID: TPanel;
    plAPKey: TPanel;
    plAPDHCP: TPanel;
    plAPIP: TPanel;
    plAPMask: TPanel;
    plAPGateWay: TPanel;
    plCLNetSelection: TPanel;
    plCLSecurity: TPanel;
    plCLSSID: TPanel;
    plCLKey: TPanel;
    plCLIPAdress: TPanel;
    plCLIP: TPanel;
    plCLMask: TPanel;
    plCLGateWay: TPanel;
    lbAPVisibility: TLabel;
    lbAPSecurity: TLabel;
    lbAPSSID: TLabel;
    lbAPKey: TLabel;
    lbAPDHCP: TLabel;
    lbAPIP: TLabel;
    lbAPMask: TLabel;
    lbAPGateWay: TLabel;
    lbCLNetSelection: TLabel;
    lbCLSecurity: TLabel;
    lbCLSSID: TLabel;
    lbCLKey: TLabel;
    lbCLIPAdress: TLabel;
    lbCLIP: TLabel;
    lbCLMask: TLabel;
    lbCLGateWay: TLabel;
    edAPSSID: TEdit;
    edAPKey: TEdit;
    edCLSSID: TEdit;
    edCLKey: TEdit;
    plAPIPAssebler: TPanel;
    lbAPIPDot1: TLabel;
    lbAPIPDot2: TLabel;
    lbAPIPDot3: TLabel;
    spAPIPDigit1: TSpinEdit;
    spAPIPDigit2: TSpinEdit;
    spAPIPDigit3: TSpinEdit;
    spAPIPDigit4: TSpinEdit;
    plAPMaskAssebler: TPanel;
    lbAPMaskDot1: TLabel;
    lbAPMaskDot2: TLabel;
    lbAPMaskDot3: TLabel;
    spAPMaskDigit1: TSpinEdit;
    spAPMaskDigit2: TSpinEdit;
    spAPMaskDigit3: TSpinEdit;
    spAPMaskDigit4: TSpinEdit;
    plAPGatewayAssebler: TPanel;
    lbAPGatewayDot1: TLabel;
    lbAPGatewayDot2: TLabel;
    lbAPGatewayDot3: TLabel;
    spAPGatewayDigit1: TSpinEdit;
    spAPGatewayDigit2: TSpinEdit;
    spAPGatewayDigit3: TSpinEdit;
    spAPGatewayDigit4: TSpinEdit;
    plCLIPAssebler: TPanel;
    lbCLIPDot1: TLabel;
    lbCLIPDot2: TLabel;
    lbCLIPDot3: TLabel;
    spCLIPDigit1: TSpinEdit;
    spCLIPDigit2: TSpinEdit;
    spCLIPDigit3: TSpinEdit;
    spCLIPDigit4: TSpinEdit;
    plCLMaskAssebler: TPanel;
    lbCLMaskDot1: TLabel;
    lbCLMaskDot2: TLabel;
    lbCLMaskDot3: TLabel;
    spCLMaskDigit1: TSpinEdit;
    spCLMaskDigit2: TSpinEdit;
    spCLMaskDigit3: TSpinEdit;
    spCLMaskDigit4: TSpinEdit;
    plCLGatewayAssebler: TPanel;
    lbCLGatewayDot1: TLabel;
    lbCLGatewayDot2: TLabel;
    lbCLGatewayDot3: TLabel;
    spCLGatewayDigit1: TSpinEdit;
    spCLGatewayDigit2: TSpinEdit;
    spCLGatewayDigit3: TSpinEdit;
    spCLGatewayDigit4: TSpinEdit;
    plAPVisibilityts: TPanel;
    tsAPVisibility: TToggleSwitch;
    plAPDHCPts: TPanel;
    tsAPDHCP: TToggleSwitch;
    plCLNetSelectionts: TPanel;
    tsCLNetSelection: TToggleSwitch;
    plCLIPAdressts: TPanel;
    tsCLIPAdress: TToggleSwitch;
    plAPSecurityTs: TPanel;
    plCLSecurityts: TPanel;
    tsAPSecurity: TToggleSwitch;
    tsCLSecurity: TToggleSwitch;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure edCLSSIDKeyPress(Sender: TObject; var Key: Char);
    procedure edCLKeyKeyPress(Sender: TObject; var Key: Char);
    procedure edAPSSIDKeyPress(Sender: TObject; var Key: Char);
    procedure edAPKeyKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FConfBuf  : TConfig;
    FConfCurr : Tconfig;
    FConfSave : TConfig;
    Fwifiedit  : TWifiEdit;
    FAppIP     : TIPAddress;
    FChange   : Boolean;
    procedure ComboBoxLoad(var _combobox: TComboBox; val : byte);
    procedure ParamsFilling;                                                    // ���������� �����
    procedure save;
    function editToIP(dig1, dig2, dig3, dig4 : TSpinEdit) :  TIPAddress;
    procedure IPtoEdit(sp1, sp2, sp3, sp4 : TSpinEdit; IP:TIPAddress);
  public
    { Public declarations }
   procedure setServerSettings(_Config : TConfig);
   function  getWifiSettings:TConfig;
   function  getisChange:Boolean;
  end;

var
  frWifiEdit: TfrWifiEdit;

implementation

{$R *.dfm}



{ TfrWifiEdit }
procedure TfrWifiEdit.ComboBoxLoad(var _combobox: TComboBox; val : byte);
begin
  _combobox.ItemIndex := _combobox.Items.IndexOfObject(TObject(val));
  if _combobox.ItemIndex = -1 then _combobox.ItemIndex := 0;                    // ���� �� ������ ����� ��������, �� �������� ������ �� ������
end;


procedure TfrWifiEdit.edAPKeyKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [EDIT_ASCI_START..EDIT_ASCI_END, #8]) and (Key <> ^V) then
    Key := #0;
end;

procedure TfrWifiEdit.edAPSSIDKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [EDIT_ASCI_START..EDIT_ASCI_END, #8]) and (Key <> ^V) then
    Key := #0;
end;

procedure TfrWifiEdit.edCLKeyKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [EDIT_ASCI_START..EDIT_ASCI_END, #8]) and (Key <> ^V) then
    Key := #0;
end;

procedure TfrWifiEdit.edCLSSIDKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [EDIT_ASCI_START..EDIT_ASCI_END, #8]) and (Key <> ^V) then
    Key := #0;
end;

function TfrWifiEdit.editToIP(dig1, dig2, dig3, dig4 : TSpinEdit) :  TIPAddress;
begin
  result.dig1 := dig1.Value;
  result.dig2 := dig2.Value;
  result.dig3 := dig3.Value;
  result.dig4 := dig4.Value;
end;

procedure TfrWifiEdit.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrWifiEdit.btnResetClick(Sender: TObject);
begin
  setServerSettings(FConfBuf);
end;

procedure TfrWifiEdit.btnSaveClick(Sender: TObject);
begin
  save;
  FConfSave := Fwifiedit.getWifiCfg;
  FChange := True;
  close;
end;

procedure TfrWifiEdit.FormActivate(Sender: TObject);
begin
  FChange := false;
end;

procedure TfrWifiEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Save;

  if StructuresEqual(FConfCurr, FConfSave)
  then exit;                                                                    // ���� ����������� ������������ ����� �����������


  if MessageDlg(MSG_CLOSING_REQUST, mtConfirmation, [mbyes, mbNo], 0 ) = mrNo
  then
    begin
      setServerSettings(FConfBuf);                                                   // ���������� ����������� ���������
      Save;
    end
  else FChange := True;

  CanClose := true;
end;

procedure TfrWifiEdit.FormCreate(Sender: TObject);
begin
  ParamsFilling;
end;

function TfrWifiEdit.getisChange: Boolean;
begin
  result := FChange;
end;

function TfrWifiEdit.getWifiSettings: TConfig;
begin
 result := FWifiedit.getWifiCfg;
end;

procedure TfrWifiEdit.IPtoEdit(sp1, sp2, sp3, sp4: TSpinEdit; IP:TIPAddress);
begin
  sp1.Value := IP.dig1;
  sp2.Value := IP.dig2;
  sp3.Value := IP.dig3;
  sp4.Value := IP.dig4;
end;

procedure TfrWifiEdit.ParamsFilling;
begin
  cbMode.Items.AddObject(MODE_WIFI_OFF,       TObject(mw_off));
  cbMode.Items.AddObject(MODE_WIFI_APP,       TObject(mw_app));
  cbMode.Items.AddObject(MODE_WIFI_CLIENT,    TObject(mw_client));
  cbMode.Items.AddObject(MODE_WIFI_AP_CLIENT, TObject(mw_app_cl));

  cbAPChannel.Items.AddObject(AP_CHANNEL_00, TObject(ch_00));
  cbAPChannel.Items.AddObject(AP_CHANNEL_01, TObject(ch_01));
  cbAPChannel.Items.AddObject(AP_CHANNEL_02, TObject(ch_02));
  cbAPChannel.Items.AddObject(AP_CHANNEL_03, TObject(ch_03));
  cbAPChannel.Items.AddObject(AP_CHANNEL_04, TObject(ch_04));
  cbAPChannel.Items.AddObject(AP_CHANNEL_05, TObject(ch_05));
  cbAPChannel.Items.AddObject(AP_CHANNEL_06, TObject(ch_06));
  cbAPChannel.Items.AddObject(AP_CHANNEL_07, TObject(ch_07));
  cbAPChannel.Items.AddObject(AP_CHANNEL_08, TObject(ch_08));
  cbAPChannel.Items.AddObject(AP_CHANNEL_09, TObject(ch_09));
  cbAPChannel.Items.AddObject(AP_CHANNEL_10, TObject(ch_10));
  cbAPChannel.Items.AddObject(AP_CHANNEL_11, TObject(ch_11));
  cbAPChannel.Items.AddObject(AP_CHANNEL_12, TObject(ch_12));
  cbAPChannel.Items.AddObject(AP_CHANNEL_13, TObject(ch_13));
  cbAPChannel.Items.AddObject(AP_CHANNEL_14, TObject(ch_14));
end;

procedure TfrWifiEdit.save;
begin
  FWifiedit.setWifiMode(TypeModeWifi(cbMode.Items.Objects[cbMode.ItemIndex]));
  FWifiedit.setChannel(TypeChannel(cbAPChannel.Items.Objects[cbAPChannel.ItemIndex]));

  if tsAPVisibility.State = tssOn then FWifiedit.setVisibility(vb_hidden)
                                  else FWifiedit.setVisibility(vb_visible);

  if tsAPDHCP.State = tssOn then FWifiedit.setDHCP(DHCP_ON)
                            else Fwifiedit.setDHCP(DHCP_OFF);

  Fwifiedit.setAppName(Trim(edAPSSID.Text));
  Fwifiedit.setAppPassword(Trim(edAPKey.Text));
  Fwifiedit.setClName(Trim(edCLSSID.Text));
  Fwifiedit.setClPassword(Trim(edCLKey.Text));

  if tsAPSecurity.State = tssOn then Fwifiedit.setAppSecurity(sc_secured)
                                else Fwifiedit.setAppSecurity(sc_opened);

  if tsCLSecurity.State = tssOn then Fwifiedit.setCLSecurity(sc_secured)
                                else Fwifiedit.setCLSecurity(sc_opened);

  Fwifiedit.setAppIP(editToIP(spAPIPDigit1,spAPIPDigit2,spAPIPDigit3,spAPIPDigit4));
  Fwifiedit.setAppMask(editToIP(spAPMaskDigit1,spAPMaskDigit2,spAPMaskDigit3,spAPMaskDigit4));
  Fwifiedit.setAppGateway(editToIP(spAPGatewayDigit1,spAPGatewayDigit2,spAPGatewayDigit3,spAPGatewayDigit4));

  Fwifiedit.setClIP(editToIP(spClIPDigit1,spClIPDigit2,spCLIPDigit3,spCLIPDigit4));
  Fwifiedit.setClMask(editToIP(spCLMaskDigit1,spCLMaskDigit2,spCLMaskDigit3,spCLMaskDigit4));
  Fwifiedit.setClGateway(editToIP(spCLGatewayDigit1,spCLGatewayDigit2,spClGatewayDigit3,spClGatewayDigit4));

  Fwifiedit.setPort(spInternalServerPort.Value);

  if tsCLNetSelection.State = tssOn then Fwifiedit.setClnet(net_fixed)
                                    else Fwifiedit.setClnet(net_any_open);

  if tsCLIPAdress.State = tssOn then Fwifiedit.setIPMode(ip_fixed)
                                else Fwifiedit.setIPMode(ip_auto);

  FConfCurr := Fwifiedit.getWifiCfg;
end;

procedure TfrWifiEdit.setServerSettings(_Config: TConfig);
begin
  FWifiedit := TWifiEdit.Create(_Config);
  FConfBuf  := _Config;                                                         // ��� ����������� �������� ��������
  FConfSave := _Config;                                                         // ��� �������� �� ��������� ����� ���������


  ComboBoxLoad(cbMode,        FWifiedit.getWifiMode);
  ComboBoxLoad(cbAPChannel,   FWifiedit.getChannel);


  if FWifiedit.getVisibility then tsAPVisibility.State := tssOn
                             else tsAPVisibility.State := tssOff;

  if FWifiedit.getDHCP then tsAPDHCP.State := tssOn
                       else tsAPDHCP.State := tssOff;

  edAPSSID.Text := Fwifiedit.getAppName;
  edAPKey.Text  := Fwifiedit.getAppPassword;
  edCLSSID.Text := Fwifiedit.getCLName;
  edCLKey.Text  := Fwifiedit.getCLPassword;

  if Fwifiedit.getAppSecurity = ord(sc_secured) then tsAPSecurity.State := tssOn
                                                else tsAPSecurity.State := tssOff;

  if Fwifiedit.getClSecurity = ord(sc_secured) then tsclSecurity.State := tssOn
                                               else tsclSecurity.State := tssOff;

  IPtoEdit(spAPIPDigit1,spAPIPDigit2,spAPIPDigit3,spAPIPDigit4, Fwifiedit.getAppIp);
  IPtoEdit(spAPMaskDigit1,spAPMaskDigit2,spAPMaskDigit3,spAPMaskDigit4, Fwifiedit.getAppMask);
  IPtoEdit(spAPGatewayDigit1,spAPGatewayDigit2,spAPGatewayDigit3,spAPGatewayDigit4, Fwifiedit.getAppGateway);

  IPtoEdit(spCLIPDigit1,spCLIPDigit2,spCLIPDigit3,spCLIPDigit4, Fwifiedit.getClIp);
  IPtoEdit(spCLMaskDigit1,spCLMaskDigit2,spCLMaskDigit3,spCLMaskDigit4, Fwifiedit.getClMask);
  IPtoEdit(spCLGatewayDigit1,spCLGatewayDigit2,spCLGatewayDigit3,spCLGatewayDigit4, Fwifiedit.getClGateway);

  spInternalServerPort.Value := Fwifiedit.getPort;

  if Fwifiedit.getCLNET = ord(net_fixed) then tsCLNetSelection.State := tssOn
                                         else tsCLNetSelection.State := tssOff;

  if Fwifiedit.getIPMode = ord(ip_fixed) then tsCLIPAdress.State := tssOn
                                         else tsCLIPAdress.State := tssOff;
end;

end.
