object frHWEdit: TfrHWEdit
  Left = 674
  Top = 42
  Margins.Left = 0
  Margins.Right = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' HW'
  ClientHeight = 876
  ClientWidth = 839
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Consolas'
  Font.Style = []
  Position = poDesigned
  StyleName = 'Glow'
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  TextHeight = 24
  object plButtons: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 829
    Width = 839
    Height = 47
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    Caption = 'plButtons'
    ShowCaption = False
    TabOrder = 0
    StyleName = 'Glow'
    ExplicitTop = 825
    ExplicitWidth = 837
    object btnClose: TButton
      AlignWithMargins = True
      Left = 695
      Top = 4
      Width = 140
      Height = 39
      Cursor = crHandPoint
      Align = alRight
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      OnClick = btnCloseClick
      ExplicitLeft = 693
    end
    object btnSave: TButton
      AlignWithMargins = True
      Left = 549
      Top = 4
      Width = 140
      Height = 39
      Cursor = crHandPoint
      Align = alRight
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      OnClick = btnSaveClick
      ExplicitLeft = 547
    end
    object btnReset: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 140
      Height = 39
      Cursor = crHandPoint
      Align = alLeft
      Caption = #1042#1077#1088#1085#1091#1090#1100
      TabOrder = 2
      OnClick = btnResetClick
    end
  end
  object ScrollBox: TScrollBox
    AlignWithMargins = True
    Left = 0
    Top = 0
    Width = 839
    Height = 826
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    VertScrollBar.Position = 469
    VertScrollBar.Smooth = True
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    OnMouseWheelDown = ScrollBoxMouseWheelDown
    OnMouseWheelUp = ScrollBoxMouseWheelUp
    ExplicitWidth = 837
    ExplicitHeight = 822
    object plAccessControl: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 612
      Width = 812
      Height = 35
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 26
      ExplicitWidth = 810
      object lbAccessControl: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '             Access control:'
        ExplicitHeight = 24
      end
      object cbAccessControl: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        CanUndoSelText = True
        TabOrder = 0
      end
    end
    object plBeep2: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 325
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 19
      ExplicitWidth = 810
      object lbBeep2: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '                 BEEP2 Mode:'
        ExplicitHeight = 24
      end
      object cbBeep2Mode: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
    object plCanDriver: TPanel
      AlignWithMargins = True
      Left = 3
      Top = -290
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 4
      ExplicitWidth = 810
      object lbCanDriverLabel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '                 Can driver:'
        ExplicitHeight = 24
      end
      object cbCanDriver: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
    object plCardEnabledTimeout: TPanel
      AlignWithMargins = True
      Left = 3
      Top = -208
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 6
      ExplicitWidth = 810
      object lbCardEnabledTimeoutLablel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '       Card enabled timeout:'
        ExplicitHeight = 24
      end
      object lbCardEnabled: TLabel
        AlignWithMargins = True
        Left = 746
        Top = 5
        Width = 12
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = 's'
        ExplicitHeight = 24
      end
      object edCardEnabledTimeout: TEdit
        AlignWithMargins = True
        Left = 345
        Top = 0
        Width = 383
        Height = 35
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnChange = edCardEnabledTimeoutChange
        OnClick = edCardEnabledTimeoutClick
        OnKeyDown = edCardEnabledTimeoutKeyDown
        OnKeyPress = edCardEnabledTimeoutKeyPress
        OnMouseMove = edCardEnabledTimeoutMouseMove
        ExplicitHeight = 32
      end
      object sbCardEnabledTimeout: TSpinButton
        AlignWithMargins = True
        Left = 728
        Top = 1
        Width = 15
        Height = 33
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 1
        Margins.Right = 0
        Margins.Bottom = 1
        Align = alLeft
        DownGlyph.Data = {
          0E010000424D0E01000000000000360000002800000009000000060000000100
          200000000000D800000000000000000000000000000000000000008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000008080000080800000808000000000000080800000808000008080000080
          8000008080000080800000808000000000000000000000000000008080000080
          8000008080000080800000808000000000000000000000000000000000000000
          0000008080000080800000808000000000000000000000000000000000000000
          0000000000000000000000808000008080000080800000808000008080000080
          800000808000008080000080800000808000}
        TabOrder = 1
        UpGlyph.Data = {
          0E010000424D0E01000000000000360000002800000009000000060000000100
          200000000000D800000000000000000000000000000000000000008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000000000000000000000000000000000000000000000000000000000000080
          8000008080000080800000000000000000000000000000000000000000000080
          8000008080000080800000808000008080000000000000000000000000000080
          8000008080000080800000808000008080000080800000808000000000000080
          8000008080000080800000808000008080000080800000808000008080000080
          800000808000008080000080800000808000}
        OnDownClick = sbCardEnabledTimeoutDownClick
        OnUpClick = sbCardEnabledTimeoutUpClick
      end
    end
    object plIgnitionControlPowerRelay: TPanel
      AlignWithMargins = True
      Left = 3
      Top = -372
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 2
      ExplicitWidth = 810
      object lbPowerRelayLabel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '            IGN break relay:'
        ExplicitHeight = 24
      end
      object cbIgnBreakRelay: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
    object plOperatorSessionTimeout: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 653
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 27
      ExplicitWidth = 810
      object lbOperatorSessionTimeout: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '   Operator session timeout:'
        ExplicitHeight = 24
      end
      object lbOperatorSeesion: TLabel
        AlignWithMargins = True
        Left = 751
        Top = 5
        Width = 36
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = 'min'
        ExplicitHeight = 24
      end
      object spOperatorSessionTimeout: TSpinEdit
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 34
        Cursor = crHandPoint
        Align = alLeft
        MaxValue = 250
        MinValue = 0
        TabOrder = 0
        Value = 0
        OnClick = spOperatorSessionTimeoutClick
        OnKeyPress = spOperatorSessionTimeoutKeyPress
        OnMouseMove = spOperatorSessionTimeoutMouseMove
      end
    end
    object plPowerOnSignal: TPanel
      AlignWithMargins = True
      Left = 3
      Top = -126
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 8
      ExplicitWidth = 810
      object lbPowerOnSignal: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '        POWER signal source:'
        ExplicitHeight = 24
      end
      object cbPowerOnSignal: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
    object plPowerRelay: TPanel
      AlignWithMargins = True
      Left = 3
      Top = -413
      Width = 812
      Height = 35
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 1
      ExplicitWidth = 810
      object lbPowerRelay: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '                Power relay:'
        ExplicitHeight = 24
      end
      object cbPowerRelay: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
    object plRelayModuleType: TPanel
      AlignWithMargins = True
      Left = 3
      Top = -454
      Width = 812
      Height = 35
      Margins.Top = 15
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 0
      ExplicitWidth = 810
      object lbRelayModuleType: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '          Relay module type:'
        ExplicitHeight = 24
      end
      object cbRelayModuleType: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        AutoCloseUp = True
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        CanUndoSelText = True
        TabOrder = 0
      end
    end
    object plRemoteModuleID: TPanel
      AlignWithMargins = True
      Left = 3
      Top = -167
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 7
      ExplicitWidth = 810
      object lbRemoteModuleID: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '           Remote module ID:'
        ExplicitHeight = 24
      end
      object spRemoteModuleID: TSpinEdit
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 34
        Cursor = crHandPoint
        Align = alLeft
        MaxValue = 254
        MinValue = 0
        TabOrder = 0
        Value = 0
        OnClick = spRemoteModuleIDClick
        OnKeyPress = spRemoteModuleIDKeyPress
        OnMouseMove = spRemoteModuleIDMouseMove
      end
    end
    object plRFIDReadMode: TPanel
      AlignWithMargins = True
      Left = 3
      Top = -249
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 5
      ExplicitWidth = 810
      object lbRFIDReadMode: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '             RFID read mode:'
        ExplicitHeight = 24
      end
      object cbRFIDReadMode: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
    object plSignalRelay: TPanel
      AlignWithMargins = True
      Left = 3
      Top = -331
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 3
      ExplicitWidth = 810
      object lbSignalRelayLabel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '               Signal relay:'
        ExplicitHeight = 24
      end
      object cbSignalRelay: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
    object plSignalSourceCharge: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 202
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 16
      ExplicitWidth = 810
      object lbSignalSourceCharge: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '       CHARGE signal source:'
        ExplicitHeight = 24
      end
      object cbSignalSourceCharge: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
    object plSignalSourceEngine: TPanel
      AlignWithMargins = True
      Left = 3
      Top = -44
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 10
      ExplicitWidth = 810
      object lbSignalSourceEngine: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '       ENGINE signal source:'
        ExplicitHeight = 24
      end
      object cbSignalSourceEngine: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
    object plSignalSourceIgnition: TPanel
      AlignWithMargins = True
      Left = 3
      Top = -85
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 9
      ExplicitWidth = 810
      object lbSignalSourceIgnition: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '          IGN signal source:'
        ExplicitHeight = 24
      end
      object cbSignalSourceIgnition: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
    object plSignalSourceLevel: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 161
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 15
      ExplicitWidth = 810
      object lbSignalSourceLevel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '        LEVEL signal source:'
        ExplicitHeight = 24
      end
      object cbSignalSourceLevel: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
    object plSignalSourceMech: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 38
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 12
      ExplicitWidth = 810
      object lbSignalSourceMech: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '         MECH signal source:'
        ExplicitHeight = 24
      end
      object cbSignalSourceMech: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
    object plSignalSourceMove: TPanel
      AlignWithMargins = True
      Left = 3
      Top = -3
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 11
      ExplicitWidth = 810
      object lbSignalSourceMove: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '         MOVE signal source:'
        ExplicitHeight = 24
      end
      object cbSignalSourceMove: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
    object plSignalSourceSpeed: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 79
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 13
      ExplicitWidth = 810
      object lbSignalSourceSpeed: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '        SPEED signal source:'
        ExplicitHeight = 24
      end
      object cbSignalSourceSpeed: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
    object plSignalSourceTurboTimer: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 366
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 20
      ExplicitWidth = 810
      object lbSignalSourceTurboTimer: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '                TURBO timer:'
        ExplicitHeight = 24
      end
      object tsSignalSourceTurboTimer: TToggleSwitch
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 92
        Height = 29
        Cursor = crHandPoint
        Align = alLeft
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        ExplicitHeight = 26
      end
    end
    object plSpeedSensorKoefficient: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 120
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 14
      ExplicitWidth = 810
      object lbSpeedSensorKoefficient: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '   SPEED sensor koefficient:'
        ExplicitHeight = 24
      end
      object edSpeedSensorKoefficient: TEdit
        AlignWithMargins = True
        Left = 345
        Top = 0
        Width = 383
        Height = 35
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnChange = edSpeedSensorKoefficientChange
        OnClick = edSpeedSensorKoefficientClick
        OnKeyDown = edSpeedSensorKoefficientKeyDown
        OnKeyPress = edSpeedSensorKoefficientKeyPress
        OnMouseMove = edSpeedSensorKoefficientMouseMove
        ExplicitHeight = 32
      end
      object sbSpeedSensorKoefficient: TSpinButton
        AlignWithMargins = True
        Left = 728
        Top = 1
        Width = 15
        Height = 33
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 1
        Margins.Right = 0
        Margins.Bottom = 1
        Align = alLeft
        DownGlyph.Data = {
          0E010000424D0E01000000000000360000002800000009000000060000000100
          200000000000D800000000000000000000000000000000000000008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000008080000080800000808000000000000080800000808000008080000080
          8000008080000080800000808000000000000000000000000000008080000080
          8000008080000080800000808000000000000000000000000000000000000000
          0000008080000080800000808000000000000000000000000000000000000000
          0000000000000000000000808000008080000080800000808000008080000080
          800000808000008080000080800000808000}
        TabOrder = 1
        UpGlyph.Data = {
          0E010000424D0E01000000000000360000002800000009000000060000000100
          200000000000D800000000000000000000000000000000000000008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000000000000000000000000000000000000000000000000000000000000080
          8000008080000080800000000000000000000000000000000000000000000080
          8000008080000080800000808000008080000000000000000000000000000080
          8000008080000080800000808000008080000080800000808000000000000080
          8000008080000080800000808000008080000080800000808000008080000080
          800000808000008080000080800000808000}
        OnDownClick = sbSpeedSensorKoefficientDownClick
        OnUpClick = sbSpeedSensorKoefficientUpClick
      end
    end
    object plMassFactor: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 243
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 17
      ExplicitWidth = 810
      object lbMassFactor: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '           MASS koefficient:'
        ExplicitHeight = 24
      end
      object edMassFactor: TEdit
        AlignWithMargins = True
        Left = 345
        Top = 0
        Width = 383
        Height = 35
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnChange = edMassFactorChange
        OnClick = edMassFactorClick
        OnKeyDown = edMassFactorKeyDown
        OnKeyPress = edMassFactorKeyPress
        OnMouseMove = edMassFactorMouseMove
        ExplicitHeight = 32
      end
      object sbMassFactor: TSpinButton
        AlignWithMargins = True
        Left = 728
        Top = 1
        Width = 15
        Height = 33
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 1
        Margins.Right = 0
        Margins.Bottom = 1
        Align = alLeft
        DownGlyph.Data = {
          0E010000424D0E01000000000000360000002800000009000000060000000100
          200000000000D800000000000000000000000000000000000000008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000008080000080800000808000000000000080800000808000008080000080
          8000008080000080800000808000000000000000000000000000008080000080
          8000008080000080800000808000000000000000000000000000000000000000
          0000008080000080800000808000000000000000000000000000000000000000
          0000000000000000000000808000008080000080800000808000008080000080
          800000808000008080000080800000808000}
        TabOrder = 1
        UpGlyph.Data = {
          0E010000424D0E01000000000000360000002800000009000000060000000100
          200000000000D800000000000000000000000000000000000000008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000000000000000000000000000000000000000000000000000000000000080
          8000008080000080800000000000000000000000000000000000000000000080
          8000008080000080800000808000008080000000000000000000000000000080
          8000008080000080800000808000008080000080800000808000000000000080
          8000008080000080800000808000008080000080800000808000008080000080
          800000808000008080000080800000808000}
        OnDownClick = sbMassFactorDownClick
        OnUpClick = sbMassFactorUpClick
      end
    end
    object plMotionSensorCoefficient: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 284
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 18
      ExplicitWidth = 810
      object lbMotionSensorCoefficient: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '  MOTION sensor koefficient:'
        ExplicitHeight = 24
      end
      object edMotionSensorCoefficient: TEdit
        AlignWithMargins = True
        Left = 345
        Top = 0
        Width = 383
        Height = 35
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnChange = edMotionSensorCoefficientChange
        OnClick = edMotionSensorCoefficientClick
        OnKeyDown = edMotionSensorCoefficientKeyDown
        OnKeyPress = edMotionSensorCoefficientKeyPress
        OnMouseMove = edMotionSensorCoefficientMouseMove
        ExplicitHeight = 32
      end
      object SpinButton1: TSpinButton
        AlignWithMargins = True
        Left = 728
        Top = 1
        Width = 15
        Height = 33
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 1
        Margins.Right = 0
        Margins.Bottom = 1
        Align = alLeft
        DownGlyph.Data = {
          0E010000424D0E01000000000000360000002800000009000000060000000100
          200000000000D800000000000000000000000000000000000000008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000008080000080800000808000000000000080800000808000008080000080
          8000008080000080800000808000000000000000000000000000008080000080
          8000008080000080800000808000000000000000000000000000000000000000
          0000008080000080800000808000000000000000000000000000000000000000
          0000000000000000000000808000008080000080800000808000008080000080
          800000808000008080000080800000808000}
        FocusControl = edMotionSensorCoefficient
        TabOrder = 1
        UpGlyph.Data = {
          0E010000424D0E01000000000000360000002800000009000000060000000100
          200000000000D800000000000000000000000000000000000000008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000000000000000000000000000000000000000000000000000000000000080
          8000008080000080800000000000000000000000000000000000000000000080
          8000008080000080800000808000008080000000000000000000000000000080
          8000008080000080800000808000008080000080800000808000000000000080
          8000008080000080800000808000008080000080800000808000008080000080
          800000808000008080000080800000808000}
        OnDownClick = SpinButton1DownClick
        OnUpClick = SpinButton1UpClick
      end
    end
    object plSignalMechBeep: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 407
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 21
      ExplicitWidth = 810
      object lbSignalMechBeep: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '                  MECH beep:'
        ExplicitHeight = 24
      end
      object tgSignalMechBeep: TToggleSwitch
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 92
        Height = 29
        Cursor = crHandPoint
        Align = alLeft
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        ExplicitHeight = 26
      end
    end
    object plAccelerometr: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 448
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 22
      ExplicitWidth = 810
      object lbAccelerometr: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '                 Accel type:'
        ExplicitHeight = 24
      end
      object cbAccel: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
    object plAccelTimeout: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 489
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 23
      ExplicitWidth = 810
      object lbAccelTimeout: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '12V-Relay Power off timeout:'
        ExplicitHeight = 24
      end
      object cbAccelTimeout: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
    object plDeviceProtocol: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 530
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 24
      ExplicitWidth = 810
      object lbDeviceProtocol: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '       Ext. device protocol:'
        ExplicitHeight = 24
      end
      object spDeviceProtocol: TSpinEdit
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 34
        Cursor = crHandPoint
        Align = alLeft
        MaxValue = 255
        MinValue = 0
        TabOrder = 0
        Value = 0
        OnClick = spDeviceProtocolClick
        OnKeyPress = spDeviceProtocolKeyPress
        OnMouseMove = spDeviceProtocolMouseMove
      end
    end
    object plDeviceKoef: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 571
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 25
      ExplicitWidth = 810
      object lbDeviceKoef: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '           Ext. device Koef:'
        ExplicitHeight = 24
      end
      object edDeviceKoef: TEdit
        AlignWithMargins = True
        Left = 345
        Top = 0
        Width = 383
        Height = 35
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnChange = edDeviceKoefChange
        OnClick = edDeviceKoefClick
        OnKeyDown = edDeviceKoefKeyDown
        OnKeyPress = edDeviceKoefKeyPress
        OnMouseMove = edDeviceKoefMouseMove
        ExplicitHeight = 32
      end
      object sbDeviceKoef: TSpinButton
        AlignWithMargins = True
        Left = 728
        Top = 1
        Width = 15
        Height = 33
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 1
        Margins.Right = 0
        Margins.Bottom = 1
        Align = alLeft
        DownGlyph.Data = {
          0E010000424D0E01000000000000360000002800000009000000060000000100
          200000000000D800000000000000000000000000000000000000008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000008080000080800000808000000000000080800000808000008080000080
          8000008080000080800000808000000000000000000000000000008080000080
          8000008080000080800000808000000000000000000000000000000000000000
          0000008080000080800000808000000000000000000000000000000000000000
          0000000000000000000000808000008080000080800000808000008080000080
          800000808000008080000080800000808000}
        TabOrder = 1
        UpGlyph.Data = {
          0E010000424D0E01000000000000360000002800000009000000060000000100
          200000000000D800000000000000000000000000000000000000008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000000000000000000000000000000000000000000000000000000000000080
          8000008080000080800000000000000000000000000000000000000000000080
          8000008080000080800000808000008080000000000000000000000000000080
          8000008080000080800000808000008080000080800000808000000000000080
          8000008080000080800000808000008080000080800000808000008080000080
          800000808000008080000080800000808000}
        OnDownClick = sbDeviceKoefDownClick
        OnUpClick = sbDeviceKoefUpClick
      end
    end
    object plMaxSpeed: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 694
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 28
      ExplicitWidth = 810
      object lbMaxSpeed: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 336
        Height = 29
        Align = alLeft
        Caption = '                  Max speed:'
        ExplicitHeight = 24
      end
      object lbMaxSpeedLabel: TLabel
        AlignWithMargins = True
        Left = 751
        Top = 5
        Width = 48
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = 'km/h'
        ExplicitHeight = 24
      end
      object spMaxSpeed: TSpinEdit
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 34
        Cursor = crHandPoint
        Align = alLeft
        MaxValue = 250
        MinValue = 0
        TabOrder = 0
        Value = 0
        OnClick = spMaxSpeedClick
        OnKeyPress = spMaxSpeedKeyPress
        OnMouseMove = spMaxSpeedMouseMove
      end
    end
    object plSpeedLimitType: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 735
      Width = 812
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 29
      ExplicitWidth = 810
      object lbSpeedLimitType: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 27
        Margins.Top = 5
        Align = alLeft
        Caption = '           Speed limit type:'
        ExplicitHeight = 24
      end
      object cbSpeedLimitType: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
    object plUsageMode: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 776
      Width = 812
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      ParentShowHint = False
      ShowCaption = False
      ShowHint = False
      TabOrder = 30
      ExplicitWidth = 810
      object lbUsageMode: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 336
        Height = 42
        Margins.Top = 5
        Align = alLeft
        Caption = '                 Usage mode:'
        ExplicitHeight = 24
      end
      object cbUsageMode: TComboBox
        AlignWithMargins = True
        Left = 345
        Top = 3
        Width = 400
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Style = csDropDownList
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
  end
end
