unit database_select_config;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.Menus, Vcl.BaseImageCollection,
  Vcl.ImageCollection, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList;

type
  Tfr_database_load = class(TForm)
    btnClose: TBitBtn;
    btnOk: TBitBtn;
    DBGrid1: TDBGrid;
    Query: TADOQuery;
    DataSource: TDataSource;
    Queryid: TIntegerField;
    Queryname: TStringField;
    PopupMenu: TPopupMenu;
    DataCreate: TMenuItem;
    btnDelete: TButton;
    btnRestore: TButton;
    switchDelete: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    btnSwith: TBitBtn;
    VirtualImageList1: TVirtualImageList;
    ImageCollection1: TImageCollection;
    Querydata: TBlobField;
    Querytimestamp: TDateTimeField;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DataCreateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure switchDeleteClick(Sender: TObject);
    procedure btnRestoreClick(Sender: TObject);
    procedure btnSwithClick(Sender: TObject);
  private
    { Private declarations }
    procedure closeForm;
    procedure updateData(active:String);
    procedure dbdelete;
    procedure dbRestore;
  public
    { Public declarations }
    tableName: String;

    FieldHexData: Tbytes;
    FieldName: String;
    FieldId: integer;
  end;

var
  fr_database_load: Tfr_database_load;

implementation

{$R *.dfm}

uses main;

procedure Tfr_database_load.dbDelete;
begin
    switchDelete.Checked := True;
    updateData('0');
//    btnDelete.Visible := false;
//    btnRestore.Visible := true;
    Label1.Caption := '������ ��������� ������������';
    btnSwith.Hint := '�������� ������ ��������� ������������';
    btnSwith.ImageIndex := 1;
end;

procedure Tfr_database_load.dbrestore;
begin
    switchDelete.Checked := false;
    updateData('1');
//    btnDelete.Visible := True;
//    btnRestore.Visible := false;
    btnSwith.ImageIndex := 0;
    btnSwith.Hint := '�������� ������ ��������� ������������';
    Label1.Caption := '������ ��������� ������������';
end;

//'1'-�������� '0'-���������
procedure Tfr_database_load.updateData(active:String);
var   TableType:TTableType;
begin
//  Query.SQL.Text := Format('SELECT * FROM '+ fr_main.dbName +'.%s WHERE active=%s', [tableName, active]);
  TableType := fr_main.getType(tablename);
  Query.SQL.Text := 'SELECT * FROM '+ fr_main.dbName +'.' + TB_NEW_VER +' WHERE deleted = 0 AND type_id = :TypeIDParam order by name';
  Query.Parameters.ParamByName('TypeIDParam').Value := TableType.id;
  DBGrid1.DataSource := DataSource;
  DataSource.DataSet := Query;
  Query.Open;
end;

procedure Tfr_database_load.btnSwithClick(Sender: TObject);
begin
  if switchDelete.Checked then dbrestore
                          else dbDelete;
end;

procedure Tfr_database_load.btnDeleteClick(Sender: TObject);
begin
 if MessageDlg('�� �������, ��� ������ ������� "'+Queryname.Value+'"?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;

 fr_main.dbDeleteRecord(tableName, Queryid.Value);
 dbrestore;
end;

procedure Tfr_database_load.closeForm;
begin
  if switchDelete.Checked then
  begin
    dbrestore;
    exit;
  end else
  begin
    FieldName := Queryname.Value;
    FieldHexData := Querydata.Value;
    FieldId := Queryid.Value;
    close;
  end;
end;

procedure Tfr_database_load.btnOkClick(Sender: TObject);
begin
  closeForm;
end;


procedure Tfr_database_load.btnRestoreClick(Sender: TObject);
begin
 if MessageDlg('�� �������, ��� ������ ������������ "'+Queryname.Value+'"?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
 fr_main.dbRestoreRecord(tableName, Queryid.Value);
 dbrestore;
end;

procedure Tfr_database_load.DBGrid1DblClick(Sender: TObject);
begin
  closeForm;
end;

procedure Tfr_database_load.FormShow(Sender: TObject);
begin
  dbrestore;
end;

procedure Tfr_database_load.switchDeleteClick(Sender: TObject);
begin
  if switchDelete.Checked then dbrestore
                          else dbDelete;
end;

procedure Tfr_database_load.DataCreateClick(Sender: TObject);
begin
  if DataCreate.Checked then
    begin
      DataCreate.Checked := false;
      DBGrid1.Columns[2].Visible := false;
    end else
    begin
      DBGrid1.Columns[2].Visible := true;
      DataCreate.Checked := true;
    end;
end;

end.
