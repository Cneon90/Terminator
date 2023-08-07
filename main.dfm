object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
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
  object Memo1: TMemo
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
  object Button3: TButton
    Left = 280
    Top = 19
    Width = 75
    Height = 25
    Caption = 'Ping'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 442
    Top = 19
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 361
    Top = 19
    Width = 75
    Height = 25
    Caption = 'Read'
    TabOrder = 4
    OnClick = Button5Click
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
  end
  object Notification1: TNotificationCenter
    Left = 140
    Top = 595
  end
end
