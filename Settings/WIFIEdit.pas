unit WIFIEdit;

interface
  uses BaseEdit, Terminal, SysUtils;

const
  MODE_WIFI_OFF       = 'OFF';
  MODE_WIFI_APP       = 'APP';
  MODE_WIFI_CLIENT    = 'Client';
  MODE_WIFI_AP_CLIENT = 'AP+Client';

  AP_CHANNEL_00 = 'AUTO';
  AP_CHANNEL_01 = 'Ch 1';
  AP_CHANNEL_02 = 'Ch 2';
  AP_CHANNEL_03 = 'Ch 3';
  AP_CHANNEL_04 = 'Ch 4';
  AP_CHANNEL_05 = 'Ch 5';
  AP_CHANNEL_06 = 'Ch 6';
  AP_CHANNEL_07 = 'Ch 7';
  AP_CHANNEL_08 = 'Ch 8';
  AP_CHANNEL_09 = 'Ch 9';
  AP_CHANNEL_10 = 'Ch 10';
  AP_CHANNEL_11 = 'Ch 11';
  AP_CHANNEL_12 = 'Ch 12';
  AP_CHANNEL_13 = 'Ch 13';
  AP_CHANNEL_14 = 'Ch 14';

  MODE_APP_VISIBLE = 'Visible';
  MODE_APP_HIDDEN  = 'Hidden';


  type

    TIPAddress = record
      dig1 : byte;
      dig2 : byte;
      dig3 : byte;
      dig4 : byte;
    end;

    TypeModeWifi = (
      mw_off    = %00000000, {0}
      mw_app    = %00000001, {1}
      mw_client = %00000010, {2}
      mw_app_cl = %00000011  {3}
   );

   TypeChannel = (
      ch_00 = %00000000,
      ch_01 = %00010000,
      ch_02 = %00100000,
      ch_03 = %00110000,
      ch_04 = %01000000,
      ch_05 = %01010000,
      ch_06 = %01100000,
      ch_07 = %01110000,
      ch_08 = %10000000,
      ch_09 = %10010000,
      ch_10 = %10100000,
      ch_11 = %10110000,
      ch_12 = %11000000,
      ch_13 = %11010000,
      ch_14 = %11100000
   );

   TypeVisibility = (
      vb_visible  = %00000000,                                                  // ������� ����
      vb_hidden   = %00000010                                                   // ������� ����
   );

   TypeDCHP = (
     DHCP_OFF = %00000000,
     DHCP_ON  = %00000100
   );

   typeSecurity = (
     sc_opened  = %00000000,
     sc_secured = %00000001
   );

   typeWorkMode = (
     wm_server = %00000000,
     wm_client = %00000001
   );

   typeNET = (
     net_any_open = %00000000,
     net_fixed    = %00000010
   );

   typeIP = (
     ip_auto  = %00000000,
     ip_fixed = %00000100
   );

    TWfifcfg = record
    {000}  mode_channel :                 byte;                                 // ����� ������ wifi
    {001}  mode_app     :                 byte;                                 // ����� ������ ����� �������:
                                                                                // ��� 0: ������,
                                                                                // ��� 1: 0 - ������� ����,
                                                                                //        1 - ������� ����;
                                                                                // ��� 2: 0 - DHCP ��������,
                                                                                //        1 - DHCP �������;

    {002}  app_name     : array[0..15] of byte;                                 // ����� ������� - ��� ����
    {018}  app_security :                 byte;                                 // ����� ������� - 0 - ��������, 1 - ��������
    {019}  app_password : array[0..15] of byte;                                 // ����� ������� - ������
    {035}  app_ip       : array[0..03] of byte;                                 // ����� ������� - IP
    {039}  app_mask     : array[0..03] of byte;                                 // ����� ������� - mask
    {043}  app_gateway  : array[0..03] of byte;                                 // ����� ������� - gateway

    {047}  mode_cl      :                 byte;                                 // ����� ������ ������� ����:
                                                                                // ��� 0: ����� ������:- ������, 1 - ����������� � ��. �������,
                                                                                // ��� 1: 0 - ����� �������� ����, 1 - ������������� ����;
                                                                                // ��� 2: 0 - ������� IP, 1 - ����. IP

    {048}  cl_name      : array[0..15] of byte;                                 // ������ ���� - ��� ����
    {064}  cl_security  :                 byte;                                 // ������ ���� - 0 - ��������, 1 - ��������
    {065}  cl_password  : array[0..15] of byte;                                 // ������ ���� - ������
    {081}  cl_ip        : array[0..03] of byte;                                 // ������ ���� - IP
    {085}  cl_mask      : array[0..03] of byte;                                 // ������ ���� - mask
    {089}  cl_gateway   : array[0..03] of byte;                                 // ������ ���� - gateway

    {094}  port_server  : array[0..1]   of byte;                                 // ���� ������������ ������� (Wi-Fi)
    {096}  app_mac      : array[0..05] of byte;                                 // MAC-����� � ������ ����� ������� (FF - �����������)
    {101}  cl_mac       : array[0..05] of byte;                                 // MAC-����� � ������ ������� ���� (FF - �� ���������)
    {107}  reserv       : array[0..07] of byte;                                 // ������
//------------------------------------------------------------------------------
//  total: 115 byte
    end;

    TWifiEdit = class(TBasementEdit)
      private
        FConfig  : TConfig;
        FWificfg : TWfifcfg;
//        procedure setAppHidden(_isHidden: Boolean);
      public
        constructor create(_config : TConfig);
        //------set-------------------------------------------------------------
        procedure setWifiMode(    _mode    : typeModeWifi);
        procedure setChannel(    _channel  : TypeChannel);
        procedure setVisibility( _state    : TypeVisibility);
        procedure setDHCP(       _state    : TypeDCHP);

        procedure setAppSecurity(_security : typeSecurity);
        procedure setClSecurity(_security  : typeSecurity);

        procedure setClWorkMode(_workmode : typeWorkMode);
        procedure setClnet(_net : typeNET);
        procedure setIPMode(_typeIP: typeIP);

        procedure setPort(_port : word);                                        // ���������� Internal Server Port

        //---------------------IP----------------------------------------------
        procedure setAppIP(_IP      : TIPAddress);
        procedure setAppMask(_IP    : TIPAddress);
        procedure setAppGateway(_IP : TIPAddress);

        procedure setClIP(_IP       : TIPAddress);
        procedure setClMask(_IP     : TIPAddress);
        procedure setClGateway(_IP  : TIPAddress);
        //---------------------IP----------------------------------------------

        function setAppName(_name         : String) : Boolean;
        function setAppPassword(_password : String) : Boolean;
        function setClName(_name          : String) : Boolean;
        function setClPassword(_password  : String) : Boolean;


        //------get-------------------------------------------------------------
        function getWifiCfg     : Tconfig;

        function getWifiMode    : byte;
        function getChannel     : byte;
        function getVisibility  : boolean;
        function getDHCP        : Boolean;

        function getAppName     : String;
        function getAppPassword : String;
        function getCLName      : String;
        function getCLPassword  : String;

        function getAppSecurity : byte;
        function getClSecurity  : byte;

        //---------------------IP----------------------------------------------
        function getAppIp       : TIPAddress;
        function getAppMask     : TIPAddress;
        function getAppGateway  : TIPAddress;

        function getClIp        : TIPAddress;
        function getClMask      : TIPAddress;
        function getClGateway   : TIPAddress;
        //---------------------IP----------------------------------------------
        function getPort : word;

        function getClWorkMode  : byte;
        function getCLNET       : byte;
        function getIPMode      : byte;

    end;


implementation

{ TWifiEdit }

constructor TWifiEdit.create(_config: TConfig); // ���� ������������
begin
  FConfig  := _config;
  move(_config.WIFICfg, FWificfg, sizeOf(FWificfg));                            // ��������� ��������� �������� wifi
end;

//------------mode_channel------------------------------------------------------
procedure TWifiEdit.setWifiMode(_mode: typeModeWifi);
begin
  FWificfg.mode_channel := (FWificfg.mode_channel and not %00000011) or ord(_mode);
end;

procedure TWifiEdit.setChannel(_channel: TypeChannel);
begin
  FWificfg.mode_channel := (FWificfg.mode_channel and not %11110000) or ord(_channel);
end;

function TWifiEdit.getWifiMode: byte;
begin
  result := FWificfg.mode_channel and %00000011;
end;

function TWifiEdit.getChannel: byte;
begin
  result := FWificfg.mode_channel and %11110000;
end;
//------------------------------------------------------------------------------

//----mode_app------------------------------------------------------------------
procedure TWifiEdit.setDHCP(_state: TypeDCHP);
begin
  FWificfg.mode_app := (FWificfg.mode_app and not %00000100) or ord(_state);
end;



procedure TWifiEdit.setPort(_port: word);
begin
  FWificfg.port_server[0] := Hi(_Port);
  FWificfg.port_server[1] := LO(_Port);
end;

procedure TWifiEdit.setVisibility(_state: TypeVisibility);
begin
  FWificfg.mode_app := (FWificfg.mode_app and not %00000010) or ord(_state);
end;

function TWifiEdit.getDHCP: Boolean;
begin
  result := false;
  if (FWificfg.mode_app and %00000100) = %00000100
  then result := true;
end;



function TWifiEdit.getPort: word;
begin
  result := (FWificfg.port_server[0] shl 8) or FWificfg.port_server[1]
end;

function TWifiEdit.getVisibility: Boolean;
begin
  result := false;
  if (FWificfg.mode_app and %00000010) = %00000010 then result := True;
end;
//------------------------------------------------------------------------------

function TWifiEdit.setAppName(_name: String):boolean;
var buf : TBytes;
begin
  result := True;
  if Length(_name) > sizeOf(FWificfg.app_name) then
  begin
    result := False;
    exit;
  end;

  try
    buf := TEncoding.UTF8.GetBytes(_name);
    FillChar(FWificfg.app_name[0], SizeOf(FWificfg.app_name), 0);         // ������� ������� ����� ������������
    Move(buf[0], FWificfg.app_name[0], Length(buf));
  except
    result := False;
  end;
end;

function TWifiEdit.setAppPassword(_password: String): Boolean;
var buf : TBytes;
begin
  result := True;
  if Length(_password) > sizeOf(FWificfg.app_password) then
  begin
    result := False;
    exit;
  end;

  try
    buf := TEncoding.UTF8.GetBytes(_password);
    FillChar(FWificfg.app_password[0], SizeOf(FWificfg.app_password), 0);         // ������� ������� ����� ������������
    Move(buf[0], FWificfg.app_password[0], Length(buf));
  except
    result := False;
  end;
end;

function TWifiEdit.setClName(_name: String): Boolean;
var buf : TBytes;
begin
  result := True;
  if Length(_name) > sizeOf(FWificfg.cl_name) then
  begin
    result := False;
    exit;
  end;

  try
    buf := TEncoding.UTF8.GetBytes(_name);
    FillChar(FWificfg.cl_name[0], SizeOf(FWificfg.cl_name), 0);         // ������� ������� ����� ������������
    Move(buf[0], FWificfg.cl_name[0], Length(buf));
  except
    result := False;
  end;
end;

function TWifiEdit.setClPassword(_password: String): Boolean;
var buf : TBytes;
begin
  result := True;
  if Length(_password) > sizeOf(FWificfg.cl_password) then
  begin
    result := False;
    exit;
  end;

  try
    buf := TEncoding.UTF8.GetBytes(_password);
    FillChar(FWificfg.cl_password[0], SizeOf(FWificfg.cl_password), 0);         // ������� ������� ����� ������������
    Move(buf[0], FWificfg.cl_password[0], Length(buf));
  except
    result := False;
  end;
end;

function TWifiEdit.getAppName: String;
//var
// buff : TBytes;
//    len : integer;
begin
//  len := sizeOf(FWificfg.app_name);
//  SetLength(buff, len+2);
//  move(FWificfg.app_name[0], buff[0], len);
//  buff[len+1] := 0;
//  result := PAnsiChar(@buff[0]);
//  result := PAnsiChar(@FWificfg.app_name[0]);

  result := Copy(string(PAnsiChar(@FWificfg.app_name[0])), 1, 16);
end;

function TWifiEdit.getCLName: String;
begin
//  result := PAnsiChar(@FWificfg.cl_name[0]);
  result := Copy(string(PAnsiChar(@FWificfg.cl_name[0])), 1, 16);
end;

function TWifiEdit.getCLPassword: String;
begin
//  result := PAnsiChar(@FWificfg.cl_password[0]);
 result := Copy(string(PAnsiChar(@FWificfg.cl_password[0])), 1, 16);
end;

function TWifiEdit.getAppPassword: String;
begin
//  result := PAnsiChar(@FWificfg.app_password[0]);
  result := Copy(string(PAnsiChar(@FWificfg.app_password[0])), 1, 16);
end;


//------------security----------------------------------------------------------
procedure TWifiEdit.setAppSecurity(_security: typeSecurity);
begin
  FWificfg.app_security := ord(_security);
end;

procedure TWifiEdit.setClSecurity(_security: typeSecurity);
begin
  FWificfg.Cl_security := ord(_security);
end;

function TWifiEdit.getClSecurity: byte;
begin
  result := FWificfg.Cl_security;
end;



function TWifiEdit.getAppSecurity: byte;
begin
  result := FWificfg.app_security;
end;
//------------------------------------------------------------------------------
//---------mode_cl--------------------------------------------------------------
procedure TWifiEdit.setClnet(_net : typeNET);
begin
  FWificfg.mode_cl := (FWificfg.mode_cl and not %00000010) or ord(_net);
end;

procedure TWifiEdit.setClWorkMode(_workmode : typeWorkMode);
begin
  FWificfg.mode_cl := (FWificfg.mode_cl and not %00000001) or ord(_workmode);
end;

procedure TWifiEdit.setIPMode(_typeIP: typeIP);
begin
  FWificfg.mode_cl := (FWificfg.mode_cl and not %00000100) or ord(_typeIP);
end;
//------------------------------------------------------------------------------
//----------------------------------------------IP--SET--APP--------------------
procedure TWifiEdit.setAppIP(_IP: TIPAddress);
begin
  FWificfg.app_ip[0] := _ip.dig1;
  FWificfg.app_ip[1] := _ip.dig2;
  FWificfg.app_ip[2] := _ip.dig3;
  FWificfg.app_ip[3] := _ip.dig4;
end;

procedure TWifiEdit.setAppMask(_IP: TIPAddress);
begin
  FWificfg.app_mask[0] := _ip.dig1;
  FWificfg.app_mask[1] := _ip.dig2;
  FWificfg.app_mask[2] := _ip.dig3;
  FWificfg.app_mask[3] := _ip.dig4;
end;

procedure TWifiEdit.setAppGateway(_IP: TIPAddress);
begin
  FWificfg.app_gateway[0] := _ip.dig1;
  FWificfg.app_gateway[1] := _ip.dig2;
  FWificfg.app_gateway[2] := _ip.dig3;
  FWificfg.app_gateway[3] := _ip.dig4;
end;
//----------------------------------------------IP--SET--CL---------------------
procedure TWifiEdit.setClIP(_IP: TIPAddress);
begin
  FWificfg.cl_ip[0] := _ip.dig1;
  FWificfg.cl_ip[1] := _ip.dig2;
  FWificfg.cl_ip[2] := _ip.dig3;
  FWificfg.cl_ip[3] := _ip.dig4;
end;

procedure TWifiEdit.setClMask(_IP: TIPAddress);
begin
  FWificfg.cl_mask[0] := _ip.dig1;
  FWificfg.cl_mask[1] := _ip.dig2;
  FWificfg.cl_mask[2] := _ip.dig3;
  FWificfg.cl_mask[3] := _ip.dig4;
end;

procedure TWifiEdit.setClGateway(_IP: TIPAddress);
begin
  FWificfg.cl_gateway[0] := _ip.dig1;
  FWificfg.cl_gateway[1] := _ip.dig2;
  FWificfg.cl_gateway[2] := _ip.dig3;
  FWificfg.cl_gateway[3] := _ip.dig4;
end;
//----------------------------------------------IP--GET--APP---------------------

function TWifiEdit.getAppIp: TIPAddress;
begin
  result.dig1 := FWificfg.app_ip[0];
  result.dig2 := FWificfg.app_ip[1];
  result.dig3 := FWificfg.app_ip[2];
  result.dig4 := FWificfg.app_ip[3];
end;

function TWifiEdit.getAppMask: TIPAddress;
begin
  result.dig1 := FWificfg.app_mask[0];
  result.dig2 := FWificfg.app_mask[1];
  result.dig3 := FWificfg.app_mask[2];
  result.dig4 := FWificfg.app_mask[3];
end;

function TWifiEdit.getAppGateway: TIPAddress;
begin
  result.dig1 := FWificfg.app_gateway[0];
  result.dig2 := FWificfg.app_gateway[1];
  result.dig3 := FWificfg.app_gateway[2];
  result.dig4 := FWificfg.app_gateway[3];
end;

//----------------------------------------------IP--GET--CL---------------------

function TWifiEdit.getClIp: TIPAddress;
begin
  result.dig1 := FWificfg.cl_ip[0];
  result.dig2 := FWificfg.cl_ip[1];
  result.dig3 := FWificfg.cl_ip[2];
  result.dig4 := FWificfg.cl_ip[3];
end;

function TWifiEdit.getClMask: TIPAddress;
begin
  result.dig1 := FWificfg.cl_mask[0];
  result.dig2 := FWificfg.cl_mask[1];
  result.dig3 := FWificfg.cl_mask[2];
  result.dig4 := FWificfg.cl_mask[3];
end;

function TWifiEdit.getClGateway: TIPAddress;
begin
  result.dig1 := FWificfg.cl_gateway[0];
  result.dig2 := FWificfg.cl_gateway[1];
  result.dig3 := FWificfg.cl_gateway[2];
  result.dig4 := FWificfg.cl_gateway[3];
end;
//----------------------------------------------IP------------------------------


//------mode_cl------------------------------------------------------------------------
function TWifiEdit.getClWorkMode: byte;
begin
  result := FWificfg.mode_cl and %00000001;
end;

function TWifiEdit.getCLNET: byte;
begin
  result := FWificfg.mode_cl and %00000010;
end;

function TWifiEdit.getIPMode: byte;
begin
  result := FWificfg.mode_cl and %00000100;
end;
//------------------------------------------------------------------------------



//------------------------------------------------------------------------------
function TWifiEdit.getWifiCfg: Tconfig; // ������� ���������� ������������
begin
  move(FWificfg, FConfig.WIFICfg, sizeOf(FWificfg));                            // ��������� ��������� �������� wifi
  result := FConfig;
end;




end.
