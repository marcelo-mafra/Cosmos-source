object FmeUsuarioCadastrador: TFmeUsuarioCadastrador
  Left = 0
  Top = 0
  Width = 308
  Height = 44
  TabOrder = 0
  TabStop = True
  DesignSize = (
    308
    44)
  object Label1: TLabel
    Left = 3
    Top = 2
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object Label2: TLabel
    Left = 192
    Top = 2
    Width = 23
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Data'
  end
  object SpeedButton1: TSpeedButton
    Left = 164
    Top = 17
    Width = 23
    Height = 22
    Hint = 
      'Dados do Usu'#225'rio|Exibe os dados completos do usu'#225'rio respons'#225'vel' +
      ' pela informa'#231#227'o.'
    Anchors = [akTop, akRight]
    Flat = True
    Glyph.Data = {
      96030000424D9603000000000000360000002800000010000000120000000100
      1800000000006003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7C1B1BA4715BA4715BA
      4715BA4715BA4715E2B5A1F1DAD1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFDDA891BD4012D54E2BED5D44FD6655FD6655F3654EBA4715E05537CF53
      2ED89C82FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD89C82D44D2AF6624DFD6957FD
      7A62FD8066CD6133DC9E6CEA6648FD6856DC5333DDA891FFFFFFFFFFFFFFFFFF
      FFFFFFE7C1B1DC5333FD6856FD7D64FE8C6FDC6F45EBB481FAD7A5D75E36FD7A
      62FB6552CD6B46FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9633DF87058FD856AEF
      8661D37B47FFD3A0FFD3A0D26D3EFD8268F36A51CD6B46FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF6E7E0C95E36E5714DA945278F6C7E8F6F81DFA78BD77244F481
      61CE6B46FBF3F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABA3A052261802
      033D0A1B810A1B81040B71793540D89C82FBF3F0FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF0F0F03131310404040303030C2356143897153BA0153BA0061C7CE0E2
      EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0EDE07171711515151B1B1B0C234F1B
      4EB31B4EB31B4EB31B4EB31644A77180B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF2929291B1B1B1616161336762366CB256DD22774D9256DD22161C64562
      A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C0C0C282828343434143B6E27
      74D92A7EE32A7EE3297BE02774D90B4496FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF4E4E4E3434343B3B3B131C293294FA3499FF379CFF359AFF3190F62B64
      ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080803636364E4E4E3B3B3B18
      2746153D7F2469D43084EE2F87E9516E8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF0F0F02929294B4B4B5E5E5E7E7E7E838383393939181E420E0F18A0A0
      A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C02121216F6F6F8A
      8A8A9898989A9A9A5F5F5F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFD0D0D0505050494949464646333333666666F0F0F0FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    OnClick = SpeedButton1Click
  end
  object DBEdit1: TDBEdit
    Left = 3
    Top = 17
    Width = 159
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 0
    OnKeyPress = DBEdit1KeyPress
  end
  object DBEdit2: TDBEdit
    Left = 192
    Top = 17
    Width = 112
    Height = 21
    Anchors = [akTop, akRight]
    ReadOnly = True
    TabOrder = 1
  end
end
