unit cosmos.mobile.classes.network;

interface

uses
 System.Classes, AndroidApi.Helpers, Androidapi.JNI.Net, Androidapi.JNI.Java.Net,
 Androidapi.JNI.JavaTypes;

 type
  TNetworkType = (ntWifi, nt3G, nt4G, ntUnknown);

  TNetWorkInfo = record
   NetworkType: TNetworkType;
  end;

  TCustomNetworkInfo = class
    private

    public
     function GetNetworkInfo: TNetWorkInfo; virtual; abstract;
     function HasInternetConnection: boolean; virtual; abstract;
     function HasWifiConnection: boolean; virtual; abstract;
     function HasMobileConnection: boolean; virtual; abstract;
  end;

  TAndroidNetworkInfo = class(TCustomNetworkInfo)
    private

    public
     function GetNetworkInfo: TNetWorkInfo; override;
     function HasInternetConnection: boolean; override;
     function HasWifiConnection: boolean; override;
     function HasMobileConnection: boolean; override;
  end;

implementation

{ TAndroidNetworkInfo }

function TAndroidNetworkInfo.GetNetworkInfo: TNetWorkInfo;
begin

end;

function TAndroidNetworkInfo.HasInternetConnection: boolean;
begin

end;

function TAndroidNetworkInfo.HasMobileConnection: boolean;
begin

end;

function TAndroidNetworkInfo.HasWifiConnection: boolean;
begin
//TAndroidHelper.Activity.getSystemService(TJContext.JavaClass.WIFI_SERVICE);
end;

end.
