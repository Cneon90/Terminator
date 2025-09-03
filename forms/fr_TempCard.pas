unit fr_TempCard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, TempCard, chekSum, terminal, System.ImageList,
  Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Vcl.Buttons;

type
  TfrTempCard = class(TForm)
    plCardCode: TPanel;
    lbCardCode: TLabel;
    edCardCode: TEdit;
    checkAdmin: TCheckBox;
    plOperatorID: TPanel;
    lbOperatorID: TLabel;
    edOperatorID: TEdit;
    checkDriver: TCheckBox;
    plSpeed: TPanel;
    plIGNTime: TPanel;
    plWorkTime: TPanel;
    lbSpeed: TLabel;
    lbIGNTime: TLabel;
    lbWorkTime: TLabel;
    TrackSpeed: TTrackBar;
    TrackIGNTime: TTrackBar;
    TrackWorkTime: TTrackBar;
    lbSpeedVal: TLabel;
    lbIGNTimeVal: TLabel;
    lbWorkTimeVal: TLabel;
    checkMech: TCheckBox;
    checkPNR: TCheckBox;
    lbSpeedP: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OpenDialogTempCard: TOpenDialog;
    ImageCollection: TImageCollection;
    VirtualImageList: TVirtualImageList;
    btnLoad: TBitBtn;
    procedure TrackSpeedChange(Sender: TObject);
    procedure TrackIGNTimeChange(Sender: TObject);
    procedure TrackWorkTimeChange(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure edCardCodeChange(Sender: TObject);
    procedure edOperatorIDChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
//   FTempCard: TTempCard;
   procedure init();
   procedure ParseFileTempCard(Data: TArray<Byte>);
   procedure setTempCard(var TempCard : TTempCard);
  public
    { Public declarations }
    FTerminalPtr : ^TTerminal;
    procedure TempCardDisplay();
  end;

var
  frTempCard: TfrTempCard;

implementation

{$R *.dfm}

procedure TfrTempCard.edCardCodeChange(Sender: TObject);
begin
// FTerminalPtr^.TempCard.setCardCode(StrToInt(edCardCode.Text));
  if( not FTerminalPtr^.TempCard.setCardCode(edCardCode.Text))
  then edCardCode.Text := '';

end;

procedure TfrTempCard.edOperatorIDChange(Sender: TObject);
begin
  if( not FTerminalPtr^.TempCard.setOperatorID(edOperatorID.Text))
  then edOperatorID.Text := '';
end;

procedure TfrTempCard.FormClose(Sender: TObject; var Action: TCloseAction);
var
  bAdmin : boolean;
  bDriver : boolean;
  bMech   : boolean;
  bPNR    : boolean;
begin
  bAdmin  := checkAdmin.Checked;
  bDriver := checkDriver.Checked;
  bMech   := checkMech.Checked;
  bPNR    := checkPNR.Checked;

  FTerminalPtr^.TempCard.setAdmin(bAdmin);
  FTerminalPtr^.TempCard.setDriver(bDriver);
  FTerminalPtr^.TempCard.setMechan(bMech);
  FTerminalPtr^.TempCard.setPNR(bPNR);
end;

procedure TfrTempCard.FormShow(Sender: TObject);
begin
  TempCardDisplay();
end;

procedure TfrTempCard.init;
begin
  edCardCode.Text        := '';
  edOperatorID.Text      := '';
  TrackSpeed.Position    := 0;
  TrackIGNTime.Position  := 0;
  TrackWorkTime.Position := 0;
  checkAdmin.Checked     := false;
  checkDriver.Checked    := false;
  checkMech.Checked      := false;
  checkPNR.Checked       := false;
end;

procedure TfrTempCard.ParseFileTempCard(Data: TArray<Byte>);
var
  cardTempBuf : Tarray<byte>;
  crcbuf      : Tarray<byte>;
  ChecksumCalc: Word;
  ChecksumData: Word;
begin
    SetLength(cardTempBuf, 14);
    SetLength(crcbuf,      2);

    cardTempBuf := Copy(Data, 0,   14);
    crcbuf      := Copy(Data, 14, 2); // Данные временной карты

    ChecksumCalc := CalculateCRC16(cardTempBuf, 14);
    ChecksumData := (Word(crcbuf[1]) shl 8) or Word(crcbuf[0]);

    if ChecksumCalc <> ChecksumData then
    begin
      btnLoad.ImageIndex := 1;
      init();
      Exit;
    end;

    btnLoad.ImageIndex := 0;
//     set forms
    if(FTerminalPtr <> nil) then
    begin
      FTerminalPtr^.TempCard.ParseData(Data);
      TempCardDisplay();
    end;
end;

procedure TfrTempCard.btnLoadClick(Sender: TObject);
var
  TempCardFileStream  : TFileStream;
  cardTempBuf : Tarray<byte>;

begin
  btnLoad.ImageIndex := 0;
  if OpenDialogTempCard.Execute() then
  begin
//    imgTempCard.ImageIndex := -1;
    SetLength(cardTempBuf, 16);

    TempCardFileStream := TFileStream.Create(OpenDialogTempCard.FileName, fmOpenRead);
    TempCardFileStream.ReadBuffer(cardTempBuf[0],   16);
    TempCardFileStream.Position := 0;
    ParseFileTempCard(cardTempBuf);

  end;
end;

procedure TfrTempCard.setTempCard(var TempCard: TTempCard);
begin
//  edCardCode.Text         := TempCard.getCardCodeStr();
//  edOperatorID.Text       := IntToStr(TempCard.getOperatorID);
//  TrackSpeed.Position     := TempCard.getSpeed();
//  TrackIGNTime.Position   := round(TempCard.getIGNTime() / 60);
//  TrackWorkTime.Position  := round(TempCard.getWorkTime()/ 60);
//
//  checkAdmin.Checked  := TempCard.getIsAdmin();
//  checkDriver.Checked := TempCard.getIsDriver();
//  checkMech.Checked   := TempCard.getIsMechan();
//  checkPNR.Checked    := TempCard.getIsPNR();
end;

procedure TfrTempCard.TempCardDisplay();
begin
  edCardCode.Text         := FTerminalPtr^.TempCard.getCardCodeStr();
  edOperatorID.Text       := IntToStr(FTerminalPtr^.TempCard.getOperatorID);
  TrackSpeed.Position     := FTerminalPtr^.TempCard.getSpeed();
  TrackIGNTime.Position   := round(FTerminalPtr^.TempCard.getIGNTime() / 60);
  TrackWorkTime.Position  := round(FTerminalPtr^.TempCard.getWorkTime()/ 60);

  checkAdmin.Checked  := FTerminalPtr^.TempCard.getIsAdmin();
  checkDriver.Checked := FTerminalPtr^.TempCard.getIsDriver();
  checkMech.Checked   := FTerminalPtr^.TempCard.getIsMechan();
  checkPNR.Checked    := FTerminalPtr^.TempCard.getIsPNR();
end;

procedure TfrTempCard.TrackIGNTimeChange(Sender: TObject);
begin
  lbIGNTimeVal.Caption := IntToStr(TrackIGNTime.Position);

  FTerminalPtr^.TempCard.setIGNTime(TrackIGNTime.Position);
end;

procedure TfrTempCard.TrackSpeedChange(Sender: TObject);
var
  speedF : single;
begin
  speedF := TrackSpeed.Position / 10;

  lbSpeedVal.Caption := Format('%.1f', [speedF]);

  FTerminalPtr^.TempCard.setSpeed(TrackSpeed.Position);
end;

procedure TfrTempCard.TrackWorkTimeChange(Sender: TObject);
begin
  lbWorkTimeVal.Caption := IntToStr(TrackWorkTime.Position);

  FTerminalPtr^.TempCard.setWorkTime(TrackWorkTime.Position);
end;

end.
