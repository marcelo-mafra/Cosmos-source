object CosmosFinanceiroService: TCosmosFinanceiroService
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
  DisplayName = 'Cosmos Financeiro Service'
  AfterInstall = ServiceAfterInstall
  OnShutdown = ServiceShutdown
  OnStart = ServiceStart
  Height = 453
  Width = 555
  object DSServerFinanceiro: TDSServer
    OnPrepare = DSServerFinanceiroPrepare
    OnConnect = DSServerFinanceiroConnect
    OnDisconnect = DSServerFinanceiroDisconnect
    OnError = DSServerFinanceiroError
    OnTrace = DSServerFinanceiroTrace
    Left = 96
    Top = 11
  end
  object DSAuthenticationManager: TDSAuthenticationManager
    OnUserAuthenticate = DSAuthenticationManagerUserAuthenticate
    OnUserAuthorize = DSAuthenticationManagerUserAuthorize
    Roles = <>
    Left = 96
    Top = 133
  end
  object DSServerApplicationClass: TDSServerClass
    OnGetClass = DSServerApplicationClassGetClass
    Server = DSServerFinanceiro
    Left = 280
    Top = 11
  end
  object DSServerFinanceiroClass: TDSServerClass
    OnGetClass = DSServerFinanceiroClassGetClass
    Server = DSServerFinanceiro
    Left = 280
    Top = 67
  end
  object DSTCPServerTransport: TDSTCPServerTransport
    Port = 2130
    Server = DSServerFinanceiro
    Filters = <>
    AuthenticationManager = DSAuthenticationManager
    OnConnect = DSTCPServerTransportConnect
    OnDisconnect = DSTCPServerTransportDisconnect
    Left = 96
    Top = 73
  end
end
