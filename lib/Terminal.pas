unit Terminal;

interface

uses CPDrv, SysUtils, DateUtils;

type

  // ���������� � ���������
  TterminalInfo = record
     head:byte;
     answer: byte;
     ProdDate: array[0..02]   of byte; // ���� ������������
     ID:       array[0..03]   of byte; // ID ���������
     coding:   array[0..03]   of byte; // ����� (G|GC|GW|GWC)
     SW:       array[0..04]   of byte; // ������ ��������
     name:     array[0..31]   of byte; // �������� ���������
     MAC_EN:byte;
     MAC_AP:   array[0..05]   of byte; // MAC ����� �������
     MAC_ST:   array[0..05]   of byte; // MAC
     GSM_ENB:byte;
     SIM_ID:   array[0..19]   of byte; // ID ��� �����
     check:byte;
  end;

  //������������ ���������
  TterminalConfig = record
     head:byte;
     answer: byte;
     TerminalName: array[0..31]  of byte;  // ��� ���������
     ServerSyncTS: array[0..3]   of byte;  // TS ������������� � ��������. ������������ �� ����� ������. ��� ��������� ������ ���������� 0
     HWSetting1:   array[0..3]   of byte;  // hardware ��������� 1
     CANDriverName:array[0..15]  of byte;  // ��� ����� ��������
     CANDriverTS:  array[0..3]   of byte;  // UnixTime ����� ��������
     CANDriverData:array[0..99]  of byte;  // ������ ����� ��������
     HWSetting2:   array[0..44]  of byte;  // hardware ��������� 2
     WIFICfg:      array[0..114] of byte;  // ��������� wi-fi
     ServerAddress:array[0..37]  of byte;  // ����� �������
     ServerPort:   array[0..1]   of byte;  // ����
     HWSetting3:   array[0..19]  of byte;  // hardware ��������� 2
     check:byte;
  end;

  Tterminal = class
  const
    ATTEMPT_AMOUNT     = 5;        // ���������� ������� �������� ���������
    CMD_HEAD_REQUST    = $55;      // ��������� �������
    CMD_HEAD_RESPONSE  = $AA;      // ��������� ������
    CMD_TEST_CONNECT   = $01;      // ���� ����������
    CMD_CONFIG_READ    = $EC;      // ��������� ������������
    CMD_CONFIG_WRITE   = $ED;      // �������� ������������
    CMD_TERMINAL_INFO  = $0F;      // ���������� � ���������

  private
     FCommPort: TCommPortDriver;    // ���� ��� �������� ������ �� TCommPortDriver
     function getSumData:byte;      // ����� ������ ������ packageData
     function pa�kageChecked:byte;  // �������� ����������� ����
     function printformat(mac :Tarray<byte>; symbol :String =':'):String; //��������������
  public
     packageData:Tarray<byte>;      // ������ ��� �������� � ��������
     packageCmd:byte;               // ������� ��� ��������

     //-------���������� � ��������� --------------------------
     TerminalInfo : TterminalInfo;

     //-------������������ ��������� -------------------------
     TermianlConfig : TterminalConfig;

     CanDriverNameBuf : String;

     constructor Create(ACommPort: TCommPortDriver=nil);     // ����������� ������ � ����������

     function getSW:String;                                  // ��������� ������ �������� � ������� vX.X(dd.mm.YY)
     function getProdDate:String;                            // ���� ������������ ���������������
     function decodeCoding:String;                           // �������� �������� ����� (G|GC|GW|GWC)
     function getCANDriverTS:String;                         // ���� �������� CAN �����
     function getNameTerminal:String;                        // �������� ��� �������
     function getNameTerminalConfig:String;                  // ��� � ������������
     function makeCommad:Tarray<byte>;                       // ������� ����� ��� ��������
     function getCANDriverName:String;                       // ��� �������� CAN
     function checkAnswer(_data:Tarray<byte>): Tarray<byte>; // ����������� ����
     function getTerminalID:String;                          // ��������� ID ���������
     function getMacAp:String;                               // ��������� ���������������� MAC_AP
     function getMacST:String;                               // ��������� ���������������� MAC_ST
     function getSimID:String;                               // ��������� SIM_ID
     function getCANSpeed:String;                            // ��������� �������� CAN ����
     function getWifiNameAccessPoint:String;                 // ��������� �������� ����� �������
     function getWifiNameClientPoint:String;                 // ��������� �������� ���� ������� 
     function getServerAdress: String;                       // ��������� ������ �������
     function getServerPort: word;                           // ��������� ���� �������
     function getHWcanStatus : String;                       // ��������� ���������� � CAN �� HW setting1

     procedure setCanDriverName(name : String);// ���������� ��� ��������

     function stringToHex(strToConvert : String):TBytes;// �������������� � hex

     procedure ping;                                 // �������� �����
     procedure info;                                 // ���������� � ���������
     procedure clearInfo;                            // ������� ������ ����������
     procedure clearConfigInfo;                      // ������� ������ ������������
     procedure stopBootloader;                       // ����� �� ����������
     procedure getTerminalConfig;                    // �������� ������������
     procedure send(_data:Tarray<byte>);             // �������� ������
     procedure send�onfirmation(_data:Tarray<byte>); // �������� ������ �����������
     procedure firmware;
     procedure resetTerminal;
  end;

implementation

constructor Tterminal.Create(ACommPort: TCommPortDriver = nil);
begin
  FCommPort := ACommPort; // ����������� ������ �� TCommPortDriver ���� FCommPort
end;

procedure Tterminal.resetTerminal;
begin
  packageCmd := $F0;
  packageData := [$D9,$FF];
  send(Self.makeCommad);
end;

procedure Tterminal.setCanDriverName(name : String);
var _nameHex : Tbytes;
    _nameBuf : String;
    i:integer;
begin
  //��������� ��������� ��� ���
  FillChar(TermianlConfig.CANDriverName, SizeOf(TermianlConfig.CANDriverName), $20);

  //���� ��� ������ ��������
   if Length(name) > 16 then
    _nameBuf := Copy(name, 1, 16)
  else
    _nameBuf := name;

  //�������������
  _nameHex := TEncoding.ASCII.GetBytes(_nameBuf);

  //��������
  for  i:= 0 to Length(_nameBuf)-1 do
    TermianlConfig.CANDriverName[i] := _nameHex[i];

  TermianlConfig.CANDriverName[15] := 0;

end;

//�������� ��������� � ��������� ������ � ��������
procedure Tterminal.send�onfirmation(_data:Tarray<byte>);
var
  answer : byte;
  count : integer;
begin
  if Assigned(FCommPort) then
  begin
    count := 0;
    //��������� ������������ ���� � ����� �� ����� ���� $AA
    //��� �� ����������� ����� �������
    //��� �� ��������� ����������
    while True do
      begin
        FCommPort.SendData(_data,Length(_data));
        if (answer = CMD_HEAD_RESPONSE) or
           (count >= ATTEMPT_AMOUNT) or
           (FCommPort.Connected = false)
        then
            break;               
        inc(count);
      end;
  end;
end;

//�������� ��������� 
procedure Tterminal.send(_data:Tarray<byte>);
var
  answer : byte;
  count : integer;
begin
  if Assigned(FCommPort) and (FCommPort.Connected) then
  begin
    FCommPort.SendData(_data,Length(_data));
  end;
end;

//��������� ����� ���� ������
function Tterminal.getSumData:byte;
var
  sum:integer;
  ByteValue: Byte;
begin
  sum := 0;
  for ByteValue in packageData do
    Sum := Sum + ByteValue;

  result:=byte(sum);
end;

//�������� ������� ��� �������� �� ��������
//function Tterminal.makeCommad:Tarray<byte>;
//var _data:Tarray<byte>;
//    i,dataLength : integer;
//begin
//   dataLength := Length(packageData);
//   SetLength(_data,dataLength+3);
//   _data[0] := CMD_HEAD_REQUST;
//   _data[1] := packageCmd;
//
//   for i := 0 to dataLength-1 do
//      _data[i+2] := packageData[i];
//
//
//   _data[dataLength+2] := pa�kageChecked;
//
//   result := _data;
//end;

function Tterminal.makeCommad: TArray<Byte>;
var temp : Tarray<byte>;
begin
  Result := [CMD_HEAD_REQUST, packageCmd] + packageData + [pa�kageChecked];
end;

//��������� ������������ �����
function Tterminal.pa�kageChecked: Byte;
begin
  result := byte($FF - (CMD_HEAD_REQUST + packageCmd + getSumData));
end;

//�������� ����� � ����������
procedure Tterminal.ping;
begin
  packageCmd := CMD_TEST_CONNECT;
  packageData := [];
  send(Self.makeCommad);
end;

//��������� ������������
procedure Tterminal.getTerminalConfig;
begin
  packageCmd := CMD_CONFIG_READ;
  packageData := [];
  send(self.makeCommad);
end;

//��������� ���������� � ���������
procedure Tterminal.info;
begin
  try
    packageCmd := CMD_TERMINAL_INFO;
    packageData := [];
    send(self.makeCommad);
  finally

  end;

end;

//����� �� ������ ����������
procedure Tterminal.stopBootloader;
begin
  packageCmd := $FE;
  packageData:=[$49, $0B];
  send(self.makeCommad);
end;

// ������ ������������ � ��������
procedure Tterminal.firmware();
var
  _config : Tbytes;
  i: Integer;
  firmware : Tbytes;
begin
  SetLength(_config, Sizeof(TermianlConfig)-1);
  SetLength(firmware, 382);
  firmware[0] := $3F;
  firmware[1] := $51;
  Move(TermianlConfig, _config[0], Sizeof(TermianlConfig)-1);
  for I := 2 to 381 do
    firmware[i] := _config[i];
  packageCmd := CMD_CONFIG_WRITE;
  packageData:= firmware;
  send(self.makeCommad);
end;


//��������� ������
function Tterminal.checkAnswer(_data:Tarray<byte>): Tarray<byte>;
var i:integer;
begin

  //���������� � ���������
  if _data[1] = CMD_TERMINAL_INFO then
    begin
      if Length(_data) = SizeOf(TterminalInfo) then
        Move(_data[0], TerminalInfo, SizeOf(TterminalInfo));// �������� ������ � ���������
    end;

   //������������ ���������
  if _data[1] = CMD_CONFIG_READ then
    begin
      if Length(_data) = SizeOf(TterminalConfig) then
        Move(_data[0], TermianlConfig, SizeOf(TterminalConfig)); // �������� ������ � ���������
    end;
end;

//----------���. ���������------------------------------------------------------


// ��������� �������� �� ���������� � ���������
function Tterminal.getNameTerminal:String;
var
  asciiString: string;
  temp:array[0..32] of byte;
begin
//  TerminalInfo.name[32] := 0; //��������� ������ ����� ������
  move(TerminalInfo.name[0], temp, 32);
  temp[32] := 0;
  result := PAnsiChar(@temp);
end;

//��������� �������� �� ������������
function Tterminal.getNameTerminalConfig:String;
var
  asciiString: string;
  Temp:array[0..32] of byte;
begin
  move(TermianlConfig.TerminalName[0],Temp,32);
  Temp[32] := 0; //��������� ������ ����� ������
  result := PAnsiChar(@Temp[0]);
end;

//������� � ��������� �������� coding
function Tterminal.decodeCoding:String;
var 
  i, x :integer;
begin
//  //���� ���������� ����
  for i := 0 to 3 do
    if TerminalInfo.coding[i] <> $0 then x:=i;

  case TerminalInfo.coding[x] of
    $02: result:= 'G';
    $08: result:= 'W';
    $0A: result:= 'GW';
    $82: result:= 'GC';
    $88: result:= 'WC';
    $8A: result:= 'GWC';
  end;
end;

//��������� ���� ������������ 
function Tterminal.getProdDate:String;
var OutputStr: string;
begin
    // �������� �� ���������� ��������
  if (TerminalInfo.ProdDate[0] >= 1) and (TerminalInfo.ProdDate[0] <= 31) and
     (TerminalInfo.ProdDate[1] >= 1) and (TerminalInfo.ProdDate[1] <= 12) then
  begin
    // ����������� ���� � ������� "����.�����.���"
    OutputStr := Format('%.2d.%.2d.%d',
     [TerminalInfo.ProdDate[0],
     TerminalInfo.ProdDate[1],
     TerminalInfo.ProdDate[2]]
     );
  end
  else
  begin
    OutputStr := '������������ ����';
  end;
   result:=OutputStr;
end;

//��������� ������ �������� � ������� vX.X(dd.mm.YY)
function Tterminal.getSW:String;
begin
  result:= Format('v%d.%d(%.2d.%.2d.%d)',[
  TerminalInfo.SW[0],
  TerminalInfo.SW[1],
  TerminalInfo.SW[2],
  TerminalInfo.SW[3],
  TerminalInfo.SW[4]]
  );
end;

//�������� ���������� � ���������� ���������
procedure Tterminal.clearInfo;
var i:integer;
begin
   FillChar(terminalInfo, SizeOf(TterminalInfo), 0);
end;

//�������� ���������� � ������������ ���������
procedure Tterminal.clearConfigInfo;
var i:integer;
begin
  FillChar(TermianlConfig, SizeOf(TterminalConfig), 0);
end;

//�������� ��� �������� CAN
function Tterminal.getCANDriverName:String;
var
  asciiString: string;
  temp:array[0..17] of byte;
begin
  move(TermianlConfig.CANDriverName[0], temp, 16);
  result := PAnsiChar(@temp);
end;

//�������� ��������� ����� �������� CAN
function Tterminal.getCANDriverTS:String;
begin

end;

//�������������� ID � ������
function Tterminal.getTerminalID:String;
var st: string;
    i: integer;
begin
  for I := 0 to 3 do
    st := st + IntToHex(TerminalInfo.ID[i], 2);
  result := st;
end;

// �������������� �� ������� ������, � ������������
function Tterminal.printformat(mac :Tarray<byte>; symbol :String =':'):String;
var
  st : string;
  i : integer;
begin
  for  i := 0 to Length(mac)-1 do
    if i <> Length(mac)-1  then st := st + IntToHex(mac[i], 2)+symbol
                           else st := st + IntToHex(mac[i], 2);
  result:=st;
end;

//��������� MAC_AP
function Tterminal.getMacAp:String;
var 
  i : integer;
  len : integer;
  mac : Tarray<byte>;
begin
  if TerminalInfo.MAC_EN = $00 then
  begin
    result := '-:-:-:-:-:-';
    exit;
  end;
  len := Length(TerminalInfo.MAC_AP);
  SetLength(mac, len);
  for i := 0 to len-1 do
    mac[i] := TerminalInfo.MAC_AP[i];

  result := printformat(mac);
end;

//��������� MAC_ST
function Tterminal.getMacSt:String;
var
  i : integer;
  len : integer;
  mac : Tarray<byte>;
begin
  if TerminalInfo.MAC_EN = $00 then
  begin
    result := '-:-:-:-:-:-';
    exit;
  end;
  len := Length(TerminalInfo.MAC_ST);
  SetLength(mac, len);
  for i := 0 to len-1 do
    mac[i] :=  TerminalInfo.MAC_ST[i];

  result := printformat(mac);
end;

//��������� SIM_ID
function Tterminal.getSimID:String;
var
  SimIdWithoutLastByte: AnsiString;
begin
  //���� ���� ������� ���������� -
  if TerminalInfo.GSM_ENB = $00 then
    begin
      Result := '-';
      exit;
    end;
  SetString(SimIdWithoutLastByte, PAnsiChar(@TerminalInfo.SIM_ID[0]), Length(TerminalInfo.SIM_ID) - 1);
  result := SimIdWithoutLastByte;
end;

//��������� �������� CAN
function Tterminal.getCANSpeed:String;
var 
  speedBits: Integer;
begin
  try
// ������������� ��� ����� � ���� 16-������ �����
  speedBits := ( TermianlConfig.CANDriverData[4] shl 8) or TermianlConfig.CANDriverData[5];
  if speedBits <> 0 then result := floattostr(100000/speedBits);
  except

  end;

end;

// ��������� �������� ����� �������
function Tterminal.getWifiNameAccessPoint:String;
var
  asciiString: string;
begin
  result := PAnsiChar(@TermianlConfig.WIFICfg[2]);
end;

// ��������� �������� ����� ������� ������ ����
function Tterminal.getWifiNameClientPoint:String;
var
  asciiString: string;
begin
  result := PAnsiChar(@TermianlConfig.WIFICfg[48]);
end;

// ��������� ������ ����������� �������
function Tterminal.getServerAdress: String;
var
  asciiString: string;
begin
  result := PAnsiChar(@TermianlConfig.ServerAddress[0]);
end;

//��������� ����� ����������� �������
function Tterminal.getServerPort: Word;
var
  asciiString: string;
begin
  result :=  (TermianlConfig.ServerPort[0] shl 8) or TermianlConfig.ServerPort[1]
end;

// ��������� ������� CAN
function Tterminal.getHWcanStatus : String;
begin
  case TermianlConfig.HWSetting1[3] of
    $00: result:= '��������';
    $01: result:= '�������';
    $02: result:= '������� ����';
  end;
end;

//�������������� �� ������ � HEX
function Tterminal.stringToHex(strToConvert : String):TBytes;
var
  hexResult: TBytes;
  i: Integer;
begin
  Result := [];
  if strToConvert = '' then
    Exit;

  // ����������� ������ ������ ������ � ��� ����������������� ��������
  SetLength(hexResult, Length(strToConvert));
  for i := 0 to Length(strToConvert) - 1 do
  begin
    hexResult[i] := Ord(strToConvert[i + 1]);
  end;

  Result := hexResult;
end;


end.
