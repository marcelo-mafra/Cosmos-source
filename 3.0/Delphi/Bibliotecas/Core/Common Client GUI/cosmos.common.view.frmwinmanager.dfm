object FrmWindowsManager: TFrmWindowsManager
  Left = 0
  Top = 0
  ActiveControl = LsvWindows
  Caption = 'Windows Manager'
  ClientHeight = 495
  ClientWidth = 203
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000040020000000000000000000000000000000000000000
    00006E6E6E0056565600FFD48E00CECECE00B97A0000F0FBFF00D4FFFF006BFF
    FF00734A0000FFE2B100FFFFFF00000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    009090000000000000000000000000009A999A90000000000000000000000000
    A9A0A9A82222222222222222100000099AA9AA99788888888888888820000000
    909990977777777777777778200000099AA9AA99777777777777777820000000
    A9ABA9A77777777779977778200000009A999A97777777777997777820000000
    0097977777777777799777782000000002677777777777777997777820000000
    0267777777777777777777782000000002677777777777777997777820000000
    0267777777777777799777782000000002677777777777777777777820000000
    0267777777777777777777782000000002666666666666666666666620000000
    0222222222222222222222222000000002555555555555555524242420000000
    0233333333333333332424242000000001222222222222222222222210000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7FFFFFF01FFFFFF100
    0007E0000007F4400007E0000007F0000007F0000007FC000007F8000007F800
    0007F8000007F8000007F8000007F8000007F8000007F8000007F8000007F800
    0007F8000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LsvWindows: TListView
    Left = 0
    Top = 0
    Width = 203
    Height = 495
    Align = alClient
    BorderWidth = 3
    Columns = <>
    IconOptions.AutoArrange = True
    ReadOnly = True
    RowSelect = True
    ParentShowHint = False
    PopupMenu = PopMnWindowsManager
    ShowWorkAreas = True
    ShowHint = True
    SmallImages = MainList
    TabOrder = 0
    ViewStyle = vsList
    OnInfoTip = LsvWindowsInfoTip
    OnSelectItem = LsvWindowsSelectItem
  end
  object PopMnWindowsManager: TPopupActionBar
    OnPopup = PopMnWindowsManagerPopup
    Left = 24
    Top = 56
    object MenuItem1: TMenuItem
    end
    object MenuItem2: TMenuItem
    end
    object MenuItem3: TMenuItem
    end
    object MenuItem4: TMenuItem
    end
  end
  object MainList: TImageList
    Height = 18
    Width = 18
    Left = 56
    Top = 56
    Bitmap = {
      494C010101000800580012001200FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000480000001200000001002000000000004014
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B0A0900060483000604830006048300060483000604830006048
      3000604830006048300060483000604830006048300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B0A09000E0C8C000D0C0B000D0B8B000D0B8B000C0B0A000C0B0
      A000C0B0A000C0B0A000C0B0A000C0B0A0006048300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B0A0
      900060483000B0A09000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0B0A0006048300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B0A0
      9000FFFFFF00B0A09000FFFFFF00FFC0A000FFB89000FFB09000FFA88000F0A0
      7000F0987000F0986000FFFFFF00C0B0A0006048300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0A0900060483000B0A0
      9000FFFFFF00C0A8A000FFFFFF00FFC0A000FFB89000FFB09000FFA88000F0A0
      7000F0987000F0986000FFFFFF00C0A8A0006048300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0A09000FFFFFF00B0A0
      9000FFFFFF00C0B0A000FFFFFF00FFC0A000FFB89000FFB09000FFA88000F0A0
      7000F0987000F0986000FFFFFF00C0B0A0006048300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0A09000FFFFFF00C0A8
      A000FFFFFF00D0B0A000FFFFFF00FFC0A000FFB89000FFB09000FFA88000F0A0
      7000F0987000F0986000FFFFFF00C0B0A0006048300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0A09000FFFFFF00C0B0
      A000FFFFFF00D0B8A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D0B8B0006048300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0A8A000FFFFFF00D0B0
      A000FFFFFF00F0A89000F0A89000F0A89000F0A88000F0A08000E0987000E090
      6000E0885000E0704000E0704000E0704000D060300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0B0A000FFFFFF00D0B8
      A000FFFFFF00F0A89000FFC0A000FFC0A000FFC0A000FFB89000FFB89000FFB0
      9000FFA88000F0A07000F0987000F0986000D068300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D0B0A000FFFFFF00F0A8
      9000F0A89000F0A89000F0A89000F0A89000F0A89000F0A88000F0A08000F098
      7000E0987000E0805000E0784000E0784000E070400000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D0B8A000FFFFFF00F0A8
      9000FFC0A000FFC0A000FFC0A000FFB89000FFB89000FFB09000FFA88000F0A0
      7000F0987000F0986000D0683000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0A89000F0A89000F0A8
      9000F0A89000F0A89000F0A89000F0A88000F0A08000F0987000E0987000E080
      5000E0784000E0784000E0704000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0A89000FFC0A000FFC0
      A000FFC0A000FFB89000FFB89000FFB09000FFA88000F0A07000F0987000F098
      6000D06830000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0A89000F0A89000F0A8
      9000F0A89000F0A88000F0A08000F0987000E0987000E0805000E0784000E078
      4000E07040000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000048000000120000000100010000000000D80000000000000000000000
      000000000000000000000000FFFFFF00FFFFC0000000000000000000FFFFC000
      0000000000000000F80040000000000000000000F80040000000000000000000
      E00040000000000000000000E000400000000000000000008000400000000000
      0000000080004000000000000000000080004000000000000000000080004000
      0000000000000000800040000000000000000000800040000000000000000000
      8000400000000000000000008001C00000000000000000008001C00000000000
      000000008007C00000000000000000008007C0000000000000000000FFFFC000
      000000000000000000000000000000000000000000000000000000000000}
  end
end
