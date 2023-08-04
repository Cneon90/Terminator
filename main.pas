unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CPDrv, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    comPort: TCommPortDriver;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure comPortReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

type
  TtrmCommand = class
  public
    Head : byte;
    Command : array[0..20] of byte;
  end;


implementation

{$R *.dfm}

//test_branch_dev_test

procedure TForm1.Button1Click(Sender: TObject);
begin
 comPort.Connect;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  comPort.Disconnect;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  data: Array[0..2] of byte;
begin

  data[0] := $55;
  data[1] := $01;
  data[2] := $A9;

  comPort.SendData(@data[0], Length(data));

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 Memo1.Clear;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  data: Array[0..2] of byte;
begin

  data[0] := $55;
  data[1] := $EC;
  data[2] := $BE;

  comPort.SendData(@data[0], Length(data));
end;

procedure TForm1.comPortReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
var
  s: AnsiString;
  hexString: string;
  i: integer;
  buf:string;
begin
  // Копируем полученные байты в строку s
  SetString(s, PAnsiChar(DataPtr), DataSize);

  // Перебираем все байты в строке и конвертируем каждый байт в формат hex
  hexString := '';
  for i := 1 to Length(s) do
  begin
    hexString := hexString + IntToHex(Ord(s[i]), 2) + ' ';
  end;

  memo1.Lines.Append(hexString);
//  Memo1.Lines.Add(s);
end;


end.
