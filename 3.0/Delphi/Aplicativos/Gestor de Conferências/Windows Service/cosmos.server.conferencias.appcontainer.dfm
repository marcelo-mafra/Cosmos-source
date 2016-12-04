object CosmosConferenciasService: TCosmosConferenciasService
  OldCreateOrder = False
  OnCreate = ServiceCreate
  OnDestroy = ServiceDestroy
  Dependencies = <
    item
      Name = 'FirebirdServerDefaultInstance'
      IsGroup = False
    end
    item
      Name = 'Tcpip'
      IsGroup = False
    end>
  DisplayName = 'Cosmos Confer'#234'ncias Service'
  AfterInstall = ServiceAfterInstall
  OnShutdown = ServiceShutdown
  OnStart = ServiceStart
  Height = 453
  Width = 555
  object DSServerConferencias: TDSServer
    OnPrepare = DSServerConferenciasPrepare
    OnConnect = DSServerConferenciasConnect
    OnDisconnect = DSServerConferenciasDisconnect
    OnError = DSServerConferenciasError
    OnTrace = DSServerConferenciasTrace
    Left = 96
    Top = 11
  end
  object DSAuthenticationManager: TDSAuthenticationManager
    OnUserAuthenticate = DSAuthenticationManagerUserAuthenticate
    OnUserAuthorize = DSAuthenticationManagerUserAuthorize
    Roles = <>
    Left = 88
    Top = 141
  end
  object DSServerApplicationClass: TDSServerClass
    OnGetClass = DSServerApplicationClassGetClass
    Server = DSServerConferencias
    Left = 280
    Top = 11
  end
  object DSServerLogradourosClass: TDSServerClass
    OnGetClass = DSServerLogradourosClassGetClass
    Server = DSServerConferencias
    Left = 440
    Top = 11
  end
  object DSServerAtividadesClass: TDSServerClass
    OnGetClass = DSServerAtividadesClassGetClass
    Server = DSServerConferencias
    Left = 440
    Top = 83
  end
  object DSServerConferenciasClass: TDSServerClass
    OnGetClass = DSServerConferenciasClassGetClass
    Server = DSServerConferencias
    Left = 272
    Top = 83
  end
  object DSTCPServerTransport: TDSTCPServerTransport
    Port = 2110
    Server = DSServerConferencias
    Filters = <>
    AuthenticationManager = DSAuthenticationManager
    OnConnect = DSTCPServerTransportConnect
    OnDisconnect = DSTCPServerTransportDisconnect
    Left = 96
    Top = 73
  end
end
