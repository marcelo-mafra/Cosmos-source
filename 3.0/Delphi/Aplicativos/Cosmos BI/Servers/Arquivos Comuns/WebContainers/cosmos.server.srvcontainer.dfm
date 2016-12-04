object DMSrvContainer: TDMSrvContainer
  OldCreateOrder = False
  Height = 347
  Width = 513
  object DSServerCosmos: TDSServer
    Left = 56
    Top = 11
  end
  object DSServerFocusClass: TDSServerClass
    OnGetClass = DSServerFocusClassGetClass
    Server = DSServerCosmos
    Left = 56
    Top = 75
  end
  object DSServerPupilsClass: TDSServerClass
    OnGetClass = DSServerPupilsClassGetClass
    Server = DSServerCosmos
    Left = 56
    Top = 139
  end
  object DSSecurityManager: TDSAuthenticationManager
    OnUserAuthenticate = DSSecurityManagerUserAuthenticate
    Roles = <>
    Left = 168
    Top = 11
  end
end
