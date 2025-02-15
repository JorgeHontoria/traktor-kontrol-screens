import CSI 1.0
import QtQuick

// TODO: Config LOADER

/*
Accessing local files
By default, you cannot use the XMLHttpRequest object to read files from your local file system. If you wish to use this feature to access local files, you can set the following environment variables to 1.

QML_XHR_ALLOW_FILE_READ
QML_XHR_ALLOW_FILE_WRITE
Warning: Use this feature only if you know that the application runs trusted QML and JavaScript code.
*/

Item {
  id: configLoader
  
  AppProperty { id: settingspath; path: "app.traktor.settings.paths.root" }

  readonly property string _XMLHTTP_GET       : "GET"
  readonly property string _XMLHTTP_PUT       : "PUT"
  readonly property bool   _XMLHTTP_SYNCHRO   : false
  readonly property int    _XMLHTTP_DONE      : 4

  signal fileWritten( url fileUrl )
  onFileWritten: ( fileUrl )=>{ 
    //prefs.log("Config saved");
  }
  signal fileReaded( url fileUrl, string result )
  onFileReaded: ( fileUrl, result )=>{ 
    //prefs.log("Reading config");
  }

  Component.onCompleted: { 
    var configpath = configLoader.readConfigPath();
      
    // Read configuration
    var result = openFile(configpath)

    var prefsTemp = {};
    try {
      prefsTemp = JSON.parse(result);

    } catch (e) {
      prefs.log(e.message);

      // Save configuration (if not exit/ parse error)
      saveFile(configpath, JSON.stringify(prefs));
      result = openFile(configpath)
      prefsTemp = JSON.parse(result);
    }

    prefs.mixerFXSelector = prefsTemp.mixerFXSelector;
    prefs.prioritizeFXSelection = prefsTemp.prioritizeFXSelection;
    prefs.spectrumWaveformColors = prefsTemp.spectrumWaveformColors;
    prefs.camelotKey = prefsTemp.camelotKey;
    prefs.debug = prefsTemp.debug;

    prefs.log("Config mixerFXSelector:" + prefs.mixerFXSelector);
    prefs.log("       prioritizeFXSelection:" + prefs.prioritizeFXSelection);
    prefs.log("       spectrumWaveformColors:" + prefs.spectrumWaveformColors);
    prefs.log("       camelotKey:" + prefs.camelotKey);
    prefs.log("       debug:" + prefs.debug);
  }

  function readConfigPath() 
  {
    var configpath = settingspath.value;
    configpath = "file:///" + configpath.replace(/\\/g,"/") + "/Settings.json";
    return configpath;
  }

  function openFile(fileUrl) {
      var request = new XMLHttpRequest();
      request.open(_XMLHTTP_GET, fileUrl, _XMLHTTP_SYNCHRO);
      request.send(null);
      //var result = request.responseText;
      //fileReaded(fileUrl, result)
      return request.responseText;
  }

  function saveFile(fileUrl, fileContent) {
      var request = new XMLHttpRequest()
      request.open(_XMLHTTP_PUT, fileUrl, true)
      request.onreadystatechange = function() {
          if( request.readyState === 4 ) {
              fileWritten(fileUrl)
          }
      }
      request.send(fileContent)
  }
}