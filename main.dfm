object fr_main: Tfr_main
  Left = 0
  Top = 0
  Caption = 'Terminator'
  ClientHeight = 702
  ClientWidth = 918
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object lbInfo: TLabel
    Left = 510
    Top = 53
    Width = 31
    Height = 15
    Caption = 'lbInfo'
  end
  object mmTerminal: TMemo
    Left = 8
    Top = 50
    Width = 483
    Height = 611
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object btnConnection: TButton
    Left = 92
    Top = 19
    Width = 75
    Height = 25
    Action = switchConnection
    TabOrder = 1
  end
  object btnPing: TButton
    Left = 173
    Top = 19
    Width = 75
    Height = 25
    Caption = 'Ping'
    TabOrder = 2
    OnClick = btnPingClick
  end
  object Button4: TButton
    Left = 754
    Top = 19
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 3
    OnClick = Button4Click
  end
  object btnRead: TButton
    Left = 254
    Top = 19
    Width = 75
    Height = 25
    Caption = 'Read'
    TabOrder = 4
    OnClick = btnReadClick
  end
  object cbComPorts: TComboBox
    Left = 8
    Top = 21
    Width = 78
    Height = 23
    Style = csDropDownList
    Sorted = True
    TabOrder = 5
  end
  object btnWrite: TButton
    Left = 335
    Top = 19
    Width = 75
    Height = 25
    Caption = 'Write'
    TabOrder = 6
  end
  object btnClose: TButton
    Left = 835
    Top = 19
    Width = 75
    Height = 25
    Action = actClose
    TabOrder = 7
  end
  object btnInfo: TButton
    Left = 416
    Top = 19
    Width = 75
    Height = 25
    Caption = 'INFO'
    TabOrder = 8
    OnClick = btnInfoClick
  end
  object comPort: TCommPortDriver
    Port = pnCustom
    PortName = '\\.\COM2'
    BaudRate = brCustom
    BaudRateValue = 256000
    OnReceiveData = comPortReceiveData
    Left = 25
    Top = 595
  end
  object actList: TActionList
    Left = 80
    Top = 595
    object actConnect: TAction
      Caption = 'Connect'
      OnExecute = actConnectExecute
    end
    object actDisconnect: TAction
      Caption = 'Disconnect'
      OnExecute = actDisconnectExecute
    end
    object switchConnection: TAction
      Caption = 'Connect'
      OnExecute = switchConnectionExecute
    end
    object actClose: TAction
      Caption = 'Close'
      OnExecute = actCloseExecute
    end
  end
  object Notification1: TNotificationCenter
    Left = 140
    Top = 595
  end
end
