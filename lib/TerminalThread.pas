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
 //����� com-port
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

implementation

//����������� ������
constructor TTerminalThread.Create(ACommPort: TCommPortDriver = nil; DataReceivedCallback: TDataReceivedCallback = nil);
begin
  inherited Create(True);
  FCommPort := ACommPort;
  FDataReceivedCallback := DataReceivedCallback;
  FTerminateEvent := TEvent.Create(nil, True, False, '');
  FTerminal := Tterminal.Create(FCommPort);
  FCommPort.OnReceiveData := CommPortReceiveData;
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
    if FCommPort.Connected then
    begin
      FTerminal.info;
      sleep(1000);
    end;
  end;
end;

end.