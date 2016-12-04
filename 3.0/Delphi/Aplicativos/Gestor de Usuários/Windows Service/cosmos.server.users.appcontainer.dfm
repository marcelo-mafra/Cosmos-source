object CosmosUsuariosService: TCosmosUsuariosService
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
  DisplayName = 'Cosmos Usu'#225'rios Service'
  AfterInstall = ServiceAfterInstall
  OnShutdown = ServiceShutdown
  OnStart = ServiceStart
  Height = 453
  Width = 555
  object DSServerUsuarios: TDSServer
    OnPrepare = DSServerUsuariosPrepare
    OnConnect = DSServerUsuariosConnect
    OnDisconnect = DSServerUsuariosDisconnect
    OnError = DSServerUsuariosError
    OnTrace = DSServerUsuariosTrace
    Left = 96
    Top = 11
  end
  object DSAuthenticationManager: TDSAuthenticationManager
    OnUserAuthenticate = DSAuthenticationManagerUserAuthenticate
    OnUserAuthorize = DSAuthenticationManagerUserAuthorize
    Roles = <>
    Left = 96
    Top = 141
  end
  object DSServerApplicationClass: TDSServerClass
    OnGetClass = DSServerApplicationClassGetClass
    Server = DSServerUsuarios
    Left = 280
    Top = 11
  end
  object DSServerUsuariosClass: TDSServerClass
    OnGetClass = DSServerUsuariosClassGetClass
    Server = DSServerUsuarios
    Left = 280
    Top = 75
  end
  object DSTCPServerTransport: TDSTCPServerTransport
    Port = 2140
    Server = DSServerUsuarios
    Filters = <>
    AuthenticationManager = DSAuthenticationManager
    OnConnect = DSTCPServerTransportConnect
    OnDisconnect = DSTCPServerTransportDisconnect
    Left = 96
    Top = 73
  end
end
