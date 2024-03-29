unit association;

interface
  uses registry, Winapi.Windows, SysUtils;

//  const
//  FileExt = '.dks';
//  FileDescr = 'DKS_View_File';
//  FileTitle = 'Delphi Kingdom Sample file';
//  OpenCommand = '&�������';
//  ViewCommand = '&�����������';

  type
    TAssocData = record
      Extension   : String;
      Description : String;
      KeyName     : String;
      AppName     : String;
    end;

    TAssociation = class
      private
        Reg: TRegistry;
      public
        procedure add(data : TAssocData);
        constructor create;
    end;

implementation

{ TAssociation }

constructor TAssociation.create;
begin
//  Reg := TRegistry.Create;
//  Reg.RootKey := HKEY_CURRENT_USER; // HKEY_CLASSES_ROOT; // ��������� �������� �����
end;


procedure TAssociation.add(data : TAssocData);
begin


// Reg.OpenKey('.' + data.Extension, True);
// Reg.WriteString('', data.KeyName);
// Reg.CloseKey;
//
//
//  Reg.OpenKey(data.KeyName, True);
//  Reg.WriteString('', data.Description);
//  Reg.CloseKey;
//
//
//  Reg.OpenKey(data.KeyName + '\DefaultIcon', True);
//  Reg.WriteString('', data.AppName + ',0');
//  Reg.CloseKey;
//
//
//  Reg.OpenKey(data.KeyName + '\Shell\Open\Command', True);
//  Reg.WriteString('', '"' + ExtractFilePath(ParamStr(0)) + data.AppName + '" "%1"');
//  Reg.CloseKey;

//try
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CLASSES_ROOT;
    if Reg.OpenKey('.' + data.Extension, True) then
    begin
      Reg.WriteString('', data.KeyName);
      Reg.CloseKey;
    end;

    if Reg.OpenKey(data.KeyName, True) then
    begin
      Reg.WriteString('', data.Description);
      Reg.CloseKey;
    end;

    if Reg.OpenKey(data.KeyName + '\DefaultIcon', True) then
    begin
      Reg.WriteString('', data.AppName + ', 0');
      Reg.CloseKey;
    end;

    if Reg.OpenKey(data.KeyName + '\Shell\Open\Command', True) then
    begin
      Reg.WriteString('', '"' + ExtractFilePath(ParamStr(0)) + data.AppName + '" "%1"');
      Reg.CloseKey;
    end;

//  finally

    Reg.Free;
//  end;




//  Reg.OpenKey('\' + data.FileExt, True);
//  Reg.WriteString('', data.FileDescr);
//  Reg.OpenKey('\' + data.FileDescr, True);
//  Reg.WriteString('', data.FileTitle);
//  Reg.OpenKey('Shell', True);
//  Reg.OpenKey('Open', True);
//  Reg.WriteString('', data.OpenCommand);
//  Reg.OpenKey('command', True);
//  Reg.WriteString('', '"' + ParamStr(0) + '" "%1"');
//  Reg.OpenKey('\' + data.FileDescr, True);
//  Reg.OpenKey('Shell', True);
//  Reg.OpenKey('View', True);
//  Reg.WriteString('', data.ViewCommand);
//  Reg.OpenKey('command', True);
//  Reg.WriteString('', '"' + ParamStr(0) + '" "%1" /v');
//  Reg.OpenKey('\' + data.FileDescr, True);
//  Reg.OpenKey('DefaultIcon', True);
//  Reg.WriteString('', ParamStr(0) + ',0');

end;


end.
