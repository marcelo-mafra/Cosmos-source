unit cosmos.system.types;

interface

uses
  winapi.windows, system.SysUtils;

type
 //Representa um protocolo de comunica��o com o servidor.
 TConnectionProtocol = (cpTCP, cpHTTP, cpHTTPS);

 TNotifyMode = (nmNotify, nmNoNotify, nmRegisterLog);

 TProtocols = set of TConnectionProtocol;

 {Representa a situa��o de uma conex�o como uma sequ�ncia de fases e status finais.}
 TConnectionStatus = (csOnConnectingHost, csHostConnected, csVerifyingIdentity,
   csGettingAuthorizations, csCheckingCertificate, csAuthorizedUser, csAuthenticationInvalid, csLoadingData,
   csApplyPermissions, csOnDisconnectingHost, csHostDisconnected,
   csUserLocked, csServerLocked, csAborted, csRefusedConnection, csHostNotFound,
   csTimeoutExpired, csConnectError, csCreatingConnectionsPool, csBufferingData);

 //Formato de exporta��o de dados.
 TExportFormat = (efMSWord, efMSExcel, efXML, efHTML, efText, efOpenOffice, efCSV);
 TExportFormatSet = set of TExportFormat;

 {Status do usu�rio:
  usCosmosUser = Usu�rio regular do Cosmos.
  usBlockedUser = Usu�rio do Cosmos que est� bloqueado na tabela de usu�rios.
  usUnknown = N�o foi poss�ve identificar o usu�rio na tabela de usu�rios.
  usSysdba = O usu�rio � o usu�rio interno do sistema.}

 TUserStatus = (usCosmosUser, usBlockedUser, usUnknown, usSysdba);

 TCosmosModules = (cmFocos, cmFocosServer, cmSecretarias, cmSecretariasServer, cmFinanceiro,
  cmFinanceiroServer, cmConferencias, cmConferenciasServer, cmUsuarios,
  cmUsuariosServer, cmSincMestre, cmSincEscravo);

 TMessageType = (mtpSucess, mtpError, mtpWarning, mtpConfirmation, mtpInformation);

 TMessageInfo = (miInnerMessage, miInstallationID, miMethodName, miMethodParameters,
   miRoleName, miSourceName, miUserName, miCommand, miExceptionClassName, miCustomInfo);

implementation

end.
