object FrmEditLogradouros: TFrmEditLogradouros
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Logradouros'
  ClientHeight = 332
  ClientWidth = 466
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
  PixelsPerInch = 96
  TextHeight = 13
  object MSGraphicHeader1: TMSGraphicHeader
    Left = 8
    Top = 10
    Width = 353
    Height = 17
    Caption = 'Logradouro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = False
  end
  object Label2: TLabel
    Left = 10
    Top = 35
    Width = 19
    Height = 13
    Caption = '&Cep'
  end
  object Label3: TLabel
    Left = 91
    Top = 35
    Width = 55
    Height = 13
    Caption = '&Logradouro'
  end
  object MSGraphicHeader2: TMSGraphicHeader
    Left = 8
    Top = 123
    Width = 361
    Height = 17
    Caption = 'Logradouro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = False
  end
  object Label4: TLabel
    Left = 10
    Top = 140
    Width = 19
    Height = 13
    Caption = '&Cep'
    FocusControl = DBEdit1
  end
  object Label5: TLabel
    Left = 91
    Top = 140
    Width = 55
    Height = 13
    Caption = '&Logradouro'
    FocusControl = DBEdit2
  end
  object Label6: TLabel
    Left = 10
    Top = 187
    Width = 28
    Height = 13
    Caption = '&Bairro'
  end
  object Label7: TLabel
    Left = 10
    Top = 238
    Width = 33
    Height = 13
    Caption = 'C&idade'
    FocusControl = DBEdit3
  end
  object Label8: TLabel
    Left = 300
    Top = 237
    Width = 33
    Height = 13
    Caption = '&Estado'
    FocusControl = DBEdit4
  end
  object Label9: TLabel
    Left = 10
    Top = 285
    Width = 19
    Height = 13
    Caption = '&Pa'#237's'
    FocusControl = DBEdit5
  end
  object SpeedButton1: TSpeedButton
    Left = 248
    Top = 253
    Width = 23
    Height = 22
    Hint = 'Cadastrar Cidades|Acessa a janela de cadastro de cidades'
    Flat = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF808080808080000000000000000000000000FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080C0C0C0BFBFBFBF
      BFBF008080008080008080000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      808080008000BFBFBFBFBFBFBFBFBF008080BFBFBF0080800080800080800000
      00FF00FFFF00FFFF00FFFF00FFFF00FF808080BFBFBF008000BFBFBFBFBFBFBF
      BFBF008080008080008080000000000000FF00FFFF00FFFF00FFFF00FFFF00FF
      808080008000BFBFBFBFBFBFBFBFBF008080BFBFBF0080800080800080800000
      00FF00FFFF00FFFF00FFFF00FFFF00FF808080BFBFBF008000BFBFBFBFBFBFBF
      BFBF008080008080008080000000000000FF00FFFF00FFFF00FFFF00FFFF00FF
      808080008000BFBFBFBFBFBFBFBFBF008080BFBFBF0080800080800080800000
      00FF00FFFF00FFFF00FFFF00FFFF00FF808080BFBFBF00800080808080808080
      8080000000000000008080000000000000FF00FFFF00FFFF00FFFF00FFFF00FF
      80808080808080808000FFFFFFFFFF00FFFFFF00FF00FFFF0000000000000000
      00FF00FFFF00FFFF00FFFF00FFFF00FF808080C0C0C0FFFFFFFFFFFF00FFFFFF
      FFFF00FFFFFF00FF00FFFF00FFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF80808080808000FFFFFFFFFF00FFFFFF00FF00FFFF808080808080FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80808080808080
      8080808080808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 247
    Top = 299
    Width = 23
    Height = 22
    Hint = 'Cadastrar Pa'#237'ses|Acessa a janela de cadastro de pa'#237'ses'
    Flat = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF808080808080000000000000000000000000FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080C0C0C0BFBFBFBF
      BFBF008080008080008080000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      808080008000BFBFBFBFBFBFBFBFBF008080BFBFBF0080800080800080800000
      00FF00FFFF00FFFF00FFFF00FFFF00FF808080BFBFBF008000BFBFBFBFBFBFBF
      BFBF008080008080008080000000000000FF00FFFF00FFFF00FFFF00FFFF00FF
      808080008000BFBFBFBFBFBFBFBFBF008080BFBFBF0080800080800080800000
      00FF00FFFF00FFFF00FFFF00FFFF00FF808080BFBFBF008000BFBFBFBFBFBFBF
      BFBF008080008080008080000000000000FF00FFFF00FFFF00FFFF00FFFF00FF
      808080008000BFBFBFBFBFBFBFBFBF008080BFBFBF0080800080800080800000
      00FF00FFFF00FFFF00FFFF00FFFF00FF808080BFBFBF00800080808080808080
      8080000000000000008080000000000000FF00FFFF00FFFF00FFFF00FFFF00FF
      80808080808080808000FFFFFFFFFF00FFFFFF00FF00FFFF0000000000000000
      00FF00FFFF00FFFF00FFFF00FFFF00FF808080C0C0C0FFFFFFFFFFFF00FFFFFF
      FFFF00FFFFFF00FF00FFFF00FFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF80808080808000FFFFFFFFFF00FFFFFF00FF00FFFF808080808080FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80808080808080
      8080808080808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    OnClick = SpeedButton2Click
  end
  object SpeedButton4: TSpeedButton
    Left = 346
    Top = 252
    Width = 23
    Height = 22
    Hint = 'Cadastrar Estados|Acessa a janela de cadastro de estados'
    Flat = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF808080808080000000000000000000000000FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080C0C0C0BFBFBFBF
      BFBF008080008080008080000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      808080008000BFBFBFBFBFBFBFBFBF008080BFBFBF0080800080800080800000
      00FF00FFFF00FFFF00FFFF00FFFF00FF808080BFBFBF008000BFBFBFBFBFBFBF
      BFBF008080008080008080000000000000FF00FFFF00FFFF00FFFF00FFFF00FF
      808080008000BFBFBFBFBFBFBFBFBF008080BFBFBF0080800080800080800000
      00FF00FFFF00FFFF00FFFF00FFFF00FF808080BFBFBF008000BFBFBFBFBFBFBF
      BFBF008080008080008080000000000000FF00FFFF00FFFF00FFFF00FFFF00FF
      808080008000BFBFBFBFBFBFBFBFBF008080BFBFBF0080800080800080800000
      00FF00FFFF00FFFF00FFFF00FFFF00FF808080BFBFBF00800080808080808080
      8080000000000000008080000000000000FF00FFFF00FFFF00FFFF00FFFF00FF
      80808080808080808000FFFFFFFFFF00FFFFFF00FF00FFFF0000000000000000
      00FF00FFFF00FFFF00FFFF00FFFF00FF808080C0C0C0FFFFFFFFFFFF00FFFFFF
      FFFF00FFFFFF00FF00FFFF00FFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF80808080808000FFFFFFFFFF00FFFFFF00FF00FFFF808080808080FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80808080808080
      8080808080808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    OnClick = SpeedButton4Click
  end
  object Label10: TLabel
    Left = 9
    Top = 72
    Width = 23
    Height = 13
    Caption = '&Cep:'
    FocusControl = EdtCep
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 466
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      466
      57)
    object Image1: TImage
      Left = 8
      Top = 8
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        055449636F6E0000010001002020000001000800A80800001600000028000000
        2000000040000000010008000000000000000000000000000000000000000000
        0000000000000000993300009C3600009D3801009E3E0E00A03A0000A23C0000
        A43E0000A03D0700A7410000A8420000AA440000AD470000A8450500AE480000
        AA480A00AC4C0E00B04A0000B14C0100B54F0000B6500000B8520000BA550100
        BE580000BE5B0700B4520800B0500E00B5550E00A1421000A74A1500A74B1800
        AF521900AB511E00AE531C00AF541C00B0541800B1571E009B4D23009F532900
        AF562000A1593200BA612000BF672400BC6E2300B5612D00B46A2C00BF732900
        A96D3B00BA6D3F00C15B0000C35D0000C45E0000C5600100C8620000CA640000
        CD670000CD690400CA6A0E00D16B0000D26C0000D46E0000D16D0700D6700000
        D8720000DA740000DC760000DF790000D9770900D9790E00C1621000CA6A1000
        CA6F1C00C7781F00D5771400D0741900D77C1A00E07A0000E27C0000E47E0000
        E07D0600E07E0A00C7702700C9752C00D47C2300D47F2B00CD7D3800D17F3200
        995F43009E755E00BE714000BF784E00AA7F5900C1744100C6794000E7810000
        E4800600E8820100EB850000ED870000EF890000E8860900EA880A00F08A0000
        F28C0000F48E0000F28E0600F08F0A00F6910100F9930000FA940000FD970000
        FE980000FE9A0600FC9B0B00FE9C0A00FE9D0D00E3851200E0821500EB8E1600
        E4941D00EA901F00FD9F1500FEA11700DE862100CA873C00D3833800D3853C00
        E0872000ED962500E59A2C00E59D3200FAA12200FEA62300F7A32E00FEA92A00
        F2A13300F8A63300FEAB3100F2A33A00F3A43A00F3A53C00BB8E5500A6816A00
        A4816C00B2876400BC966700BB986C00A3857500A5887700B5987700BFA27500
        C8804C00CD875000CA855400CE8C5C00D6945A00DE9E5E00E89C4200E39F5700
        E7A04E00EDA74E00FAAE4100F3AA4A00FCB04200FEB44600F7B04E00FEB44800
        E6A65F00EFAC5A00FEBA5500C59E6300CE916A00D1916100D99B6300DC9F6A00
        D89D6D00D69C7200D69F7500DEA46F00DAA17600ECAD6500E1A46800E2A76C00
        FBBC6300F1B66B00F4BE7A00FEC06500FCC47200AC948500D4A18000DDA98000
        DEAC8600DBAD8D00E4B28600EBB88400EEBE8600E2B18900E6B58A00E3B48E00
        E7B98F00FECA8000F3C58E00F5C99200F6CB9500F8CC9000F0C99F00FCD49D00
        E7C3A600EAC4A200ECC7A400EDC9A600EECBA900E9C8AD00F1CDA800F2CFAD00
        F2D0AF00F5D3AE00FDDAA900F9D8AD00EFD4BC00F4D6B600F7DABB00F2D8BF00
        F6DBBF00FBDFBB00F8DDBE00FEE0B700FAE0BF00FDE2BE00F5DBC200F7DEC400
        FAE2C600FCE3C600FCE4C600F7E3CD00FDE6C900FEE7CC00FDE8CD00FAE6D100
        FDE9D100FEECD300FBE9D400FCEAD400FDECD500FCECD900FDEEDC00FDF0DE00
        FEF0E100FDF2E500FDF4E900FEF5ED00FEF7F000FEF8F200FEF9F500FEFCF900
        0000000000000000000000000000000000000000000059272700000000000000
        0000000000000000000000000000000000000000005904022700000000000000
        000000000000000000000000000000000000000059031C022700000000000000
        0000000000000000000000000000000000000059062CAB022700000000000000
        000000000000000000000000000000000000591024D0BF022700000000000000
        000000000000000000000000000000000059240DACE9BF062700000000000000
        000000000000000000000000000000592A12121BE0ECBF062759000000000000
        000000000000000000000000592D161612121299ECECB30D0606265900000000
        000000000000000000002E34323218519BC7E9F3F3EDEDD89921060606590000
        0000000000000000002E36363256C6D8F5F3F3F3F3F3EDEDECD05C0606032800
        00000000000000003D3D3854CDF3F5F6F3E5EAF6F3F3F3F3ECECECC621060606
        00000000000000483D3D9EDDF8F6F6F5B02C30C0F6F3F3F3F3F3ECECC6210306
        250000000000744043A7F5F8F6F8F5F81B12061EBDF3F6F3F3F3F3EDECD62406
        061E000000744D4F9FF3F8F8F8F8F8F82A120DB05AD3F5F3F3F3F3EDECECBF10
        0606590000784D74EDF8F8FAF8F8FAF8B2161298DBCFF5F6F3F3F3F3EDECE99A
        0D062100A46161B8F8F8FAFAFAFAF8FACD45161BF8F6F6F5F6F3F3F3EDECECD6
        0D0D0D598C6976D9FAFAFAFAFAFAFAFAF37E1816D0F6F5F6F3F6F3F3F3EDECEC
        5D0D0D596A6987EDFAFAFAFAFAFDFAFAFAB63218ADF8F8F6F5F5F3F3F3EDECEC
        AE120D106D698CF3FAFAFAFAFDFAFDFAFCDD363252E5F8F6F6F5F3F6EDEDEDEC
        C112120D6D6D88F3FAFAFDFDFDFDFDFAFDFA493646D3F6F8F6F5F6F3F3EDEDEC
        C1121212796D84E4FAFDFAFDFDFEFDFEF8E47B3D36B6F8F8F6F5F5F3F3F3EDEC
        AE16121BA46D71D9FAFAFEFDFEFEFEFDFACB9D7F3D53F8F8F6F6F5F6F3F3EDEC
        5616165DA47070A9FDFDFEFEFEFEFEFEFDFCFAFDF5E9F8F8F6F6F3F3F3F3EDD8
        18161600007A7071F3FDFEFEFEFEFEFEFDFDFCFAF3F3F8F8F6F5F6F5F3F3ED9C
        32322F0000A47070A9F8FDFEFEFEFEFEFCFDFCCC615FCBF8F8F6F5F3F3F3C339
        323200000000707071BBFDFDFEFEFDFCFEFCF8A16961A0F8F6F5F5F6F3D94A36
        34470000000000777070BAF3FDFDFEFCFCFCFABB6D6AB9F8F5F6F3F3C34B3D36
        2B0000000000000070707089D9FAFCFCFCFAFCF5CECEF5F6F5F6E9B443403D3D
        0000000000000000008170707086C8E4EDFAF8FAF8F8F3E0CCA84D4F4F407C00
        00000000000000000000A4717070707A89A6B7BBBAA58C8065614D4D43950000
        000000000000000000000000A482717070706D6D6B69696961658D9100000000
        000000000000000000000000000000A4A48470706D6D85A2A400000000000000
        00000000FFFFC7FFFFFF87FFFFFF07FFFFFE07FFFFFC07FFFFF807FFFFE003FF
        FF0000FFFC00003FF800001FF000000FE0000007C00000038000000180000001
        0000000000000000000000000000000000000000000000000000000000000001
        8000000180000003C0000003E0000007F000000FF800001FFC00003FFF0000FF
        FFE007FF}
    end
    object Label1: TLabel
      Left = 56
      Top = 8
      Width = 397
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 
        'Esta janela '#233' usada para cadastrar logradouros. Digite o n'#250'mero ' +
        'do cep no campo abaixo e aperte o bot'#227'o "pesquisar" em seguida. ' +
        'Caso o logradouro pesquisado n'#227'o seja encontrado, clique no bot'#227 +
        'o "Novo" para cadastrar um novo logradouro.'
      WordWrap = True
    end
    object Bevel1: TBevel
      Left = 0
      Top = 49
      Width = 466
      Height = 8
      Align = alBottom
      Shape = bsBottomLine
    end
  end
  object DBEdit1: TDBEdit
    Left = 10
    Top = 155
    Width = 71
    Height = 21
    DataField = 'CEPLOG'
    DataSource = FmeDBDelButtons1.DataSource1
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 88
    Top = 155
    Width = 281
    Height = 21
    DataField = 'NOMLOG'
    DataSource = FmeDBDelButtons1.DataSource1
    TabOrder = 2
  end
  inline FmeFKSearchBairro: TFmeFKSearch
    Left = 7
    Top = 198
    Width = 365
    Height = 30
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TabStop = True
    inherited SpeedButton1: TSpeedButton
      Left = 339
    end
    inherited EdtData: TDBEdit
      Width = 333
      DataField = 'NOMBAI'
      DataSource = FmeDBDelButtons1.DataSource1
    end
  end
  object DBEdit3: TDBEdit
    Left = 10
    Top = 253
    Width = 235
    Height = 21
    Color = clBtnFace
    DataField = 'NOMCID'
    DataSource = FmeDBDelButtons1.DataSource1
    ReadOnly = True
    TabOrder = 4
  end
  object DBEdit4: TDBEdit
    Left = 297
    Top = 252
    Width = 46
    Height = 21
    Color = clBtnFace
    DataField = 'SIGEST'
    DataSource = FmeDBDelButtons1.DataSource1
    ReadOnly = True
    TabOrder = 5
  end
  object DBEdit5: TDBEdit
    Left = 10
    Top = 300
    Width = 234
    Height = 21
    Color = clBtnFace
    DataField = 'NOMPAI'
    DataSource = FmeDBDelButtons1.DataSource1
    ReadOnly = True
    TabOrder = 6
  end
  object EdtCep: TMaskEdit
    Left = 9
    Top = 88
    Width = 92
    Height = 21
    EditMask = '99999-999;1;_'
    MaxLength = 9
    TabOrder = 7
    Text = '     -   '
    OnKeyUp = EdtCepKeyUp
  end
  object BtnSearch: TButton
    Left = 107
    Top = 87
    Width = 75
    Height = 25
    Hint = 'Pesquisar!|Localiza o logradouro a partir do cep indicado'
    Caption = '&Pesquisar!'
    TabOrder = 8
    OnClick = BtnSearchClick
  end
  inline FmeDBDelButtons1: TFmeDBDelButtons
    Left = 384
    Top = 86
    Width = 81
    Height = 171
    TabOrder = 9
    TabStop = True
    inherited ActionList1: TActionList
      inherited DataSetInsert1: TDataSetInsert
        Enabled = False
      end
      inherited DataSetPost1: TDataSetPost
        Enabled = False
      end
      inherited DataSetCancel1: TDataSetCancel
        Enabled = False
      end
      inherited DataSetDelete1: TDataSetDelete
        Enabled = False
      end
    end
    inherited DataSource1: TDataSource
      DataSet = CdsLogradouros
    end
  end
  object CdsLogradouros: TClientDataSet
    Aggregates = <>
    ConnectionBroker = DM.CBroker
    Params = <
      item
        DataType = ftString
        Name = 'ceplog'
        ParamType = ptInput
        Size = 9
        Value = '00000-000'
      end>
    ProviderName = 'DspLogradouros'
    AfterInsert = CdsLogradourosAfterInsert
    BeforePost = CdsLogradourosBeforePost
    AfterPost = CdsLogradourosAfterPost
    BeforeDelete = CdsLogradourosBeforeDelete
    AfterDelete = CdsLogradourosAfterPost
    OnReconcileError = CdsLogradourosReconcileError
    Left = 408
    Top = 264
  end
end
