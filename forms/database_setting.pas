unit database_setting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList,
  Vcl.BaseImageCollection, Vcl.ImageCollection;

type
  Tfr_database = class(TForm)
    pnSetting: TPanel;
    btnClose: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edHost: TEdit;
    edPort: TEdit;
    edDatabaseName: TEdit;
    edLogin: TEdit;
    edPassword: TEdit;
    btnSave: TButton;
    btnShowPassword: TButton;
    btnConnectDb: TButton;
    spHost: TShape;
    spDbName: TShape;
    spLogin: TShape;
    spPort: TShape;
    spPassword: TShape;
    btnInitTables: TButton;
    Image1: TImage;
    img: TImageCollection;
    imgCollect: TVirtualImageList;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnShowPasswordClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnConnectDbClick(Sender: TObject);
    procedure edHostChange(Sender: TObject);
    procedure edPortChange(Sender: TObject);
    procedure edDatabaseNameChange(Sender: TObject);
    procedure edLoginChange(Sender: TObject);
    procedure edPasswordChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnInitTablesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fr_database: Tfr_database;
   changeSetting : boolean;

implementation

{$R *.dfm}
uses main;

procedure Tfr_database.btnCloseClick(Sender: TObject);
begin
 close;
end;

procedure Tfr_database.btnConnectDbClick(Sender: TObject);
begin
 if fr_main.connectDB(edHost.Text,
                   edPort.Text,
                   edDatabaseName.Text,
                   edLogin.Text,
                   edPassword.Text) then close;
end;

procedure Tfr_database.btnInitTablesClick(Sender: TObject);
begin
 if fr_main.dbinitialTables then fr_main.sendMessage('������� ������� �������')
                            else fr_main.sendMessage('�� ������� ������� �������');
end;

procedure Tfr_database.btnSaveClick(Sender: TObject);
begin
  fr_main.dbHost :=  edHost.Text;
  fr_main.dbPort := strToInt(edPort.Text);
  fr_main.dbName := edDatabaseName.Text ;
  fr_main.dbLogin := edLogin.Text;
  fr_main.dbPassword := edPassword.Text;
  fr_main.SaveSettings;

  spHost.Visible := false;
  spPort.Visible := false;
  spDbName.Visible := false;
  spLogin.Visible := false;
  spPassword.Visible := false;
  changeSetting := false;
  fr_main.sendMessage('��������� ���������');
end;

procedure Tfr_database.btnShowPasswordClick(Sender: TObject);
begin
  if edPassword.PasswordChar = #0 then
  begin
    edPassword.PasswordChar:= '*';
    btnShowPassword.ImageIndex := 3;
    btnShowPassword.hint := '�������� ������';
  end else
  begin
    edPassword.PasswordChar:= #0;
    btnShowPassword.ImageIndex := 4;
    btnShowPassword.hint := '������ ������';
  end;

end;

procedure Tfr_database.edDatabaseNameChange(Sender: TObject);
begin
  spDbName.Visible := true;
end;

procedure Tfr_database.edHostChange(Sender: TObject);
begin
  spHost.Visible := true;
  changeSetting := true;
end;

procedure Tfr_database.edLoginChange(Sender: TObject);
begin
  spLogin.Visible := true;
  changeSetting := true;
end;

procedure Tfr_database.edPasswordChange(Sender: TObject);
begin
  spPassword.Visible := true;
  changeSetting := true;
end;

procedure Tfr_database.edPortChange(Sender: TObject);
begin
  spPort.Visible := true;
  changeSetting := true;
end;

procedure Tfr_database.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if changeSetting and (MessageDlg('��������� �� ���������'+#13+'������ ����������?', mtConfirmation, [mbYes, mbNo], 0) = mrNo)
    then CanClose := false;
end;

procedure Tfr_database.FormCreate(Sender: TObject);
begin
  edHost.Text := fr_main.dbHost;
  edPort.Text := intToStr(fr_main.dbPort);
  edDatabaseName.Text := fr_main.dbName;
  edLogin.Text := fr_main.dbLogin;
  edPassword.Text := fr_main.dbPassword;
  spHost.Visible := false;
  spPort.Visible := false;
  spDbName.Visible := false;
  spLogin.Visible := false;
  spPassword.Visible := false;
  changeSetting := false;
end;

end.
