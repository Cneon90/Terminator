object fr_Terminal: Tfr_Terminal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Terminal'
  ClientHeight = 427
  ClientWidth = 641
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object mmTerminal: TMemo
    Left = 0
    Top = 41
    Width = 641
    Height = 386
    Align = alClient
    DoubleBuffered = True
    ParentDoubleBuffered = False
    ScrollBars = ssBoth
    TabOrder = 0
    ExplicitWidth = 635
    ExplicitHeight = 380
  end
  object plButtons: TPanel
    Left = 0
    Top = 0
    Width = 641
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 635
    object btnExit: TButton
      Left = 570
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Exit'
      TabOrder = 0
      OnClick = btnExitClick
    end
    object Button1: TButton
      Left = 475
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Print'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button4: TButton
      Left = 413
      Top = 9
      Width = 50
      Height = 25
      Caption = 'Clear'
      TabOrder = 2
      OnClick = Button4Click
    end
    object btnGetName: TButton
      Left = 332
      Top = 9
      Width = 75
      Height = 25
      Caption = 'GetName'
      Enabled = False
      TabOrder = 3
      OnClick = btnGetNameClick
    end
    object btnInfo: TButton
      Left = 251
      Top = 9
      Width = 75
      Height = 25
      Caption = 'INFO'
      Enabled = False
      TabOrder = 4
      OnClick = btnInfoClick
    end
    object btnWrite: TButton
      Left = 170
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Write'
      Enabled = False
      TabOrder = 5
    end
    object btnRead: TButton
      Left = 89
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Read'
      Enabled = False
      TabOrder = 6
      OnClick = btnReadClick
    end
    object btnPing: TButton
      Left = 8
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Ping'
      Enabled = False
      TabOrder = 7
      OnClick = btnPingClick
    end
  end
end
