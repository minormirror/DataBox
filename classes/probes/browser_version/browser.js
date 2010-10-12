function getBrowserType(){
  if (!navigator) {
    document.write("<p>Schade, Ihr Browser kennt das navigator-Objekt nicht<br>");
  } else
  {
      var platform = navigator.platform;
      var appversion = navigator.appVersion;
      var ua = navigator.userAgent.toLowerCase();
      var netscapebrowser = (ua.indexOf("mozilla")!=-1 && ua.indexOf("compatible")==-1 && ua.indexOf("opera")==-1);
      var iebrowser = (ua.indexOf("msie")>-1);
      var operabrowser = (ua.indexOf("opera")>-1);
      var av = navigator.appVersion;
      var version = av.substring(0, av.indexOf(" ")) *1;
      var version2 = av.substring(0, av.indexOf(".")) *1;
      
      if (netscapebrowser) {
        var codename = navigator.appCodeName;
        var browser_string = codename +" - "+ version2;
        return browser_string;
      }
      
      if (operabrowser) {
        var codename = navigator.appName;
        var browser_string = codename +" - "+ version2;
        return browser_string;
      }
      
      else if (iebrowser){
          var name = navigator.appName;
          if (version2==4 && ua.indexOf("msie 4")==-1)
            versionsnummer = 3;
          if (version2==4 && ua.indexOf("msie 4")>-1)
            versionsnummer = 4;
          if (version2==4 && ua.indexOf("msie 5")>-1)
            versionsnummer = 5;
          if (version2==4 && ua.indexOf("msie 6")>-1)
            versionsnummer = 6;
          if (version2==4 && ua.indexOf("msie 7")>-1)
            versionsnummer = 7;
          var browser_string = name +" - "+ versionsnummer;
          return browser_string;
      }
  }
}

//Weiterleitung
/*
if (netscapebrowser&&versionsnummer==2)
   location.href="nn2.html"
if (netscapebrowser&&versionsnummer==3)
   location.href="nn3.html"
*/
