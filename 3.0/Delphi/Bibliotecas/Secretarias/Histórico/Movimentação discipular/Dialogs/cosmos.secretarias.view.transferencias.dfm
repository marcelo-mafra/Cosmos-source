object FrmTransferencia: TFrmTransferencia
  Left = 0
  Top = 0
  HelpContext = 325
  BorderStyle = bsDialog
  Caption = 'Transfer'#234'ncia de Foco'
  ClientHeight = 532
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  DesignSize = (
    527
    532)
  PixelsPerInch = 96
  TextHeight = 13
  object MSGroupHeader1: TMSGroupHeader
    Left = 4
    Top = 13
    Width = 521
    Height = 108
    Transparent = True
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Transferido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    DesignSize = (
      521
      108)
    object Label6: TLabel
      Left = 8
      Top = 17
      Width = 56
      Height = 13
      Caption = '&Cadastrado'
      FocusControl = EdtNome
    end
    object Label4: TLabel
      Left = 152
      Top = 62
      Width = 51
      Height = 13
      Caption = '&Foco Atual'
      FocusControl = EdtFocoAtual
    end
    object Label5: TLabel
      Left = 8
      Top = 62
      Width = 53
      Height = 13
      Caption = '&Discipulado'
      FocusControl = EdtDiscipulado
    end
    object EdtNome: TEdit
      Left = 8
      Top = 32
      Width = 502
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object EdtDiscipulado: TEdit
      Left = 8
      Top = 79
      Width = 113
      Height = 21
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object EdtFocoAtual: TEdit
      Left = 152
      Top = 79
      Width = 358
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  object MSGroupHeader2: TMSGroupHeader
    Left = 4
    Top = 140
    Width = 521
    Height = 354
    Transparent = True
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Dados da Transfer'#234'ncia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    DesignSize = (
      521
      354)
    object Label1: TLabel
      Left = 8
      Top = 70
      Width = 76
      Height = 13
      Caption = 'Transferido &em:'
      FocusControl = EdtDataTransferencia
    end
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 76
      Height = 13
      Caption = 'Transferir &para:'
      FocusControl = FmeSearchNovoFoco.EdtSearch
    end
    object Label3: TLabel
      Left = 7
      Top = 168
      Width = 63
      Height = 13
      Caption = '&Observa'#231#245'es'
      FocusControl = MmoObservacoes
    end
    object EdtDataTransferencia: TDateTimePicker
      Left = 8
      Top = 87
      Width = 241
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Date = 41632.721194074070000000
      Time = 41632.721194074070000000
      TabOrder = 0
    end
    object ChkManterCirculo: TCheckBox
      Left = 8
      Top = 130
      Width = 273
      Height = 17
      Caption = '&Manter aluno no atual c'#237'rculo da Escola Interna'
      TabOrder = 2
    end
    object MmoObservacoes: TMemo
      Left = 7
      Top = 184
      Width = 503
      Height = 166
      Anchors = [akLeft, akTop, akRight, akBottom]
      ScrollBars = ssVertical
      TabOrder = 3
    end
    inline FmeSearchNovoFoco: TFmeSearchData
      Left = 7
      Top = 39
      Width = 502
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = True
      ExplicitLeft = 7
      ExplicitTop = 39
      ExplicitWidth = 502
      ExplicitHeight = 25
      inherited SbnButton: TSpeedButton
        Left = 479
        ExplicitLeft = 283
      end
      inherited EdtSearch: TEdit
        Width = 477
        ExplicitWidth = 477
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 257
    Top = 499
    Width = 91
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Transferir!'
    Glyph.Data = {
      26040000424D2604000000000000360000002800000012000000120000000100
      180000000000F003000000000000000000000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      0000FF00FFFF00FFFF00FF00558E003E67FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FF
      FF00FF076AAD004A7CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FF247CB7005F
      9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF0000FF00FFFF00FFFF00FF2D81BA1070B0FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      0000FF00FFFF00FFFF00FF3D8BBF1E78B5FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FF589BC8
      408CC03183BB458FC2448FC11371B1FF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF00497AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF24
      7CB73AA5CE00548CFF00FFFF00FFFF00FFFF00FF004473FF00FFFF00FFFF00FF
      0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3F8CC0FF00FF
      FF00FFFF00FFFF00FF004B7D004472FF00FFFF00FFFF00FF0000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B7E004D
      812185A6004879FF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF0061A23494B975EAEA65E3E3004A7CFF
      00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF0064A89BFDFD8DFEFE74E9E9004A7CFF00FFFF00FFFF00FF
      0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF076AAD
      5EAED3B5FFFFA9FFFF93FFFF00558FFF00FFFF00FFFF00FF0000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3988BE4E95C5569AC7589BC8589B
      C8458FC21271B1FF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF0000}
    ModalResult = 1
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 361
    Top = 499
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Cancelar'
    Glyph.Data = {
      9E020000424D9E0200000000000036000000280000000E0000000E0000000100
      1800000000006802000000000000000000000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFEB6390C02A71B528
      69B52869A82A5D8D26508D26508D26508D2650FF00FFFF00FFFF00FF0000FF00
      FFFF00FFEF6B94F78AA7F8749EEF6B94E3678EDB5B84CF53778D2650FF00FFFF
      00FFFF00FFFF00FF0000FF00FFFF00FFEF6B94FB95B1F8749EF56A9AEE6395CF
      53778D2650FF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFF27198FD
      9BB6F78AA7F27198F56A9AEB5A93CF53778D2650FF00FFFF00FFFF00FFFF00FF
      0000FF00FFFF00FFF0799FF5B0C4FD9BB6F8749EF8749EF56A9AEB5A93CF5377
      8D2650FF00FFFF00FFFF00FF0000FF00FFFF00FFF97BA0F5B0C4FD9BB6FD9BB6
      F8749EF8749EF56A9AEB5A93CF53778D2650FF00FFFF00FF0000FF00FFFF00FF
      F97BA0F5B0C4F97BA0F5B0C4FD9BB6F8749EF8749EF56A9AEB5A93AC3A5CFF00
      FFFF00FF0000FF00FFFF00FFF78AA7F97BA0FF00FFF97BA0F5B0C4FD9BB6F97B
      A0F8749EDA6D8AFF00FFFF00FFFF00FF0000FF00FFFF00FFF78AA7FF00FFFF00
      FFFF00FFF97BA0F5B0C4FD9BB6E57E95FF00FFFF00FFFF00FFFF00FF0000FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF97BA0FD9BB6FF00FFFF00FFFF
      00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      0000}
    ModalResult = 2
    TabOrder = 3
  end
  object BitBtn3: TBitBtn
    Left = 450
    Top = 499
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Ajuda'
    Glyph.Data = {
      46050000424D4605000000000000360000002800000012000000120000000100
      2000000000001005000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E7CEC600E7CE
      C600DECEC600DEC6BD00DEC6BD00E7CEBD00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00EFCEC600EFE7
      DE00EFEFEF00E7E7EF00DED6D600D6CECE00CECECE00C6C6BD00CEB5B500E7CE
      BD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00EFCE
      C600F7F7EF00F7FFFF00E7CEC600D6947300D68C6300D68C6300D68C6B00CEB5
      A500C6C6C600C6B5B500DEC6B500FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00EFCEBD00FFF7F700FFFFFF00DEA58400CE632900CE632900F7E7D600F7D6
      C600CE632900CE632900CE947B00C6C6C600CEBDBD00E7CEBD00FF00FF00FF00
      FF00FF00FF00FF00FF00F7EFE700FFFFFF00E7AD9400CE5A2100CE632900CE6B
      3100EFBDA500E7B59C00CE633100CE633100CE632100D69C7B00CECECE00DEC6
      BD00FF00FF00FF00FF00FF00FF00EFCEC600FFFFFF00F7E7DE00D6733900CE63
      3100CE633100D6734200E7B59C00E7A58400CE632900CE6B3100CE633100CE6B
      3100D6C6BD00D6D6D600E7CEBD00FF00FF00FF00FF00EFDED600FFFFFF00EFBD
      9C00D6733900D6734200CE6B3100D67B4A00FFFFF700FFF7EF00CE6B3900CE63
      2900CE6B3100CE632900D6A58400DEE7E700E7CEC600FF00FF00FF00FF00F7E7
      DE00FFFFFF00E7AD8400D6844200D6844A00D67B4200CE6B3900EFC6B500FFFF
      FF00F7D6C600D6734200CE632900CE632900D68C6B00EFEFF700E7D6C600FF00
      FF00FF00FF00F7E7DE00FFFFFF00EFB58C00DE8C5200DE8C5200D6844A00D67B
      4200D6734200EFC6B500FFFFFF00F7E7DE00D6734200CE5A2100DE946B00F7F7
      FF00EFD6CE00FF00FF00FF00FF00EFDECE00FFFFFF00F7CEB500DE945A00E79C
      6300E79C6B00DE8C5200D6844A00D6733900EFC6AD00FFFFFF00E7AD9400C652
      1800E7AD8C00F7FFFF00EFD6C600FF00FF00FF00FF00EFDECE00FFFFFF00FFF7
      E700E7A56B00F7DEC600FFFFFF00EFB59400DE844A00D67B3900E7AD8C00FFFF
      FF00EFBDA500CE6B3100F7E7DE00F7F7F700EFD6C600FF00FF00FF00FF00FF00
      FF00F7E7E700FFFFFF00F7D6B500EFC69C00FFFFFF00FFFFF700EFCEB500EFCE
      AD00FFFFF700FFFFFF00DE946300E7B59400FFFFFF00EFDED600FF00FF00FF00
      FF00FF00FF00FF00FF00EFD6CE00FFF7EF00FFFFFF00F7D6AD00F7CEAD00FFEF
      E700FFFFF700FFFFF700FFE7DE00EFB58C00EFBD9C00FFFFFF00F7EFEF00EFDE
      D600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00EFD6CE00FFF7EF00FFFF
      FF00FFEFDE00F7D6B500F7D6AD00EFCEAD00EFCEAD00F7E7D600FFFFFF00F7EF
      EF00EFCEC600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00EFD6CE00F7EFE700FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      F700F7E7E700F7E7E700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00EFD6CE00EFD6CE00EFDECE00EFD6
      CE00EFD6CE00EFD6CE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00}
    TabOrder = 4
    OnClick = BitBtn3Click
  end
end
