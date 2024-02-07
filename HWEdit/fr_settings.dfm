object frSettings: TfrSettings
  Left = 0
  Top = 0
  Cursor = crHandPoint
  AlphaBlendValue = 200
  BorderIcons = []
  BorderStyle = bsNone
  BorderWidth = 1
  Caption = 'frSettings'
  ClientHeight = 35
  ClientWidth = 398
  Color = clWindowFrame
  CustomTitleBar.ShowCaption = False
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Consolas'
  Font.Style = []
  FormStyle = fsMDIForm
  Position = poDefault
  PrintScale = poNone
  Scaled = False
  StyleElements = [seFont, seClient]
  StyleName = 'Glow'
  OnActivate = FormActivate
  OnMouseWheel = FormMouseWheel
  OnShow = FormShow
  TextHeight = 24
  object plMain: TPanel
    Left = 0
    Top = 0
    Width = 398
    Height = 35
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'plMain'
    Color = clBackground
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object tbSetting: TTrackBar
      AlignWithMargins = True
      Left = 98
      Top = 5
      Width = 280
      Height = 25
      Cursor = crHandPoint
      Align = alRight
      Ctl3D = True
      DoubleBuffered = True
      Max = 40
      ParentCtl3D = False
      ParentDoubleBuffered = False
      PageSize = 1
      ShowSelRange = False
      TabOrder = 0
      TabStop = False
      TickMarks = tmBoth
      TickStyle = tsNone
      Touch.InteractiveGestures = []
      Touch.ParentTabletOptions = False
      Touch.TabletOptions = []
      StyleElements = [seFont, seBorder]
      OnChange = tbSettingChange
      OnKeyPress = tbSettingKeyPress
    end
    object edValue: TEdit
      AlignWithMargins = True
      Left = 2
      Top = 2
      Width = 86
      Height = 31
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      TabOrder = 1
      OnChange = edValueChange
      OnClick = edValueClick
      OnDblClick = edValueDblClick
      OnKeyPress = edValueKeyPress
    end
    object SpinButton: TSpinButton
      Left = 381
      Top = 2
      Width = 15
      Height = 31
      Cursor = crHandPoint
      Align = alRight
      Ctl3D = False
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
      ParentCtl3D = False
      TabOrder = 2
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
      OnDownClick = SpinButtonDownClick
      OnUpClick = SpinButtonUpClick
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerTimer
    Left = 145
    Top = 5
  end
end
