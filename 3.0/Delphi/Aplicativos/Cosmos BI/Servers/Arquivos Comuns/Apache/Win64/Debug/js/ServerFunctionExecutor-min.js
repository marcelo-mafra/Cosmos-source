$$USE_SESSION_COOKIE$$=false;$$SESSION_COOKIE_PREFIX$$="";initSessionData(false);function getAuth(a,b,c){if(isReferenceAFunction(convertStringToBase64)){var d=convertStringToBase64(a+":"+b);return{"authentication":d}}if(c===true){alert("convertStringToBase64 was not found.")}return null}function ServerFunctionExecutor(p,q,r){this.connectionInfo=q;this.host=getConnectionHost(q);this.port=getConnectionPort(q);this.dsContext=getDSContext(q);this.restContext=getRestContext(q);this.cacheContext=getCacheContext(q);this.isHttpS=getIsHTTPS(q);this.className=p;this.authentication=(q==null||q.authentication==null)?null:q.authentication;this.owner=r;this.getCacheURL=function(a,b){if(a!=null&&isArray(a)){return null}if(b==null){b=false}var c=this.getURLPrefix(false)+this.cacheContext;var d=false;if(a!=null){a+="";if(a.indexOf("/")==0){a=a.substring(1)}if(a.indexOf("cache/")==0){a=a.substring(6)}c+=a;d=a.indexOf("?")>-1}var e=getSessionID();if(b&&(e!=null)){c+=(d?"&":"?");c+="sid="+encodeURIComponent(e)}return c};this.getURLPrefix=function(a){if(a==null){a=true}var b='';if(this.connectionInfo!=null&&this.connectionInfo.pathPrefix!=null&&this.connectionInfo.pathPrefix!=''){b='/'+this.connectionInfo.pathPrefix}var c=isValidPort(this.port)?":"+this.port:"";var d="/"+this.dsContext;if(a){d+=this.restContext}var e=this.isHttpS?"https://":"http://";return e+encodeURIComponent(this.host)+c+b+d};this.getMethodURL=function(a,b,c,d){if(a==null){return null}b=validateRequestType(b);var e=isValidPort(this.port)?":"+this.port:"";var f="/"+this.dsContext+this.restContext;var g=this.getURLPrefix()+encodeURIComponent(this.className)+"/"+encodeURIComponent(a)+"/";var h=new Array();var i=null;if(isArray(c)){var j=c.length;for(x=0;x<j;x++){var k=c[x];if((h.length>0)||((isArray(k)||isObject(k))&&(b!="GET")&&(b!="DELETE"))){h[h.length]=k}else{g+=encodeURIComponent(k)+"/"}}}else{if(b=="GET"||b=="DELETE"){g+=encodeURIComponent(c)+"/"}else{h[0]=c}}if(h.length>0){if(h.length==1){i=h[0]}else{i={"_parameters":h}}}if(d!=null){var l=false;for(var m in d){if(d.hasOwnProperty(m)){var n=l?"&":"?";l=true;var o=d[m];g+=n+encodeURIComponent(m);if(o!=null){g+="="+encodeURIComponent(o)}}}}return[g,i]};this.executeMethodURL=function(a,b,c,d,e,f){if(e==null){e=true}c=validateRequestType(c);var g=getXmlHttpObject();var h=(d!=null);g.open(c,a,h);if(h){g.onreadystatechange=function(){if(g.readyState==4){JSONResult=e?parseHTTPResponse(g):null;d(JSONResult,g.status,r)}}}if(b!=null){b=JSON.stringify(b)}g.setRequestHeader("Accept",(f==null?"application/json":f));g.setRequestHeader("Content-Type","text/plain;charset=UTF-8");g.setRequestHeader("If-Modified-Since","Mon, 1 Oct 1990 05:00:00 GMT");var i=getSessionID();if(i!=null){g.setRequestHeader("Pragma","dssession="+i)}if(this.authentication!=null){g.setRequestHeader("Authorization","Basic "+this.authentication)}g.send(b);if(e&&!h){return parseHTTPResponse(g)}};this.executeMethod=function(a,b,c,d,e,f,g){var h=this.getMethodURL(a,b,c,f);return this.executeMethodURL(h[0],h[1],b,d,e,g)};this.closeSession=function(){var a=getSessionID();if(a==null){return false}var b=this.getURLPrefix()+"CloseSession/";var c=this.executeMethodURL(b,null,"GET",null,true,null);setSessionData(null,null);return c}}function getConnectionHost(a){if(a!=null&&a.host!=null&&a.host!=''){return a.host}var b="localhost";var c=location.host;if(c!="localhost"){if(c.indexOf(":")>-1){var d=c.split(":",2);b=d[0]}else{b=c}}return b}function getConnectionPort(a){if(a!=null&&a.port!=null&&a.port!=''){return a.port}var b=null;var c=location.host;if(c!="localhost"&&c.indexOf(":")>-1){var d=c.split(":",2);b=d[1]}return b}function getIsHTTPS(a){if(a!=null&&a.https!=null&&a.https!=''){return a.https===true}return location.protocol=='https:'}function getDSContext(a){if(a!=null&&a.dscontext!=null){var b=trimString(a.dscontext);if(b==''){return""}return b+"/"}return"cosmos/"}function getRestContext(a){if(a!=null&&a.restcontext!=null){var b=trimString(a.restcontext);if(b==''){return""}return b+"/"}return"rest/"}
function getCacheContext(a){var b="cache/";if(a!=null&&a.cachecontext!=null){var c=trimString(a.cachecontext);if(c==''){return b}return c+"/"}return b}function validateRequestType(a){if(a==null){a="GET"}else{a=a.toUpperCase();if(a!="GET"&&a!="POST"&&a!="PUT"&&a!="DELETE"){a="GET"}}return a}function parseSessionID(a){if(a!=null){var b=a.getResponseHeader("Pragma");if(b!=null){var c="dssession=";var d="dssessionexpires=";var e=b.indexOf("dssession=");if(e>-1){var f=b.indexOf(",",e);f=f<0?b.length:f;e=e+c.length;var g=b.substr(e,(f-e));var h=null;var i=b.indexOf(d);if(i>-1){f=b.indexOf(",",i);f=f<0?b.length:f;i=i+d.length;var j=parseInt(b.substr(i,(f-i)));if(j!=0&&j!=NaN){h=new Date();h.setMilliseconds(h.getMilliseconds()+j)}}setSessionData(g,h)}}}}function parseHTTPResponse(a){parseSessionID(a);if(a!=null&&a.responseText!=null){var b=a.responseText;if(b.length>0){var c=null;try{c=JSON.parse(b)}catch(e){c=b}if(a.status==403){if(c!=null&&c.SessionExpired!=null){setSessionData(null,null)}}return c}}return null}function isString(a){return a!=null&&typeof a=='string'}function isArray(a){return!(a==null||(a.constructor.toString().indexOf("Array")==-1))}function isObject(a){return!(a==null||(a.constructor.toString().indexOf("Object()")==-1))}function isValidPort(a){if(a==null){return false}else if(typeof a===typeof 1){return(null!==a)&&isFinite(a)}else if(typeof a=='string'){if(a.length>0){var b="0123456789";var c;for(i=0;i<a.length;i++){c=a.charAt(i);if(b.indexOf(c)==-1){return false}}return true}}return false}function getXmlHttpObject(){if(typeof(XMLHttpRequest)==="undefined"){XMLHttpRequest=function(){try{return new ActiveXObject("Msxml2.XMLHTTP.6.0")}catch(e){}try{return new ActiveXObject("Msxml2.XMLHTTP.3.0")}catch(e){}try{return new ActiveXObject("Msxml2.XMLHTTP")}catch(e){}try{return new ActiveXObject("Microsoft.XMLHTTP")}catch(e){throw new Error("This browser does not support XMLHttpRequest.");}}}return new XMLHttpRequest()}function getSessionID(){var a=null;if($$SessionID$$!=null){a=$$SessionID$$;if($$SessionExpires$$!=null&&(new Date())>=$$SessionExpires$$){a=null;var b=$$SessionID$$;$$SessionID$$=null;$$SessionExpires$$=null;if(isReferenceAFunction(notifySessionExpired)){notifySessionExpired(b)}}}return a}function getSessionCookieId(){return $$SESSION_COOKIE_PREFIX$$+"dssessionid"}function initSessionData(a,b){$$SessionID$$=null;$$SessionExpires$$=null;$$SESSION_COOKIE_PREFIX$$="";if(isString(b)){$$SESSION_COOKIE_PREFIX$$=b}if(a!=null){$$USE_SESSION_COOKIE$$=a===true}if($$USE_SESSION_COOKIE$$===true&&navigator.cookieEnabled){$$SessionID$$=getCookie(getSessionCookieId())}}function setSessionData(a,b){$$SessionID$$=a;$$SessionExpires$$=b;if($$USE_SESSION_COOKIE$$===true&&navigator.cookieEnabled){if(a!=null){setCookie(getSessionCookieId(),a,b)}else{deleteCookie(getSessionCookieId())}}}function getCookie(a){var b=null;if(a!=null&&document.cookie.length>0){var c=document.cookie.split(";");for(var i=0;i<c.length;i++){var d=c[i].split("=");var e=d[0].replace(/^\s+|\s+$/g,"");if(a==e){if(d.length>1){b=unescape(d[1].replace(/^\s+|\s+$/g,""))}else{b=""}}}}return b}function setCookie(a,b,c){if(a!=null&&b!=null&&a.length>0&&b.length>0){var d=a+"="+escape(b);if(c!=null){d+="; expires="+c.toGMTString()}document.cookie=d+"; path=/"}}function deleteCookie(a){setCookie(a,"deleted",new Date(1000))}function trimString(a){return isString(a)?a.replace(/^\s+|\s+$/,''):a}function arrayIndexOf(a,b){if(a!=null){var c=a.length;for(var i=0;i<c;i++){if(a[i]===b){return i}}}return-1}function arrayToCSV(a){return isArray(a)?a.join(","):a}function nullOrEmptyStr(a){return a==null||a==""}function isReferenceAFunction(a){return a!=null&&typeof a=='function'}
