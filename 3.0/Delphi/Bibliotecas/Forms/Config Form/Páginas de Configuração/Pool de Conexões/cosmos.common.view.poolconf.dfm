object FrmPoolOptions: TFrmPoolOptions
  Left = 0
  Top = 0
  Caption = 'Pool de Conex'#245'es'
  ClientHeight = 505
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  DesignSize = (
    428
    505)
  PixelsPerInch = 96
  TextHeight = 13
  object GrpOptions: TMSGroupHeader
    Left = 8
    Top = 368
    Width = 417
    Height = 128
    Transparent = True
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Op'#231#245'es do Pool'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    object Label1: TLabel
      Left = 16
      Top = 26
      Width = 82
      Height = 13
      Caption = 'Tamanho do Pool'
    end
    object Label5: TLabel
      Left = 184
      Top = 26
      Width = 87
      Height = 13
      Caption = 'Cleanup (minutos)'
    end
    object Label6: TLabel
      Left = 16
      Top = 81
      Width = 109
      Height = 13
      Caption = 'Timeout (milisegundos)'
    end
    object EdtPoolSize: TSpinEdit
      Left = 16
      Top = 44
      Width = 121
      Height = 22
      MaxValue = 100
      MinValue = 1
      TabOrder = 0
      Value = 1
      OnChange = EdtPoolSizeChange
    end
    object EdtCleanup: TSpinEdit
      Left = 184
      Top = 44
      Width = 121
      Height = 22
      MaxValue = 100
      MinValue = 1
      TabOrder = 1
      Value = 1
      OnChange = EdtPoolSizeChange
    end
    object EdtTimeout: TSpinEdit
      Left = 16
      Top = 100
      Width = 121
      Height = 22
      MaxValue = 50000
      MinValue = 1000
      TabOrder = 2
      Value = 1000
      OnChange = EdtPoolSizeChange
    end
  end
  object GrpModel: TMSGroupHeader
    Left = 8
    Top = 8
    Width = 417
    Height = 355
    Transparent = True
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Modelo de Funcionamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    DesignSize = (
      417
      355)
    object Label2: TLabel
      Left = 32
      Top = 55
      Width = 359
      Height = 52
      Anchors = [akLeft, akTop, akRight]
      Caption = 
        'As conex'#245'es do pool ser'#227'o criadas uma a uma, na medida em que s'#227 +
        'o demandadas novas conex'#245'es. Possui a vantagem de tornar a inici' +
        'aliza'#231#227'o mais '#225'gil, mas at'#233' que o pool esteja preenchido as requ' +
        'isi'#231#245'es de conex'#227'o podem responder mais lentamente.'
      WordWrap = True
    end
    object Label3: TLabel
      Left = 32
      Top = 147
      Width = 354
      Height = 39
      Anchors = [akLeft, akTop, akRight]
      Caption = 
        'Todas as conex'#245'es previstas para o pool s'#227'o criadas e ativas dur' +
        'ante a autentica'#231#227'o. Esta op'#231#227'o torna a autentica'#231#227'o um pouco ma' +
        'is lenta, mas tem a vantagem de retornar rapidamente novas requi' +
        'si'#231#245'es de conex'#227'o.'
      WordWrap = True
    end
    object Label4: TLabel
      Left = 32
      Top = 230
      Width = 369
      Height = 39
      Anchors = [akLeft, akTop, akRight]
      Caption = 
        'Todas as requisi'#231#245'es criam uma nova conex'#227'o no pool para, depois' +
        ' do uso, destru'#237'-la. Deve ser usado em situa'#231#245'es onde a Internet' +
        ' '#233' lenta ou inst'#225'vel, acarretando frequentes quedas de conex'#227'o.'
      WordWrap = True
    end
    object Label7: TLabel
      Left = 32
      Top = 313
      Width = 350
      Height = 26
      Anchors = [akLeft, akTop, akRight]
      Caption = 
        'Todas as requisi'#231#245'es de dados ser'#227'o atendidas por um mesmo objet' +
        'o de conex'#227'o. Deve ser usado apenas em caso de problemas no pool' +
        '.'
      WordWrap = True
    end
    object RdbOnDemand: TRadioButton
      Left = 16
      Top = 32
      Width = 153
      Height = 17
      Caption = 'Por demanda de conex'#245'es.'
      TabOrder = 0
      OnClick = RdbOnDemandClick
    end
    object RdbCreateFull: TRadioButton
      Left = 16
      Top = 124
      Width = 353
      Height = 17
      Caption = 'Cria'#231#227'o completa na inicializa'#231#227'o.'
      TabOrder = 1
      OnClick = RdbOnDemandClick
    end
    object RdbCreateDestroy: TRadioButton
      Left = 16
      Top = 207
      Width = 225
      Height = 17
      Caption = 'Cria'#231#227'o e destrui'#231#227'o ap'#243's o uso.'
      Enabled = False
      TabOrder = 2
      OnClick = RdbOnDemandClick
    end
    object RdbNoPool: TRadioButton
      Left = 16
      Top = 290
      Width = 265
      Height = 17
      Caption = 'N'#227'o utilizar um pool de conex'#245'es (modelo simples)'
      Checked = True
      TabOrder = 3
      TabStop = True
      OnClick = RdbOnDemandClick
    end
  end
  object ImageList1: TImageList
    Height = 18
    Width = 18
    Left = 320
    Top = 40
    Bitmap = {
      494C010101007800780012001200FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000048000000120000000100100000000000200A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002A25AD35CE39
      8D31A51400000000A614C718AD318C2D29210000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000E7616872AC41B5565A6B185F3146E71CE62027314A29F03DB656B552
      52466B2900000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000766EF7FAE319D73103EAD31
      4A291042CF39CF39AE356B2DAD314A29B552AE35000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000766EF7FAF35BD77F03DE959AD31FF7FBD779C73185FEF3D630C4A29
      D656F03D00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000766F17FD035FF7FF03D8C2D
      EF3DEF3DF039F03DEF3DEF3D8D314A297B6FF03D000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000E75D696E0E46D756FF7F9D739D73B652EB41504AD756FF7FDE779D73
      B6568D3100000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000696E724EF135D035
      B0310D46277F6B7F714ED039F039F1398D310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000006A6ED47F267F267F267F277F267F6B7FB37F2E7FF47F066A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000854D496EAD72D57F057F067F
      067F067F057FD67F0766A655286AC65500000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000766D67FB67F2A7FE47EE47EE47EE47EE37ED77F0766000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000766D77FD77FD77FD87F2A7F
      2A7FD87FD87FD87F076600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000065454A6E6B6E6B6E6A6E967FB77F6A6E6B6E6A6E6545000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000023391277
      757FA55500000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000766FB7FFB7F0766000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000E7616A6E
      6A6EE76100000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000048000000120000000100010000000000D80000000000000000000000
      000000000000000000000000FFFFFF00FFFFC0000000000000000000FFFFC000
      0000000000000000F060C0000000000000000000800040000000000000000000
      8000400000000000000000008000400000000000000000008000400000000000
      00000000800040000000000000000000E000C0000000000000000000E001C000
      00000000000000008001C0000000000000000000800FC0000000000000000000
      800FC0000000000000000000800FC0000000000000000000F87FC00000000000
      00000000F87FC0000000000000000000F87FC0000000000000000000FFFFC000
      000000000000000000000000000000000000000000000000000000000000}
  end
end
