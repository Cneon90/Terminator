unit Terminal;

interface

 uses CPDrv;

type
  Tterminal = class
  const
    CMD_HEAD_REQUST    = $55;
    CMD_HEAD_RESPONSE  = $AA;
    CMD_TEST_CONNECT   = $01;
    CMD_CONFIG_READ    = $EC;
    CMD_CONFIG_WRITE   = $ED;
    CMD_TERMINAL_INFO  = $0F;


  private
     FCommPort: TCommPortDriver; // ���� ��� �������� ������ �� TCommPortDriver
     function pa�kageChecked:byte;
     function getSumData:byte;
     function getParams(_data: Tarray<byte>; index:integer; ofset : integer):Tarray<byte>;
     procedure _getSN(_data:array of byte);
  public
     packageData:Tarray<byte>;
     packageCmd:byte;
     ProdDate : array[0..2] of byte;
     serialNumber : array[0..3] of byte;
     coding:array[0..4] of byte;
     SW:array[0..5] of byte;
     name:array[0..5] of byte;
     MAC_AP:array[0..6] of byte;
     MAC_ST:array[0..6] of byte;
     GSM_EN:byte;
     SIM_ID:array[0..20] of byte;


     constructor Create(ACommPort: TCommPortDriver); // ����������� ������ � ����������
     function makeCommad:Tarray<byte>;
     function checkAnswer(_data:Tarray<byte>): Tarray<byte>;
     procedure ping;
     procedure getTerminalConfig;
     procedure send(_data:Tarray<byte>);
     procedure info;

  end;



implementation


constructor Tterminal.Create(ACommPort: TCommPortDriver);
begin
  FCommPort := ACommPort; // ����������� ������ �� TCommPortDriver ���� FCommPort
end;

//�������� � �������
procedure Tterminal.send(_data:Tarray<byte>);
begin
  if Assigned(FCommPort) then
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
function Tterminal.makeCommad:Tarray<byte>;
var _data:Tarray<byte>;
    i,dataLength : integer;
begin
   dataLength := Length(packageData);
   SetLength(_data,dataLength+3);
   _data[0] := CMD_HEAD_REQUST;
   _data[1] := packageCmd;

   for i := 0 to dataLength-1 do
      _data[i+2] := packageData[i];

   _data[dataLength+2] := pa�kageChecked;

   result := _data;
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

//�������� ����� � ����������
procedure Tterminal.getTerminalConfig;
begin
  packageCmd := CMD_CONFIG_READ;
  packageData := [];
  send(Self.makeCommad);
end;

//��������� ���������� � ���������
procedure Tterminal.info;
begin
  packageCmd := CMD_TERMINAL_INFO;
  packageData := [];
  send(self.makeCommad);
end;

procedure Tterminal._getSN(_data:array of byte);
begin
  serialNumber[0] := _data[5];
  serialNumber[1] := _data[6];
  serialNumber[2] := _data[7];
  serialNumber[3] := _data[8];
end;


function Tterminal.getParams( _data: Tarray<byte>; index:integer; ofset : integer):Tarray<byte>;
var
   buf : Tarray<byte>;
   i, len :integer;
begin
   len :=  ofset - index;
   SetLength(buf, len);
   for i := 0 to len - 1 do
      begin
        buf[i] := _data[i+1];
      end;

   result := buf;
end;


function Tterminal.checkAnswer(_data:Tarray<byte>): Tarray<byte>;
var i:integer;
begin
  if _data[0] <> CMD_HEAD_RESPONSE then exit;

  //��������� ����������
  if _data[1] = CMD_TERMINAL_INFO then
    begin

    for i := 0 to 2 do
      ProdDate[i] := _data[i+2];

    for i := 0 to 3 do
      serialNumber[i] := _data[i+5];

    for i := 0 to 3 do
      coding[i] := _data[i+9];

//    for i := 0 to 3 do
//      SW[i] := _data[i+5];
//
//
//    for i := 0 to 3 do
//      name[i] := _data[i+5];
//
//
//    for i := 0 to 2 do
//      MAC_AP[i] := _data[i+2];
//
//    for i := 0 to 3 do
//      MAC_ST[i] := _data[i+5];
//
//    GSM_EN := _data[40];
//
//    for i := 0 to 3 do
//      SIM_ID[i] := _data[i+5];
    end;


end;


end.
