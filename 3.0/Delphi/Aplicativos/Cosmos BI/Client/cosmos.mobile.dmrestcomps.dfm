object DMRestComps: TDMRestComps
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 329
  Width = 336
  object RESTClient: TRESTClient
    Authenticator = OAuth1Authenticator1
    Params = <>
    HandleRedirects = True
    Left = 56
    Top = 120
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient
    Params = <>
    Response = RESTResponse1
    OnAfterExecute = RESTRequest1AfterExecute
    SynchronizedEvents = False
    Left = 56
    Top = 192
  end
  object RESTResponse1: TRESTResponse
    Left = 160
    Top = 192
  end
  object OAuth1Authenticator1: TOAuth1Authenticator
    Left = 160
    Top = 120
  end
end
