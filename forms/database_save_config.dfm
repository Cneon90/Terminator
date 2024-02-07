object fr_save_config: Tfr_save_config
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080' '#1074' '#1041#1044
  ClientHeight = 379
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Courier New'
  Font.Style = [fsBold]
  Position = poMainFormCenter
  TextHeight = 23
  object plMain: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 341
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 4
      Width = 618
      Height = 23
      Margins.Left = 5
      Align = alTop
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1102':'
      ExplicitWidth = 286
    end
    object DBListBox1: TDBListBox
      AlignWithMargins = True
      Left = 4
      Top = 33
      Width = 287
      Height = 304
      Align = alLeft
      ItemHeight = 23
      TabOrder = 0
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 297
      Top = 33
      Width = 327
      Height = 304
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 221
      object l: TScrollBox
        Left = 0
        Top = 0
        Width = 306
        Height = 291
        TabOrder = 0
      end
    end
  end
  object Button1: TButton
    AlignWithMargins = True
    Left = 520
    Top = 344
    Width = 105
    Height = 32
    Align = alRight
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    ExplicitHeight = 31
  end
  object Button2: TButton
    AlignWithMargins = True
    Left = 400
    Top = 344
    Width = 114
    Height = 32
    Align = alRight
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    ExplicitHeight = 31
  end
end
