object fr_main: Tfr_main
  Left = 0
  Top = 0
  Margins.Left = 15
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Terminator'
  ClientHeight = 622
  ClientWidth = 1012
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  StyleElements = [seClient, seBorder]
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object plConnect: TPanel
    Left = 0
    Top = 0
    Width = 1012
    Height = 30
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1008
    object Label1: TLabel
      AlignWithMargins = True
      Left = 16
      Top = 7
      Width = 31
      Height = 19
      Margins.Left = 15
      Margins.Top = 6
      Margins.Right = 9
      Align = alLeft
      Caption = 'PORT:'
      ExplicitHeight = 15
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 940
      Top = 6
      Width = 31
      Height = 20
      Margins.Top = 5
      Align = alRight
      Caption = 'UART:'
      ExplicitHeight = 15
    end
    object spConnectins: TShape
      AlignWithMargins = True
      Left = 977
      Top = 1
      Width = 19
      Height = 25
      Margins.Top = 0
      Margins.Right = 15
      Align = alRight
      Brush.Color = clRed
      Shape = stCircle
      ExplicitLeft = 1096
      ExplicitTop = -4
      ExplicitHeight = 29
    end
    object Label3: TLabel
      AlignWithMargins = True
      Left = 861
      Top = 6
      Width = 48
      Height = 20
      Margins.Top = 5
      Align = alRight
      Caption = 'Terminal:'
      ExplicitHeight = 15
    end
    object spTerminal: TShape
      AlignWithMargins = True
      Left = 915
      Top = 1
      Width = 19
      Height = 25
      Margins.Top = 0
      Align = alRight
      Brush.Color = clRed
      Shape = stCircle
      ExplicitLeft = 1025
      ExplicitTop = -1
      ExplicitHeight = 26
    end
    object lbTerminalID: TLabel
      AlignWithMargins = True
      Left = 342
      Top = 4
      Width = 8
      Height = 22
      Margins.Left = 100
      Align = alLeft
      Alignment = taCenter
      Caption = '-'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBackground
      Font.Height = -19
      Font.Name = '@Microsoft JhengHei'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitHeight = 24
    end
    object cbComPorts: TComboBox
      AlignWithMargins = True
      Left = 59
      Top = 4
      Width = 100
      Height = 23
      Align = alLeft
      Style = csDropDownList
      Sorted = True
      TabOrder = 0
    end
    object btnConnection: TButton
      AlignWithMargins = True
      Left = 165
      Top = 4
      Width = 74
      Height = 22
      Action = switchConnection
      Align = alLeft
      TabOrder = 1
      ExplicitTop = 2
    end
  end
  object plGeneratorName: TPanel
    Left = 0
    Top = 215
    Width = 1012
    Height = 30
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 1008
    object Label4: TLabel
      AlignWithMargins = True
      Left = 16
      Top = 7
      Width = 37
      Height = 19
      Margins.Left = 15
      Margins.Top = 6
      Align = alLeft
      Caption = 'Model:'
      ExplicitHeight = 15
    end
    object Label5: TLabel
      AlignWithMargins = True
      Left = 269
      Top = 7
      Width = 18
      Height = 19
      Margins.Left = 15
      Margins.Top = 6
      Align = alLeft
      Caption = 'SN:'
      ExplicitHeight = 15
    end
    object Label6: TLabel
      AlignWithMargins = True
      Left = 534
      Top = 7
      Width = 34
      Height = 19
      Margins.Left = 15
      Margins.Top = 6
      Align = alRight
      Caption = 'Client:'
      ExplicitHeight = 15
    end
    object Label7: TLabel
      AlignWithMargins = True
      Left = 772
      Top = 7
      Width = 38
      Height = 19
      Margins.Left = 15
      Margins.Top = 6
      Align = alRight
      Caption = 'Park N:'
      ExplicitHeight = 15
    end
    object edNameSN: TEdit
      AlignWithMargins = True
      Left = 293
      Top = 4
      Width = 180
      Height = 22
      Align = alLeft
      TabOrder = 0
      OnChange = edNameModelChange
      ExplicitHeight = 23
    end
    object edNameModel: TEdit
      AlignWithMargins = True
      Left = 59
      Top = 4
      Width = 180
      Height = 22
      Margins.Right = 15
      Align = alLeft
      MaxLength = 10
      TabOrder = 1
      OnChange = edNameModelChange
      ExplicitHeight = 23
    end
    object edNameClient: TEdit
      AlignWithMargins = True
      Left = 574
      Top = 4
      Width = 180
      Height = 22
      Align = alRight
      MaxLength = 8
      TabOrder = 2
      OnChange = edNameModelChange
      ExplicitLeft = 570
      ExplicitHeight = 23
    end
    object edNameParkNumber: TEdit
      AlignWithMargins = True
      Left = 816
      Top = 4
      Width = 180
      Height = 22
      Margins.Right = 15
      Align = alRight
      MaxLength = 3
      TabOrder = 3
      OnChange = edNameModelChange
      ExplicitLeft = 812
      ExplicitHeight = 23
    end
  end
  object plFirmware: TPanel
    Left = 0
    Top = 245
    Width = 1012
    Height = 326
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 1008
    object plButtons: TPanel
      Left = 0
      Top = 0
      Width = 1012
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      StyleElements = []
      ExplicitWidth = 1008
      object lbconfigAll: TLabel
        AlignWithMargins = True
        Left = 309
        Top = 7
        Width = 3
        Height = 20
        Margins.Left = 10
        Margins.Top = 7
        Align = alLeft
        ExplicitHeight = 15
      end
      object btnLoadFromTerminal: TBitBtn
        AlignWithMargins = True
        Left = 15
        Top = 3
        Width = 146
        Height = 24
        Margins.Left = 15
        Margins.Right = 5
        Align = alLeft
        Caption = #1048#1079' '#1090#1077#1088#1084#1080#1085#1072#1083#1072
        Enabled = False
        ImageIndex = 0
        Images = imgList
        TabOrder = 0
        OnClick = btnLoadFromTerminalClick
        ExplicitTop = 2
      end
      object BitBtn2: TBitBtn
        AlignWithMargins = True
        Left = 890
        Top = 3
        Width = 107
        Height = 24
        Margins.Right = 15
        Align = alRight
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 1
        OnClick = BitBtn2Click
        ExplicitLeft = 886
      end
      object btnLoadConfAll: TBitBtn
        AlignWithMargins = True
        Left = 169
        Top = 3
        Width = 127
        Height = 24
        Align = alLeft
        Caption = #1048#1079' '#1092#1072#1081#1083#1072
        TabOrder = 2
        OnClick = btnLoadConfAllClick
      end
    end
    object gbName: TGroupBox
      Left = 0
      Top = 30
      Width = 1012
      Height = 50
      Align = alTop
      Caption = 'Terminal name'
      TabOrder = 1
      ExplicitWidth = 1008
      object Label8: TLabel
        AlignWithMargins = True
        Left = 862
        Top = 23
        Width = 27
        Height = 22
        Margins.Left = 15
        Margins.Top = 6
        Align = alRight
        Caption = 'Type:'
        ExplicitHeight = 15
      end
      object edTerminalName: TEdit
        AlignWithMargins = True
        Left = 17
        Top = 20
        Width = 456
        Height = 25
        Margins.Left = 15
        Align = alLeft
        MaxLength = 32
        ReadOnly = True
        TabOrder = 0
        ExplicitHeight = 23
      end
      object cbTypeTerminalName: TComboBox
        AlignWithMargins = True
        Left = 895
        Top = 20
        Width = 100
        Height = 23
        Margins.Right = 15
        Align = alRight
        Style = csDropDownList
        TabOrder = 1
        OnChange = cbTypeTerminalNameChange
        Items.Strings = (
          'Default'
          'Custom'
          'Generator')
        ExplicitLeft = 891
      end
    end
    object gbHW: TGroupBox
      AlignWithMargins = True
      Left = 7
      Top = 83
      Width = 245
      Height = 240
      Cursor = crHandPoint
      Margins.Left = 7
      Align = alLeft
      Caption = 'HW'
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 2
      object lbHW: TLabel
        AlignWithMargins = True
        Left = 12
        Top = 20
        Width = 203
        Height = 190
        Margins.Left = 10
        ParentCustomHint = False
        Align = alClient
        AutoSize = False
        BiDiMode = bdLeftToRight
        Color = clBtnFace
        EllipsisPosition = epPathEllipsis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        GlowSize = 10
        ParentBiDiMode = False
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        Touch.ParentTabletOptions = False
        Touch.TabletOptions = [toPressAndHold]
        Transparent = True
        WordWrap = True
        StyleElements = []
        OnClick = btnOptionHWClick
        ExplicitLeft = 0
        ExplicitHeight = 184
      end
      object Panel2: TPanel
        Left = 218
        Top = 17
        Width = 25
        Height = 196
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitHeight = 190
        object BitBtn4: TBitBtn
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 19
          Height = 25
          Align = alTop
          Caption = '...'
          TabOrder = 0
          OnClick = BitBtn4Click
        end
      end
      object btnOptionHW: TBitBtn
        Left = 2
        Top = 213
        Width = 241
        Height = 25
        Align = alBottom
        Caption = 'Default'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnOptionHWClick
        ExplicitLeft = 90
        ExplicitTop = 150
        ExplicitWidth = 75
      end
    end
    object gbCAN: TGroupBox
      AlignWithMargins = True
      Left = 258
      Top = 83
      Width = 245
      Height = 240
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'CAN'
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 3
      object lbCan: TLabel
        AlignWithMargins = True
        Left = 12
        Top = 20
        Width = 203
        Height = 190
        Margins.Left = 10
        Align = alClient
        WordWrap = True
        OnClick = btnOptionCANClick
        ExplicitWidth = 3
        ExplicitHeight = 15
      end
      object Panel1: TPanel
        Left = 218
        Top = 17
        Width = 25
        Height = 196
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitHeight = 190
        object BitBtn5: TBitBtn
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 19
          Height = 25
          Align = alTop
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = BitBtn5Click
        end
      end
      object btnOptionCAN: TBitBtn
        Left = 2
        Top = 213
        Width = 241
        Height = 25
        Align = alBottom
        Caption = 'Default'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnOptionCANClick
        ExplicitLeft = 4
        ExplicitTop = 187
      end
    end
    object gbWIFI: TGroupBox
      AlignWithMargins = True
      Left = 509
      Top = 83
      Width = 245
      Height = 240
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'WIFI'
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 4
      object lbWIFI: TLabel
        AlignWithMargins = True
        Left = 12
        Top = 20
        Width = 203
        Height = 190
        Margins.Left = 10
        Align = alClient
        WordWrap = True
        OnClick = btnOptionWIFIClick
        ExplicitWidth = 3
        ExplicitHeight = 15
      end
      object Panel3: TPanel
        Left = 218
        Top = 17
        Width = 25
        Height = 196
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitHeight = 190
        object BitBtn6: TBitBtn
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 19
          Height = 25
          Align = alTop
          Caption = '...'
          TabOrder = 0
          OnClick = BitBtn6Click
        end
      end
      object btnOptionWIFI: TBitBtn
        Left = 2
        Top = 213
        Width = 241
        Height = 25
        Align = alBottom
        Caption = 'Default'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnOptionWIFIClick
        ExplicitLeft = 4
        ExplicitTop = 187
      end
    end
    object gbServ: TGroupBox
      AlignWithMargins = True
      Left = 760
      Top = 83
      Width = 245
      Height = 240
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Server'
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 5
      object lbServ: TLabel
        AlignWithMargins = True
        Left = 12
        Top = 20
        Width = 203
        Height = 190
        Margins.Left = 10
        Align = alClient
        WordWrap = True
        OnClick = btnOptionServClick
        ExplicitWidth = 3
        ExplicitHeight = 15
      end
      object Panel4: TPanel
        Left = 218
        Top = 17
        Width = 25
        Height = 196
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitHeight = 190
        object BitBtn7: TBitBtn
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 19
          Height = 25
          Align = alTop
          Caption = '...'
          TabOrder = 0
          OnClick = BitBtn7Click
        end
      end
      object btnOptionServ: TBitBtn
        Left = 2
        Top = 213
        Width = 241
        Height = 25
        Align = alBottom
        Caption = 'Default'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnOptionServClick
        ExplicitLeft = 4
        ExplicitTop = 187
      end
    end
  end
  object btnFirmware: TBitBtn
    AlignWithMargins = True
    Left = 7
    Top = 574
    Width = 998
    Height = 45
    Margins.Left = 7
    Margins.Right = 7
    Align = alTop
    Caption = 'Firmware'
    ModalResult = 1
    TabOrder = 3
    OnClick = btnFirmwareClick
    ExplicitLeft = 2
  end
  object plInfo: TPanel
    Left = 0
    Top = 30
    Width = 1012
    Height = 185
    Align = alTop
    BevelOuter = bvNone
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 4
    ExplicitWidth = 1008
    object lbConfig: TLabel
      Left = 0
      Top = 0
      Width = 3
      Height = 185
      Align = alLeft
      ExplicitHeight = 15
    end
    object mmInfo: TMemo
      AlignWithMargins = True
      Left = 18
      Top = 5
      Width = 761
      Height = 177
      Margins.Left = 15
      Margins.Top = 5
      TabStop = False
      Align = alLeft
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      DoubleBuffered = True
      EditMargins.Auto = True
      HideSelection = False
      ParentColor = True
      ParentDoubleBuffered = False
      ReadOnly = True
      TabOrder = 0
      WantReturns = False
      WordWrap = False
      StyleElements = []
    end
  end
  object comPort: TCommPortDriver
    Port = pnCustom
    PortName = '\\.\COM2'
    BaudRate = brCustom
    BaudRateValue = 256000
    OnReceiveData = comPortReceiveData
    Left = 865
    Top = 50
  end
  object actList: TActionList
    Left = 865
    Top = 105
    object actConnect: TAction
      Category = 'UART'
      OnExecute = actConnectExecute
    end
    object actDisconnect: TAction
      Category = 'UART'
      Caption = 'Disconnect'
      OnExecute = actDisconnectExecute
    end
    object switchConnection: TAction
      Category = 'UART'
      Caption = 'Connect'
      OnExecute = switchConnectionExecute
    end
    object actTerminalConnect: TAction
      Category = 'Terminal'
      Caption = 'actTerminalConnect'
      OnExecute = actTerminalConnectExecute
    end
    object actTerminalDisconnect: TAction
      Category = 'Terminal'
      Caption = 'actTerminalDisconnect'
      OnExecute = actTerminalDisconnectExecute
    end
    object showfrTerminal: TAction
      Category = 'UART'
      Caption = 'showfrTerminal'
      OnExecute = showfrTerminalExecute
    end
    object actClose: TAction
      Caption = 'Close'
      OnExecute = actCloseExecute
    end
  end
  object Notification1: TNotificationCenter
    Left = 970
    Top = 105
  end
  object trmAvailableComports: TTimer
    Interval = 500
    OnTimer = trmAvailableComportsTimer
    Left = 900
    Top = 50
  end
  object MainMenu1: TMainMenu
    Left = 900
    Top = 105
    object N1: TMenuItem
      Action = showfrTerminal
      Caption = 'Terminal'
    end
    object Close1: TMenuItem
      Action = actClose
    end
  end
  object imgList: TImageList
    Left = 935
    Top = 105
    Bitmap = {
      494C010101000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      00000000000000000000000000000000000000000000FFFFFF04FFFFFF04FFFF
      FF02FFFFFF010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC03C3C3C3FFB0B0B0DFD9D9
      D92BF7F7F71FFFFFFF18FFFFFF0EFFFFFF08FFFFFF04FFFFFF01FFFFFF010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A8A8A857CECECEFAB5B5B5FFB6B6
      B6FF2C2C2CFFB4B4B4FFACACACD5DBDBDB2EF8F8F830FFFFFF30FFFFFF23FFFF
      FF17FFFFFF0EFFFFFF07FFFFFF04000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E2E2E21D686868C2BEBEBEFFBCBC
      BCFF8A8E8FFFB8B8B8FF9B9B9BFFA1A1A1FFB7B7B7FFBFBFBFFFA7A7A7C4DFDF
      DF30F8F8F842FFFFFF49FFFFFF3B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD026F6F6F95CCCCCCFFCBCB
      CBFFC8C8C8FF55899EFFC2C2C2FFBFBFBFFFBDBDBDFFB7B7B7FFA3A3A3FFB7B7
      B7FFB5B5B5FFC0C0C0FFE1E1E138000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE017F7F7F8DD4D4D4FFD3D3
      D3FFD1D1D1FF278AB7FF1F74ABFFCECECEFFCCCCCCFFC8C8C8FFC4C4C4FFC2C2
      C2FFBCBCBCFFA7A7A7FF5A5A5AFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD028D8D8D87DBDBDBFFDADA
      DAFF5A7AA0FFD3D4D5FF3FD5E7FFBDC7CBFFD4D4D4FFD3D3D3FFD2D2D2FFD1D1
      D1FFCFCFCFFFD3D3D3FFCACACAFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD029B9B9B83E2E2E2FFE1E1
      E1FF8CB8E2FF7CA4CAFF1E6A9DFF43E0EBFF5C778FFFDBDBDBFFDADADAFFD9D9
      D9FFD7D7D7FFE0E0E0FFD8D8D8FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE01AAAAAA80EAEAEAFFE9E9
      E9FFABCAE8FF79A1C6FF6C95BEFF45E1EEFF1D6894FF78A0CAFF6E96C6FF779E
      CAFFB9C2CEFFEAEAEAFF727272FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7B7B780F0F0F0FFF0F0
      F0FFEFEFEFFFEBEDEEFF7FA5B2FF1470A2FF50EFF2FF6688A8FF7097C2FF7EA9
      DAFFB7CDE6FFA6BAD1FFD3D2D2FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3C3C381F5F5F5FFF5F5
      F5FFF5F5F5FFF4F4F4FFF4F4F4FFF3F3F3FF54F5F5FF237CADFF708FAEFFCFE6
      FBFFC1D3E5FF96999CFF516CBEFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CDCDCD85F5F5F5FFF8F8
      F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFDFEAF0FFC4F9FDFFFCFCFCFFFCFC
      FCFFFCFCFCFFA8B3D4FF6873B4FFB9DBF5DE0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6D6D68CD1D1D180CFCF
      CF78CBCBCB73A9A9A9FDFCFCFCFFFEFEFEFFFEFEFEFFF7F6F6FFE4E4E6FFFEFE
      FEFFFEFEFEFFDDE8FBFFFDFDFDFFF9F9F9FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C9C9C93AEFEFEF78E1E1
      E176D9D9D974D2D2D271CECECE6BCFCFCF66D3D3D384C8C8C88BC9C9CAFFFEFE
      FEFFC5CBDBFFD8DDEFFFFFFFFFFFFDFDFDFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF9BFFFF
      FF8AF9F9F986F8F8F884F4F4F484EFEFEF88EBEBEB96E0E0E09BE0E0E09BDCDC
      DC98F4F4F480F3F3F384C1C1C1C0E2E2E2FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFB
      FB04DADADA25EAEAEA94FFFFFFA3ECECECAD000000000000000000000000FDFD
      FD02DCDCDC23EFEFEFA2D7D7D761000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0087FF000000000000001F000000000000
      0001000000000000000100000000000000010000000000000001000000000000
      0001000000000000000100000000000000010000000000008001000000000000
      8001000000000000800000000000000080000000000000008000000000000000
      C000000000000000E0E100000000000000000000000000000000000000000000
      000000000000}
  end
  object OpenDialog: TOpenDialog
    Left = 935
    Top = 50
  end
  object SaveDialog: TSaveDialog
    Title = 'SaveFile'
    Left = 970
    Top = 50
  end
end
