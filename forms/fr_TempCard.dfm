object frTempCard: TfrTempCard
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'TEMP CARD'
  ClientHeight = 150
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Consolas'
  Font.Style = [fsBold]
  Position = poScreenCenter
  Scaled = False
  StyleName = 'Glow'
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 22
  object plCardCode: TPanel
    Left = 0
    Top = 0
    Width = 530
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 0
    ExplicitTop = -3
    ExplicitWidth = 528
    object lbCardCode: TLabel
      AlignWithMargins = True
      Left = 0
      Top = 3
      Width = 120
      Height = 24
      Margins.Left = 0
      Margins.Right = 0
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'CARD CODE:'
      Layout = tlCenter
      ExplicitLeft = 3
    end
    object edCardCode: TEdit
      AlignWithMargins = True
      Left = 120
      Top = 3
      Width = 210
      Height = 24
      Margins.Left = 0
      Align = alLeft
      AutoSelect = False
      AutoSize = False
      CanUndoSelText = True
      TabOrder = 0
      OnChange = edCardCodeChange
      ExplicitTop = 0
      ExplicitHeight = 30
    end
    object checkAdmin: TCheckBox
      Left = 425
      Top = 0
      Width = 105
      Height = 30
      Cursor = crHandPoint
      Align = alRight
      Caption = 'ADMIN'
      TabOrder = 1
      ExplicitLeft = 430
    end
    object btnLoad: TBitBtn
      AlignWithMargins = True
      Left = 367
      Top = 3
      Width = 48
      Height = 24
      Cursor = crHandPoint
      Margins.Right = 10
      Align = alRight
      ImageIndex = 0
      ImageName = 'Import_32'
      Images = VirtualImageList
      TabOrder = 2
      OnClick = btnLoadClick
      ExplicitLeft = 370
    end
  end
  object plOperatorID: TPanel
    Left = 0
    Top = 30
    Width = 530
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 528
    object lbOperatorID: TLabel
      AlignWithMargins = True
      Left = 0
      Top = 3
      Width = 120
      Height = 24
      Margins.Left = 0
      Margins.Right = 0
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'OPERATOR ID:'
      Layout = tlCenter
      ExplicitLeft = 3
    end
    object edOperatorID: TEdit
      AlignWithMargins = True
      Left = 120
      Top = 3
      Width = 210
      Height = 24
      Margins.Left = 0
      Align = alLeft
      AutoSize = False
      TabOrder = 0
      OnChange = edOperatorIDChange
      ExplicitTop = 0
      ExplicitHeight = 30
    end
    object checkDriver: TCheckBox
      Left = 425
      Top = 0
      Width = 105
      Height = 30
      Cursor = crHandPoint
      Align = alRight
      Caption = 'DRIVER'
      TabOrder = 1
      ExplicitLeft = 430
    end
  end
  object plSpeed: TPanel
    Left = 0
    Top = 60
    Width = 530
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 528
    object lbSpeed: TLabel
      AlignWithMargins = True
      Left = 0
      Top = 3
      Width = 120
      Height = 24
      Margins.Left = 0
      Margins.Right = 0
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'SPEED:'
      Layout = tlCenter
      ExplicitLeft = 3
    end
    object lbSpeedVal: TLabel
      AlignWithMargins = True
      Left = 336
      Top = 3
      Width = 40
      Height = 24
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Layout = tlCenter
      ExplicitLeft = 369
    end
    object lbSpeedP: TLabel
      AlignWithMargins = True
      Left = 382
      Top = 3
      Width = 40
      Height = 24
      Align = alLeft
      AutoSize = False
      Caption = 'km/h'
      Layout = tlCenter
      ExplicitLeft = 415
      ExplicitHeight = 22
    end
    object TrackSpeed: TTrackBar
      AlignWithMargins = True
      Left = 120
      Top = 3
      Width = 210
      Height = 24
      Cursor = crHandPoint
      Margins.Left = 0
      Align = alLeft
      Max = 255
      TabOrder = 0
      OnChange = TrackSpeedChange
    end
    object checkMech: TCheckBox
      Left = 425
      Top = 0
      Width = 105
      Height = 30
      Cursor = crHandPoint
      Align = alRight
      Caption = 'MECHANIC'
      TabOrder = 1
      ExplicitLeft = 410
    end
  end
  object plIGNTime: TPanel
    Left = 0
    Top = 90
    Width = 530
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 528
    object lbIGNTime: TLabel
      AlignWithMargins = True
      Left = 0
      Top = 3
      Width = 120
      Height = 24
      Margins.Left = 0
      Margins.Right = 0
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'IGN TIME:'
      Layout = tlCenter
      ExplicitLeft = 3
    end
    object lbIGNTimeVal: TLabel
      AlignWithMargins = True
      Left = 336
      Top = 3
      Width = 40
      Height = 24
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Layout = tlCenter
      ExplicitLeft = 369
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 382
      Top = 3
      Width = 30
      Height = 24
      Align = alLeft
      AutoSize = False
      Caption = 'min'
      Layout = tlCenter
      ExplicitLeft = 415
      ExplicitHeight = 22
    end
    object TrackIGNTime: TTrackBar
      AlignWithMargins = True
      Left = 120
      Top = 3
      Width = 210
      Height = 24
      Cursor = crHandPoint
      Margins.Left = 0
      Align = alLeft
      Max = 1092
      TabOrder = 0
      OnChange = TrackIGNTimeChange
    end
    object checkPNR: TCheckBox
      Left = 425
      Top = 0
      Width = 105
      Height = 30
      Cursor = crHandPoint
      Align = alRight
      Caption = 'PNR'
      TabOrder = 1
      ExplicitLeft = 430
    end
  end
  object plWorkTime: TPanel
    Left = 0
    Top = 120
    Width = 530
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitWidth = 528
    object lbWorkTime: TLabel
      AlignWithMargins = True
      Left = 0
      Top = 3
      Width = 120
      Height = 24
      Margins.Left = 0
      Margins.Right = 0
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'WORK TIME:'
      Layout = tlCenter
      ExplicitLeft = 3
    end
    object lbWorkTimeVal: TLabel
      AlignWithMargins = True
      Left = 336
      Top = 3
      Width = 40
      Height = 24
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Layout = tlCenter
      ExplicitLeft = 369
    end
    object Label3: TLabel
      AlignWithMargins = True
      Left = 382
      Top = 3
      Width = 30
      Height = 24
      Align = alLeft
      AutoSize = False
      Caption = 'min'
      Layout = tlCenter
      ExplicitLeft = 415
      ExplicitHeight = 22
    end
    object TrackWorkTime: TTrackBar
      AlignWithMargins = True
      Left = 120
      Top = 3
      Width = 210
      Height = 24
      Cursor = crHandPoint
      Margins.Left = 0
      Align = alLeft
      Max = 1092
      TabOrder = 0
      OnChange = TrackWorkTimeChange
    end
  end
  object OpenDialogTempCard: TOpenDialog
    DefaultExt = '*.tcd'
    Filter = 'tcd|*.tcd|all|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 130
  end
  object ImageCollection: TImageCollection
    Images = <
      item
        Name = 'Import_32'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001874455874536F667477
              617265007061696E742E6E657420342E312E36FD4E09E8000004154944415458
              47BD967F4C1B6518C7DFB33A323181655B8266E26264E004D986266EFF4CF0E7
              1F33B2299240A30B4B1498039A2C5936642A89246E75C485C53989883321E94C
              36988C389BBAA05B0C59A2C93AC64F818A324A1D2DEBA4B485AFCFF372C51C3D
              B6D1529FE4D3F6EEBDF7BE9F7BDFF77A276E57007289AF084BB4CCCCCC34D1F7
              4EF5D4772EEA70707A7A1A56AB15168B256A5A5A5A100C0641E7FD588D58B8C8
              34810EF4994C26F0E65261341A431287687BE1A203324902A9A9A9102BD742EC
              3AA565D9FDD8F6CAAB78EFFD6A2D07AB71A0EA0354567D28B7E3E31F80D8B26B
              B64F66AE94282C2C0C491C9E4DD329CADEC002292929106B3642D44183B23C11
              A6BDFB70DEF69386DC1DAFCB1083C18086934D485CB102CA1B75B3FD3EF5436C
              784DB617141484248A64E0FC8A5420E7F917E786FBD8F17AAD00232576C8F6E6
              E6661668E2BCB08A9900C3D341EDBC30A92C9C1756910ABCB9B308AB56AF4652
              D283F8A6E9DBD809888487F01C5D6DA55C70FAECDB5F85B8B838086383B6EF92
              08BC7512227E25947B0C0B220CF742A4BD00F1C984B6EF92084443C4027B7E80
              48CE82485A1F199B8B208E06A21078740BB29E7A1A6515A645535CBA5B868AF2
              1F2317509237E19DE21274F70F2C9A5FAFD865A852DAB6F4027D834370DD1897
              F40D3AC2DA99980AF8A6A6E0F139E19E1CC594DF8F9E79ED4CCC04AE3B5D08CE
              04B0DFBA15D517B671170C388635C7303111E81F722048EF0BE7FBEA51742619
              E68B85DC45771A162D400F896C6EB5D96CD86AAC0813E81D18C2A4CF87BF6EF6
              A2E46C9A14B0D86B10A027DCFC7066510214BE9E1871B8AFE2AAB31D5E3FB0AA
              FE3F01BE720EF7F8C6E4D073387365F40226BCDEE80428389DB8DEE3EA40E977
              8FA3EC9C9C09649F06123372F06543831CF6919BFD38607D762EBCBC6D23EDF7
              6364742C72010ACE209CDDAE5F5042E17CE2775B33A440E70DC01798266EA1B5
              E7D8DCB08768EEAAC5F8F8380E1FA9C521F39130AA3FAA91A1F2DF544F808233
              89B16B639734276791DF46ACB0FDFE354E5C2EC7EED62734C1CCDEEF9FC164C0
              8B4A7A0553EE5BAE8B5846ACCB86A8FD275C803ED228DCD5E9FC19C56753C302
              6EC7DB2D8F81A7CBFE3710F799FAB0B913F30528FCF3614F1785AFD30D598812
              92E5D171BBDD484F4F875094BB87043A3A3AF895EC380B1C1DF50E62CFB92775
              83F4A869DF8E3F27BAF90A60369B91979777D7E4E7E7A3B1B191C383C4661658
              430C0EB9EDB4EA337503195EE9272E97C1EE6C97C1911665717511DB79FDC9A2
              FD6B69C780C3D38972BAF542A17C2BB218FFCFAB9DFD442BF1326D2A91A2C66A
              8B4EFA08D1FF87E79ABC5A1608DD86B4BF8E78897E26A887C7A628E461A26F98
              E6B7A26D13911512C8510F897D5118AF895ED7AD6139FCF49B6E3224AACDFF4F
              51601205D7125F1019EAEE189410FF02C7C62857BA723AFB0000000049454E44
              AE426082}
          end>
      end
      item
        Name = 'button_cancel (1)'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D494844520000001C0000001C0806000000720DDF
              94000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001A74455874536F667477
              617265005061696E742E4E45542076332E352E313030F472A10000080C494441
              54484BA55609545447167D9FEEA6A16912019B4D716911C8014164D51610DA8D
              68181501C584E888BB8E4B74221A2744115126286EE448DC468DC6884BC4E568
              3408C6E8CC18999CE8888A0AE898B844C10581EE7FE7D5EFD1634C629C993A5D
              A7FF52F56FDD5BEFDD57442FD97C88ECC289EC53881C2713E9451F4EA48BE067
              6DF9DD4B7EE6C5C318C06E0491CB5F743AFF83FEFEF1253131234BCCE6D97BCC
              E6BCDD66F3E25D0909593B7AF6FCFD017EC7630232885C7BFEAFE0BD895AEF75
              721A506E322DA94C4D2DBF3E6DDA0F0F972D6BB16ED902ECDE0DECD90371FD68
              E952CBF5E9D36F9E494BAB381E13F3E75227A781FD880CFF0D63F58744DDFFDA
              B9F3F29AD1A32F3F2E2A925156069C39039C3C091C3902ECDD0B9496DAAE4F9D
              022A2B81F272347DF4915C9B9979E56F0101AB0A884CAF12695E08DC8EC8E953
              A2E1174DA6638F72739B505161FBA060959D0D4C9902EBE8D1681E3E1CCDC9C9
              B0A6A4006FBF0D6465D9C69C38011C3B86C6BCBCE64BB1B1C77710BDD591F7FA
              1741194CC70346D7C5C5FDD3525C6CC1D75F033B77029327A32523033FA6A7A3
              AE6F5F5477ED8A2A5F5F54B56F8FEA8E1D511B10803BA1A1B084840073E64059
              24B3B5AC5D6BB9161F7FA184681C833A3D0FAADA4C34A0BA5BB7F3D6952BAD62
              02366C80DCAF1FEE0D1B86F3DDBBA3C2CDCDB255A7BB996F6F5F3947AD3E22FA
              22B5FAF456BDFE3A035B5ADE780358B70E387C18F8E20BE0E851588B8AAC57C2
              C32F7E42F43B065429A07E44D262490A3CD5A1C3316585070E008585B0C6C5A1
              EEF5D7E5C306C3ED5CA203B14493581BCE02F2E6DECA55AB7D75B6BF7F645978
              F8BEA68C8C166CDE0CECDB67DBDF92123CBD9F370F7F371A4F2C93A4E040C6A2
              74CEABAD8E8EB3EE9BCD166CDA047CFC31E4010370232646FE54A73BCB793795
              013A70573F238B74303A3AAC2A2E6E2732332D0A3301F2D96710DF684E4BC3E3
              981860CD1A656F1FF6EB67DDE6E434F72DDE365A48E453E1E57512D3A7DB367E
              C2043CE8D103BBDCDCAA98551283383EABBF975E6F7F342A2AEE4AAF5E5F61FC
              F8A71F5518B1328D0307A25AA542F52BAFC0326A14B071233072244EB8BA9E5E
              40D49EB22429E17AFBF60FB17021B07C39C0EC2A8DC65B631C1DC73EC78AE2BC
              BCF4A72223D36FF4EA755A041356AF5614417131307F3E1E30AB4B1A0D4A89EE
              1FB1B36B6878ED3560F060C0CF0FDFDBDB37BE2B49FD698E244D7ECCAB414202
              C052B4848763839BDB96448DC6F359669946A3A132327246436262953C6D9A15
              2B5600AB56012B5742E6B468E079D5F6F6D84774FB0F448B380FB7FF8BEFE1E0
              0010A1C9CE0E7F92A419B44892726496005A2DC0C037BDBD1B56180C196DD823
              9F00BE6F34B6F9363A3AEF7172F20D79EE5CAB904E51A3A000F2AC59A867B0AB
              3CFF73A29A4944335A13B9BF2F49E967D5EA7A886F33A0CC80B9929427009788
              1BF110FC7FC9C5E57289874777069304E05A7FFFB6951111EB2C3D7A3C44EFDE
              C0902100273D929260E56BC1AC8E59EC22FA6E14D19B9D885E11730BB5DA8853
              CECE55D0EB01497A02984F3992B4B8F90920EB5F6F30DC39E4E1D19F635FB3C7
              CF2FF46244C431984C405010C0498EC0408093DC1A1F8FFB7C5DA3D13CDE4E74
              6800512F067A6A655B3C3DBB7CE3E353097777C0C9094DCECEF840A5CAA73F4A
              D2BBF582B6E88E8E40BB7628F7F25A54E2E3D3F77A64E477E07C445818101909
              05B84F1F85596350905CAB52DD652BFC24DE969F4FD326CCC5453A141A1A732D
              24A4163E3E80B737EE7878609646338FC64BD2D02B5A6D93ECE202B46A0574EA
              84DBC1C175B72222AE2A81C42E83D858806D0D4387424E4D454B972EA821BAB1
              91A830882880C17E520FD7C4C6EA4F9ACDB91693A9199D3BC3CAEA9C33185A46
              A9D5C3691C51E0975A6D55739B360A3B01889E3D6D512B92971989FD524C9AC1
              640EF14B6A75DD52A22C0E0EAEBD3F6F075252D2EFA6A45C5314898EC60356A8
              D4D9B9FA4DA2604A639B2A52A956DD767797AD6CCC080EB6C927A44C4C545861
              EC582565C46ABFB5B73F97CF36C7302ECF43F103EDE713260CBB3569D20525B0
              FAF74733E7F555A3111F6A34C543C41CF62C5516519F135AEDF9C71C1456211D
              0784180C517EA64E55001FF9FB3795E974650BECEC92BAD922F1D9A6CA4A4E0E
              3A9B93935F9F9D7D19E3C6012346284EF323BBD6419DEEE274A2FE5C356CFB1C
              CCC8AB88DEAB7170A8B7444541E672A43012FF3367020B16E0C6CC997736A4A5
              2D1B6A3245F5EDDAB55DDF909076E90909A14B274E1CF14D61E1BAFBEBD75F68
              292878C40540C63BEFC0CA85A09E15FA875EDF902F491F74E5E3C74F96C84CBD
              D711157C6F6777C71A12222BD6357BB6ADB36D29AEB275AB385AC85C511AB90C
              892EE3E04160C70E60ED5AC575446FE105DE3399E4F37676F75613ADF0FD95BD
              26239BEB7AA2251C8135960E1DAC8A348B17DB3C5354040128CE330284EB9DD2
              45ED136549540A5E9485E7DCF3F1B19E23AA5D41B4948D807F3613F9C5C635CF
              733ED1C4D33A5DF9CD80807A596CBEA8934545C0F6EDC0FEFD3610D1C5B94654
              0961FC7CECB0F8FBE307B5BAE12BA2E3EF114DE1322F6AE74B35A738B53A7283
              8FCFC2E3A1A15F562526D6DE1D33A6D1929D2D0BFF54588B456466C2C245FA6E
              404063954E575B4154C60AE599F910C6283F3B56FC16B2D44AA5721D643084E5
              04076714C7C62EDC9694B469576AEAFED2C1838FEE339B8FEE0A0BDBBFCDD777
              F31A832137C7C12163902485F349CDED8512FE16EA7F263BB4D6685CA33C3DDB
              26F9FA764E0F08081C6134060E7277F78BD2EBDBBA4A92884087FF17E8456B11
              41F0EB81F08299FF066D0092E1F35765600000000049454E44AE426082}
          end>
      end>
    Left = 40
    Top = 75
  end
  object VirtualImageList: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'Import_32'
        Name = 'Import_32'
      end
      item
        CollectionIndex = 1
        CollectionName = 'button_cancel (1)'
        Name = 'button_cancel (1)'
      end>
    ImageCollection = ImageCollection
    Width = 20
    Height = 20
    Left = 40
    Top = 110
  end
end
