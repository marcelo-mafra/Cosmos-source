object FrmEditOrgao: TFrmEditOrgao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = #211'rg'#227'o Gestor'
  ClientHeight = 553
  ClientWidth = 576
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  DesignSize = (
    576
    553)
  PixelsPerInch = 96
  TextHeight = 13
  object MSGroupHeader1: TMSGroupHeader
    Left = 7
    Top = 16
    Width = 486
    Height = 177
    Transparent = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #211'rg'#227'o Gestor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    DesignSize = (
      486
      177)
    object Label2: TLabel
      Left = 1
      Top = 24
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 1
      Top = 74
      Width = 81
      Height = 13
      Caption = 'Tradu'#231#227'o inglesa'
    end
    object Label4: TLabel
      Left = 422
      Top = 74
      Width = 42
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Mandato'
    end
    object Label5: TLabel
      Left = 422
      Top = 24
      Width = 22
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Sigla'
      ExplicitLeft = 314
    end
    object Label7: TLabel
      Left = 1
      Top = 128
      Width = 65
      Height = 13
      Caption = 'Subordina'#231#227'o'
    end
    object SpeedButton1: TSpeedButton
      Left = 455
      Top = 142
      Width = 23
      Height = 22
      Hint = 
        'Retirar subordina'#231#227'o|Remove a informa'#231#227'o da subordina'#231#227'o do '#243'rg'#227 +
        'o atual'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        06030000424D060300000000000036000000280000000F0000000F0000000100
        180000000000D002000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FF00009CFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FFFF00FF000000FF00FF3131CE
        0000FF00009CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FF3131CE319CFF0000FF00009CFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF0000FFFF00FFFF00FF000000FF00FFFF00FF
        3131CE0063FF0000CEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FF0000CE0000FF00009CFF00FFFF
        00FFFF00FFFF00FF0000FF00009CFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FF0000CE0000FF00009CFF00FFFF00FF0000FF00009CFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FF0000CE0000FF00
        009C0000FF00009CFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0000CE0000FF00009CFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FF0000CE0000FF00
        009C0000CE00009CFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FF0000CE0000FF00009CFF00FFFF00FF0000CE00009CFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FF0000CE0000FF0000FF00009CFF00FFFF
        00FFFF00FFFF00FF0000CE00009CFF00FFFF00FFFF00FF000000FF00FF0000CE
        319CFF0000FF00009CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0000
        9CFF00FFFF00FF000000FF00FF63639C0000CE63639CFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CEFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000}
      OnClick = SpeedButton1Click
    end
    object DBEdit1: TDBEdit
      Left = 1
      Top = 38
      Width = 410
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NOMORG'
      DataSource = FmeEditButtons1.DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 302
    end
    object DBEdit2: TDBEdit
      Left = 1
      Top = 88
      Width = 410
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NOMORGING'
      DataSource = FmeEditButtons1.DataSource1
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 422
      Top = 88
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'MANORG'
      DataSource = FmeEditButtons1.DataSource1
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 422
      Top = 38
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'SIGORG'
      DataSource = FmeEditButtons1.DataSource1
      TabOrder = 1
      ExplicitLeft = 314
    end
    inline FmeFKSearchSubordinacao: TFmeFKSearch
      Left = 0
      Top = 142
      Width = 454
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      TabStop = True
      ExplicitTop = 142
      ExplicitWidth = 454
      inherited SpeedButton1: TSpeedButton
        Left = 430
        ExplicitLeft = 322
      end
      inherited EdtData: TDBEdit
        Width = 428
        DataField = 'ORGSUP'
        DataSource = FmeEditButtons1.DataSource1
        ExplicitWidth = 320
      end
    end
  end
  object MSGroupHeader2: TMSGroupHeader
    Left = 8
    Top = 211
    Width = 486
    Height = 62
    Transparent = False
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Esfera de Atua'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    DesignSize = (
      486
      62)
    object Label6: TLabel
      Left = 131
      Top = 19
      Width = 23
      Height = 13
      Caption = 'Foco'
    end
    object Label1: TLabel
      Left = 1
      Top = 19
      Width = 31
      Height = 13
      Caption = 'Esfera'
    end
    object DBValueComboBox1: TDBValueComboBox
      Left = 0
      Top = 32
      Width = 121
      Height = 22
      Style = csOwnerDrawFixed
      ItemIndex = 0
      TabOrder = 0
      Text = 'Internacional'
      Items.Strings = (
        'Internacional'
        'Nacional'
        'Regional'
        'Local')
      Values.Strings = (
        '1'
        '2'
        '3'
        '4')
      DataField = 'NIVORG'
      DataSource = FmeEditButtons1.DataSource1
    end
    inline FmeFKSearchFocos: TFmeFKSearch
      Left = 129
      Top = 31
      Width = 350
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = True
      ExplicitLeft = 129
      ExplicitTop = 31
      ExplicitWidth = 242
      inherited SpeedButton1: TSpeedButton
        Left = 326
        ExplicitLeft = 218
      end
      inherited EdtData: TDBEdit
        Width = 324
        DataField = 'NOMFOC'
        DataSource = FmeEditButtons1.DataSource1
        ExplicitWidth = 216
      end
    end
  end
  object MSGroupHeader3: TMSGroupHeader
    Left = 8
    Top = 294
    Width = 486
    Height = 83
    Transparent = False
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Campos de Trabalho'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    object DBCheckBox1: TDBCheckBox
      Left = 0
      Top = 24
      Width = 137
      Height = 17
      Caption = 'Lectorium Rosicrucianum'
      DataField = 'INDLEC'
      DataSource = FmeEditButtons1.DataSource1
      TabOrder = 0
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 0
      Top = 56
      Width = 129
      Height = 17
      Caption = 'Trabalho da Mocidade'
      DataField = 'INDTMO'
      DataSource = FmeEditButtons1.DataSource1
      TabOrder = 1
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBCheckBox3: TDBCheckBox
      Left = 176
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Trabalho P'#250'blico'
      DataField = 'INDTPU'
      DataSource = FmeEditButtons1.DataSource1
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBCheckBox4: TDBCheckBox
      Left = 176
      Top = 56
      Width = 124
      Height = 17
      Caption = 'Trabalho de Membros'
      DataField = 'INDTMB'
      DataSource = FmeEditButtons1.DataSource1
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  object MSGroupHeader4: TMSGroupHeader
    Left = 7
    Top = 486
    Width = 486
    Height = 57
    Transparent = False
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Cadastro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    DesignSize = (
      486
      57)
    inline FmeUsuarioCadastrador1: TFmeUsuarioCadastrador
      Left = -2
      Top = 15
      Width = 477
      Height = 44
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      TabStop = True
      ExplicitLeft = -2
      ExplicitTop = 15
      ExplicitWidth = 363
      inherited Label2: TLabel
        Left = 361
        ExplicitLeft = 361
      end
      inherited SpeedButton1: TSpeedButton
        Left = 333
        ExplicitLeft = 333
      end
      inherited DBEdit1: TDBEdit
        Width = 328
        DataField = 'USURES'
        DataSource = FmeEditButtons1.DataSource1
        ExplicitWidth = 328
      end
      inherited DBEdit2: TDBEdit
        Left = 361
        DataField = 'DATCAD'
        DataSource = FmeEditButtons1.DataSource1
        ExplicitLeft = 361
      end
    end
  end
  inline FmeEditButtons1: TFmeEditButtons
    Left = 497
    Top = 17
    Width = 80
    Height = 151
    Anchors = [akTop, akRight]
    TabOrder = 5
    TabStop = True
    ExplicitLeft = 497
    ExplicitTop = 17
    inherited ImageList1: TImageList
      Bitmap = {
        494C010105000900180012001200FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
        0000000000003600000028000000480000002400000001001000000000004014
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000003C633C633B631B5F1B5F3C5F000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000003D639D6FBD77
        9C775B6B3A673967185FD95A3C5F000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000003D63DE77FE7F3C635A3A3A323A323A36D9521863D85A1B5B
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000003D5FDF7BFF7F9B429915
        99159E6B5E6399159915593E1863F95E3C5F0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000BE73FF7FBC4A79119915B919FD52DC4E9919991999117A3E3967
        1B5F000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000003D63FF7F9E6FDA1D99199919
        DA21DC4E9C429915B9199919B9191A5F5A6B3C5F000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000007D6BFF7FFD4EDA1DDA21B919FA25FF7BDF77B91D9915B91999159A42
        9B733C6300000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000009E6FFF7FBC421A221A26FA21
        B91D1D5BFF7F5E63DA21991599153A36BD7B5C63000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000009E6FFF7FDD463B2A3B2A1A26FA21DA211D5BFF7F9E6FDA2179115B36
        DE7F5D6700000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000007D67FF7F3E5B5B2E7C327C36
        3B2A1A26DA1D1D57FF7FBC4A580DBC46FE7F5D63000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000007D67FF7FDF739C367E63FF7FDD4A1B26FA1DBC46FF7FFD52B9199E6F
        DE7B5D6300000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000009E73FF7F5E5B1D4FFF7F
        FF7B3D5B3D57FF7BFF7F5B32DC4AFF7F7D6B0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000005D67DF77FF7F5E573E57BF73FF7BFF7B9F6FDD46FD4EFF7FBE77
        7D6B000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000005D67DF77FF7FBF6F
        5E5B5E573D573D579E6BFF7FBE773D6300000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000005D67BE73DF7BFF7FFF7FFF7FFF7FDF7B9E739E730000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000005D67
        5D677D675D675D675D6700000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000C000A000800080000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000009331
        CD18000000000000000000000000000000000000000000000000000000000000
        00000000000000012526C41D6000000000000000000000000000000000000000
        000000000000000000000C1DAB14AB14AB140C1D000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000933193319731B735CD180000000000000000000000000000
        000000000000000000000000000000000000000000002001662A052280000000
        000000000000000000000000000000000000000000000000CC18672D0252C241
        6231C71CAB1400000000000000000000004C0000000000000000000000000000
        000000000000007C00000000000000000000000093319331B835BA35BA35B835
        CD18933193319331933193319331000000000000000000000000000000000000
        80018001600160010837A72EC000A000A000A000000000000000000000000000
        00000000000000004E25207FE072605EC0458035AB140000000000000000C664
        007C004C00000000000000000000000000000000000000000000000000000000
        000000009331DB39DA39BA39BA35B835CD189F52BF5AFF5E1F631F6393310000
        00000000000000000000000000000000E30DEE53ED53EC4FCB4B6A43E836A72E
        872EC0000000000000000000000000000000000000000000912D437F207FA06A
        0052A039AB140000000000000000C664667E007C004C00000000000000000000
        00000000007C00000000000000000000000000009331DC3DDB39DB39DB39B939
        CD18073324332533232F1F639331000000000000CC18AB14AB14AB14AB14AB14
        471E8E4B8E4B8E4BEE57EC4F0733C62AA62A2001000000002D21AB14AB14AB14
        764ECC18AB14AB14D235677F437F007B405EC045AB1400000000000000000000
        C664807D0064000000000000000000000000007C000000000000000000000000
        000000009331FC3DFC3DFB3DDB3DDA39CD1808372633263324331F6393310000
        00000000AB147C6B3B633B633B633B638C328C328C328C32F25BF057C1058001
        80016001000000009D73FF7B9D6F5B671A5FF95AF95AF95A1442697F667F207F
        A06A2052AB140000000000000000000000000064007C004C0000000000000000
        007C004C0000000000000000000000000000000093311D42FC41FC3D1C42DA39
        CD18073325332533242F1F639331000000000000CC18FF779D6B9D6B9D6B9D6B
        9D6B9D6B9D6BAE3AF463F25B0412AB1400000000000000002E21FF7BFF7BBD73
        7C6B3B633B633B633446B15E304ACC3948296631AB1400000000000000000000
        000000000064007C004C00000000007C004C0000000000000000000000000000
        0000000093311E461D425D4A7F6F3B46CD1897576D474B43483B1F6393310000
        000000000D1DFF7BFF7BBE73BE73BE73BE73BE73BE73AE3AB2579053061AAB14
        00000000000000007029FF7BFF7BFF7BBE739D6F9D6F9D6F554A544EB05E6B56
        E549CA1CAB14000000000000000000000000000000000064007C004C007C004C
        000000000000000000000000000000000000000093313E461D427E4E7F6F3B46
        CD18DF6FFF73FF6FFD6B1F6393310000000000004E25FF7BFF7B3D431A021A02
        1A021A021A02AE3A8C326A2A061AAB140000000000000000912DFF7BFF7BFF7B
        3D471A021A021A021A021A02B43A487BC56A6731AB1400000000000000000000
        00000000000000000064007C004C000000000000000000000000000000000000
        0000000093315F4A3E463E463E46FB41CD18DF6BFF6FFF6FFF731F6393310000
        000000005029FF7BFF7BFF779E5F7E5B9E5F9E5F7E5BDE6FBD737C6B3B63AB14
        0000000000000000F339FF7BFF7BFF7BDF739E5F9E5F9E5F1C4F57363542D335
        7029CC1C0000000000000000000000000000000000000064007C004C0064004C
        000000000000000000000000000000000000000093315F4E5F4A5F4A5F4A1C42
        CD18DF6BFF6FFF6FFF6F1F6393310000000000005029FF7BDE6F7E5B7E5B7E5B
        7E5B7E5B7E5B7E5B7D5B9D6B5C67AB140000000000000000BE77FF7BFF7BBF6F
        7E5F7E5F7E5F7E5F7E5F5E5B3C571B531A5FAB14000000000000000000000000
        000000000064007C004C000000000064004C0000000000000000000000000000
        0000000093317F4E5F4E5F4A5F4E3C46CD18DF6BFF6FFF6FFF6F1F6393310000
        00000000912DFF7BDA099901990199019901990199019901DA09FF7B9D6BAB14
        0000000000000000D235FF7BFF7BFA099901990199019901990199019901DA09
        5B671A630000000000000000000000000064007C007C004C0000000000000000
        0064004C0000000000000000000000000000000093317F527F4E7F4E7F4E3C46
        CD18DF6BFF6FFF6FFF6F1F639331000000000000B231FF7FFF7FFF7FFF7BFF7B
        FF7BFF7BFF7BFF7BFF7BFF7BFF7BAB140000000000000000D335FF7BFF7BFF7B
        FF7BFF7BFF7BFF7BFF7BFF7BFF7BFF779D6F0D1D000000000000000000000064
        667E007C004C0000000000000000000000000064004C00000000000000000000
        00000000933193313D467F4E7F4E3D4ACD18DF6BFF6FFF6FFF6F1F6393310000
        00000000D2317C6B7C6B7C6B7C6B7C6B7C6B7C6B7C6B7C6B5B6B5B673B63AB14
        0000000000000000F3399D6F9D6F7C6B5C6BBD73FF7B9D6F5C6B5B679D73FF7B
        5B67AB14000000000000000000008C4D00648C4D000000000000000000000000
        0000000000000064000000000000000000000000000000009331D6391A423B46
        CD18933193319331933193319331000000000000D239D239D239D239D239D239
        D239D239D239D231B231912D4E252E2100000000000000001442BE77D335D235
        B231F339BE77B131B131912DB231BD73CC18CC18000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000093319331CD180000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000424D3E000000000000003E000000
        2800000048000000240000000100010000000000B00100000000000000000000
        000000000000000000000000FFFFFF00FFFFC0000000000000000000FC0FC000
        0000000000000000F003C0000000000000000000E001C0000000000000000000
        C000C0000000000000000000C000C00000000000000000008000400000000000
        0000000080004000000000000000000080004000000000000000000080004000
        0000000000000000800040000000000000000000800040000000000000000000
        C000C0000000000000000000C000C0000000000000000000E001C00000000000
        00000000F003C0000000000000000000FC0FC0000000000000000000FFFFC000
        0000000000000000FFFFFFFFFFFFFFFFFF000000FFC3FFFFFFFFFFFCFF000000
        FFC3FFF07FFFFFE0FF000000FFC3FFE03EFFDF8003000000FE007FE03C7FFF80
        03000000FE007FE03C3FBF8003000000800060003E3F7F800300000080006000
        3F1E7F80030000008001E0003F8CFF80030000008001E0003FC1FF8003000000
        8001E0003FE3FF80030000008001E0007FC1FF80030000008001E0007F8CFF80
        030000008001E0007E1E7F80030000008001E0007C3F3F80030000008001E000
        7C7FDFE0030000008001E0007FFFFFF8FF000000FFFFFFFFFFFFFFFFFF000000
        00000000000000000000000000000000000000000000}
    end
    inherited DataSource1: TDataSource
      DataSet = CdsOrgaos
    end
  end
  object MSGroupHeader5: TMSGroupHeader
    Left = 8
    Top = 393
    Width = 486
    Height = 80
    Transparent = False
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Outras Informa'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    object DBCheckBox5: TDBCheckBox
      Left = 0
      Top = 24
      Width = 137
      Height = 17
      Caption = #211'rg'#227'o gestor '#233' brasileiro'
      DataField = 'INDNAC'
      DataSource = FmeEditButtons1.DataSource1
      TabOrder = 0
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBCheckBox6: TDBCheckBox
      Left = 0
      Top = 56
      Width = 137
      Height = 17
      Caption = #211'rg'#227'o gestor est'#225' ativo'
      DataField = 'INDATI'
      DataSource = FmeEditButtons1.DataSource1
      TabOrder = 1
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBCheckBox7: TDBCheckBox
      Left = 176
      Top = 24
      Width = 177
      Height = 17
      Caption = 'Listar membros na ata de posse'
      DataField = 'INDATA'
      DataSource = FmeEditButtons1.DataSource1
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  object CdsOrgaos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'codorg'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'DspOrgaos'
    AfterInsert = CdsOrgaosAfterInsert
    AfterPost = CdsOrgaosAfterPost
    OnReconcileError = CdsOrgaosReconcileError
    Left = 400
    Top = 176
  end
end
