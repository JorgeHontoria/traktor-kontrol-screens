import QtQuick

QtObject {

  // controller preferences
  property bool mixerFXSelector:                  false
  property bool prioritizeFXSelection:            false

  readonly property bool fineMasterTempoAdjust:   true
  readonly property bool fineDeckTempoAdjust:     true

  // global preferences
  property bool camelotKey:                       true
  readonly property int  phraseLength:            4

  // browser preferences
  readonly property bool displayMatchGuides:      true
  readonly property bool displayMoreItems:        true

  // deck preferences
  readonly property bool displayAlbumCover:       true
  readonly property bool displayHotCueBar:        true
  readonly property bool displayDeckIndicators:   true
  readonly property bool displayPhaseMeter:       true
  property int spectrumWaveformColors:            1 // Change for Spectrum Waveform Colors Themes
                                                    // 1 - KOKERNUTZ, 
                                                    // 2 - NEXUS
                                                    // 3 - PRIME
                                                    // 4 - Denon SC5000 / SC6000
                                                    // 5 - Pioneer CDJ 2000
                                                    // 6 - Pioneer CDJ 3000
                                                    // 7 - NUMARK
  readonly property variant mixerFXNames:         ["FLTR", "MFX 1", "MFX 2", "MFX 3", "MFX 4"] // do not change FLTR

  // deck header text (use -1 to turn off)
  readonly property int topLeftText:      0
  readonly property int topCenterText:    14
  readonly property int topRightText:     12

  readonly property int middleLeftText:   1
  readonly property int middleCenterText: 31
  readonly property int middleRightText:  24

  readonly property int bottomLeftText:   19
  readonly property int bottomCenterText: 15
  readonly property int bottomRightText:  28

  // options:
  //
  // 0:  "title",          1: "artist",       2:  "release", 
  // 3:  "mix",            4: "label",        5:  "catNo", 
  // 6:  "genre",          7: "trackLength",  8:  "bitrate", 
  // 9:  "bpmTrack",      10: "gain",        11: "elapsedTime", 
  // 12: "remainingTime", 13: "beats",       14: "beatsToCue", 
  // 15: "bpm",           16: "tempo",       17: "key", 
  // 18: "keyText",       19: "comment",     20: "comment2",
  // 21: "remixer",       22: "pitchRange",  23: "bpmStable", 
  // 24: "tempoStable",   25: "sync",        26: "off", 
  // 27: "off",           28: "bpmTrack"     29: "remixBeats"
  // 30: "remixQuantize", 31: "keyDisplay"

  // Fonts
  // property string fontName: "Pragmatica"
  // property string fontMediumName: "Pragmatica MediumTT"
  property string fontName: "Consolas"
  property string fontMediumName: "TRAKTORFREON"

  property string fontForNumber: "Consolas"
  property string fontForString: "TRAKTORFREON"

  //font.family: "Pragmatica"
  //font.family: "Pragmatica MediumTT"
  //font.family: "TRAKTORFREON" // Ok
  //font.family: "UpheavalX1" // Ok

  //font.family: "ProggyCleanTT" // Require install
  //font.family: "ProggyVector" // Require install

  //font.family: "Webdings"

  //font.family: "Consolas" // Ok
  //font.family: "Consolas Bold"

  //font.family: "Roboto"
  //font.family: "Roboto Light"
  //font.family: "Roboto Medium"
  //font.family: "Roboto Regular"

  //--------------------------------------------------------------------------------------------------------------------
  // TODO: Config LOADER
  property bool debug: false
  property string debugResult: ""

  function log(message) {
    var count = (debugResult.match(/<br>/g) || []).length;

    if (count > 4) {
      // break the textblock into an array of lines
      var lines = debugResult.split('<br>');
      // remove one line, starting at the first position
      lines.splice(0,1);
      // join the array back into a single string
      debugResult = lines.join('<br>');
    }

    debugResult +=  "<br>" + message;
  }

  //--------------------------------------------------------------------------------------------------------------------
}
