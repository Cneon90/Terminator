unit SERVEREdit;

interface
  uses
    Terminal;

  type

    TServerEdit = class
      private
        FHost : array[0..37]  of byte;  // Адрес сервера
        FPort : word;
        ConfigBuf : TConfig;
      public
        procedure setHWSettings(_ServerSettings:Tconfig);
    end;

implementation

{ TServerEdit }



{ TServerEdit }

procedure TServerEdit.setHWSettings(_ServerSettings:Tconfig);
begin
   ConfigBuf := _ServerSettings;

end;

end.
