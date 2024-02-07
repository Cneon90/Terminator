unit lib_db;

interface

Uses Data.DB, Data.Win.ADODB, System.SysUtils, Vcl.Dialogs,
//  fr_dbSetting,
//  fr_dbConfig,
   System.Classes, terminal, System.Generics.Collections;

Const

  // Названия таблиц
  TB_HW         = 'hw';
  TB_CAN        = 'can';
  TB_WIFI       = 'wifi';
  TB_SERVER     = 'serv';
  TB_GSM        = 'gsm';
  TB_WHOLE      = 'template';
  TB_WIFI_SERV  = 'wifi+server';

  TB_NEW_VER='terminal_configuration';



Type

  TTableType = record
    id:integer;
    Name:String;
    size:integer;
  end;

  TdbReadRec = record
    id: integer;
    Name: String;
    Data: Tbytes;
  end;

  TClientDB = class

  private


  public
    dbHost: String;                                                              // Хост базы данных
    dbPort: integer;                                                             // Порт базы данных
    dbName: String;                                                              // Имя базы данных
    dbLogin: String;                                                             // Логин базы данных
    dbPassword: String;                                                          // Пароль базы данных


    procedure dbRestoreRecord(tablename: String; id: integer);                  // Отключено (нет поля active)
    procedure dbDeleteRecord(tablename: String; id: integer);                   // Отключено (нет поля active)

    function getType(TableName:String):TTableType;                              // Получения типа записи (адаптация - для нового типа таблицы)

    function dbInsertConfig(configfHex: array of Byte; Name: String;
      tablename: String): Boolean;


    function LoadConfigFromDB(tablename: String; caption: String;
      DataSize: integer): TdbReadRec;


    function isExistsRec(tablename: String; id: integer): Boolean;
    function isExistsArrayRec(tablename: String; id: TArray<integer>)
      : TArray<integer>;



    function getConfig(tablename: String; id: TArray<integer>)
       : TDictionary< Integer, Tbytes>;






    function dbinitialTables: Boolean;
    function ConnectDB(host: String; port: String; dbName: String;
      login: String; Password: String): Boolean;
    constructor create(var _dbConnect: TADOConnection);
  end;

var
  dbConnection: TADOConnection;


implementation
// uses init;



// ------------------------DB----------------------------------------------------

// Удаление записи
procedure TClientDB.dbDeleteRecord(tablename: String; id: integer);
var
  Query: TADOQuery;
  TableType:TTableType;
begin
  Query := TADOQuery.create(nil);
  TableType := getType(tablename);
  try
    Query.Connection := dbConnection;
    Query.SQL.Text := Format('UPDATE %s SET deleted = 0 WHERE type_id = '+ TableType.id.ToString +' AND id = ''%d''',
      [tablename, id]);
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

// Восстановлеение записи
procedure TClientDB.dbRestoreRecord(tablename: String; id: integer);
var
  Query: TADOQuery;
  TableType:TTableType;
begin
  Query := TADOQuery.create(nil);
  TableType := getType(tablename);
  try
    Query.Connection := dbConnection;
    Query.SQL.Text := Format('UPDATE %s SET deleted = 1 WHERE type_id = '+ TableType.id.ToString +' AND id = ''%d''',
      [tablename, id]);
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;



 //Проверка существования
function TClientDB.isExistsRec(tablename: String; id: integer): Boolean;
var
  Query: TADOQuery;
  RecordCount: integer;
  TableType:TTableType;
begin
  Query := TADOQuery.create(nil);
  TableType := getType(tablename);
  try
    Query.Connection := dbConnection;
    Query.SQL.Text := 'SELECT COUNT(*) FROM ' + dbName + '.' + TB_NEW_VER +
      ' WHERE type_id = '+ TableType.id.ToString +' AND id = :ID';
    Query.Parameters.ParamByName('ID').Value := id;
    Query.Open;
    RecordCount := Query.Fields[0].AsInteger;

    result := RecordCount > 0;
  finally
    Query.Free;
  end;
end;


 //Проверка существования
function TClientDB.isExistsArrayRec(tablename: String; id: TArray<integer>)
  : TArray<integer>;
var
  Query: TADOQuery;
  IDList: string;
  i: integer;
  TableType:TTableType;
begin

  Query := TADOQuery.create(nil);
  TableType := getType(tablename);
  try
    Query.Connection := dbConnection;

    // Подготовка ID - перевод в строку
    IDList := '';
    for i := 0 to Length(id) - 1 do
    begin
      if i > 0 then
        IDList := IDList + ',';
      IDList := IDList + IntToStr(id[i]);
    end;

    Query.SQL.Text := 'SELECT id FROM ' + dbName + '.' + TB_NEW_VER +
      ' WHERE type_id = '+ TableType.id.ToString +' AND id IN (' + IDList + ')';
    Query.Open;

    SetLength(result, Query.RecordCount);
    var
    y := 0;
    while not Query.Eof do
    begin
      result[y] := Query.FieldByName('id').AsInteger;
      Query.Next;
      Inc(y);
    end;
  finally
    Query.Free;
  end;
end;


// ---------------NEW-----------------------------------------------------------

constructor TClientDB.create(var _dbConnect: TADOConnection);
begin
  dbConnection := _dbConnect;
end;

// Подключение к базе данных
function TClientDB.ConnectDB(host: String; port: String; dbName: String;
  login: String; Password: String): Boolean;
begin
  result := true;
  if dbConnection.Connected then
    dbConnection.close;
  try
    dbConnection.ConnectionString :=
      Format('Provider=MSDASQL.1;' + 'Password=%s;' +
      'Persist Security Info=False;' + 'User ID=%s;' + 'Extended Properties="' +
      'DSN=Mysql;' + 'DESCRIPTION=terminal;' + 'SERVER=%s;' + 'UID=%s;' +
      'PWD=%s;' + 'DATABASE=%s;' + 'PORT=%s"', [Password, login, host, login,
      Password, dbName, port]);
    dbConnection.Open;
  except
    on E: Exception do
    begin
      result := false;
    end;
  end;
end;

//// Чтение конфигурации из базы
//function TClientDB.LoadConfigFromDB(tablename: String; caption: String;
//  DataSize: integer): TdbReadRec;
//var
//  LoadConfigForm: Tfr_database_load;
//begin
//  LoadConfigForm := Tfr_database_load.create(nil);
//  try
//    LoadConfigForm.tablename := tablename;
//    LoadConfigForm.caption := 'Выберите:' + caption;
//    LoadConfigForm.Querydata.Size := DataSize;
//    LoadConfigForm.ShowModal;
//
//    if Length(LoadConfigForm.FieldHexData) <> 0 then
//    begin
//      result.id := LoadConfigForm.FieldId;
//      result.Name := LoadConfigForm.FieldName;
//      result.Data := LoadConfigForm.FieldHexData;
//    end;
//  finally
//    LoadConfigForm.Free;
//  end;
//end;

// Создание таблицы
function TClientDB.dbinitialTables: Boolean;
var
  Command: TADOCommand;
begin
  try
    Command := TADOCommand.create(nil);
    try
      Command.Connection := dbConnection;
      Command.CommandText := 'CREATE TABLE ' + TB_NEW_VER + ' (' +
        'id INT AUTO_INCREMENT PRIMARY KEY, ' +
        'type_id int(11), ' +
        'name VARCHAR(255) UNIQUE, ' +
        'data BLOB, ' +
        'timestamp DATETIME,' +
         'deleted BOOL DEFAULT 0' +
        ')';
      Command.Execute;

      result := true;
    except
      on E: Exception do
      begin
        result := false;
        if Pos('already exists', AnsiLowerCase(E.Message)) > 0 then
//        fr_main.sendMessage('Таблицы уже существуют');
      end;
    end;
  finally
    Command.Free;
  end;
end;

// Сохранение в базу данных
function TClientDB.dbInsertConfig(configfHex: array of Byte; Name: String;
  tablename: String): Boolean;
var
  Query: TADOQuery;
  buffer: array of Byte;
  len: integer;
  TableType:TTableType;
begin
  Query := TADOQuery.create(nil);
  try
    Query.Connection := dbConnection;

    if not dbConnection.Connected then
      dbConnection.Connected := true;

    Query.SQL.Text := Format('SELECT * FROM ' + dbName + '.%s', [TB_NEW_VER]);
    Query.Open;


    TableType := getType(tablename);
    len := TableType.size;
    SetLength(buffer, len);
    move(configfHex, buffer[0], len);

    try
      Query.Insert;
      Query.FieldByName('name').Value := name;
      Query.FieldByName('type_id').Value := TableType.id;

      Query.FieldByName('data').Value := buffer;
      Query.FieldByName('timestamp').Value := Now;
//      Query.FieldByName('active').Value := '1';
      Query.Post;
      MessageDlg('Запись успешно создана', TMsgDlgType.mtInformation,
        [mbOk], 0);
      result := true;
    except
      on E: Exception do
      begin
        MessageDlg('Запись с таким именем уже существует.', mtWarning,
          [mbOk], 0);
        result := false;
      end;
    end;
    Query.close;
  finally
    Query.Free;
  end;
end;


//Получить конфигурации по списку ids
function TClientDB.getConfig(tablename: String; id: TArray<integer>) : TDictionary<Integer,Tbytes>;
var
  Query: TADOQuery;
  RecordCount: integer;
  IDList: String;
  i: integer;
  TableType:TTableType;
begin

  // Подготовка ID - перевод в строку
  IDList := '';
  for i := 0 to Length(id) - 1 do
  begin
    if i > 0 then
      IDList := IDList + ',';
    IDList := IDList + IntToStr(id[i]);
  end;

  TableType := getType(tablename);

  Query := TADOQuery.create(nil);
  try
    Query.Connection := dbConnection;
    Query.SQL.Text := 'SELECT id, data FROM ' + dbName + '.' + TB_NEW_VER +
      ' WHERE id IN (' + IDList + ')';
    Query.Open;

//    i := 0;
    result := TDictionary<Integer,Tbytes>.Create;
    while not Query.Eof do
    begin
      result.Add(Query.FieldByName('id').AsInteger, Query.FieldByName('data').AsBytes);
      Query.Next;
//      Inc(i);
    end;

  except
//    MessageDlg('Ошибка SQL' , TMsgDlgType.mtError, [mbOk], 0 );
    Query.Free;
  end;
end;


// Получение типа записи
function TClientDB.getType(TableName: String): TTableType;
begin

  if TableName = TB_HW  then
  begin
    Result.id := 1;
    Result.Name := 'HW';
    Result.size := 69;
  end;

  if TableName = TB_CAN  then
  begin
    Result.id := 2;
    Result.Name := 'CAN';
    Result.size := 120;
  end;

  if TableName = TB_WIFI  then
  begin
    Result.id := 3;
    Result.Name := 'WIFI';
    Result.size := 115;
  end;

  if TableName = TB_SERVER  then
  begin
    Result.id := 4;
    Result.Name := 'SRV';
    Result.size := 40;
  end;

  if TableName = TB_WHOLE  then
  begin
    Result.id := 5;
    Result.Name := 'TMPL';
    Result.size := 380;
  end;

//  if TableName = TB_WIFI_SERV  then
//  begin
//    Result.id := 6;
//    Result.Name := 'WIFI+SERVER';
//    Result.size := 155;
//  end;

end;

end.
