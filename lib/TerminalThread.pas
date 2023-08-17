unit TerminalThread;

interface

uses
  CPDrv,
  SysUtils,
  DateUtils,
  System.Classes,
  terminal,
  SyncObjs;

type
  TDataReceivedCallback = procedure(const Data: TArray<Byte>) of object;
  TTerminalThread = class(TThread)

  private
    { Private declarations }
  protected
    FTerminateEvent: TEvent;
    procedure Execute; override;

  public
   TerminateEvent: TEvent;
    FCommPort: TCommPortDriver;
    FTerminal: Tterminal;
    FDataReceivedCallback: TDataReceivedCallback;
    procedure CommPortReceiveData(Sender: TObject; DataPtr: Pointer;  DataSize: Cardinal);
    constructor Create(ACommPort: TCommPortDriver = nil; DataReceivedCallback: TDataReceivedCallback = nil);
  end;

var
  pingData: Tbytes;
  DataPtr: Pointer;
  DataSize: Cardinal;
  count : integer;

implementation

//����������� ������
constructor TTerminalThread.Create(
    ACommPort: TCommPortDriver = nil;
    DataReceivedCallback: TDataReceivedCallback = nil
);
begin
  inherited Create(True);
  FCommPort := ACommPort;
  FDataReceivedCallback := DataReceivedCallback;
  FTerminateEvent := TEvent.Create(nil, True, False, '');
  FTerminal := Tterminal.Create(FCommPort);
  FCommPort.OnReceiveData := CommPortReceiveData;
  pingData :=[$FF,$FF,$F0,$FE];
  count:=0;
end;

//���� ������
procedure TTerminalThread.CommPortReceiveData(Sender: TObject; DataPtr: Pointer;  DataSize: Cardinal);
var
  hexString: string;
  buf: TArray<byte>;

begin
  try
    SetLength(buf, DataSize);
    Move(DataPtr^, buf[0], DataSize);
    if buf[0] = $AAthen
      begin
        count := 0;
        pingData :=[$F0,$FE,$FF,$FF]
      end
    else inc(count);

    if count = 2 then
    begin
       pingData :=[$FF,$FF,$F0,$FE];
       count:=0;
    end;



    if buf[1] = $F0 then Fterminal.stopBootloader;
    if Assigned(FDataReceivedCallback) then
      FDataReceivedCallback(buf);
  except
  on E: Exception do
    begin
 // ��������� ����������
//     sendMessage('������: ' + E.Message);
    end;
  end;
end;

//�����
procedure TTerminalThread.Execute;
begin
  while not Terminated do
  begin
    DataPtr := @pingData[0];
    DataSize := SizeOf(pingData);
    CommPortReceiveData(nil,  DataPtr, DataSize);
    try
      if FCommPort.Connected then  FTerminal.info;
    except
      FCommPort.Disconnect;
    end;
    sleep(1000);
  end;
end;

end.
