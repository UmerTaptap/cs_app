import 'package:speech_to_text/speech_to_text.dart' as stt;

class SttProvider{
  static final SttProvider _instance = SttProvider._internal();
  late stt.SpeechToText _speech;

  factory SttProvider() {
    return _instance;
  }

  SttProvider._internal();


  stt.SpeechToText get speech => _speech;


  // init
  Future<void> init() async {
    _speech = stt.SpeechToText();
    await _speech.initialize();
  }

  // start
  Future<String?> start() async {
    String? text;
    await _speech.listen(
      onResult: (result) {
        text = result.recognizedWords;
      },
    );
    return text;
  }




  // stop
  Future<void> stop() async {
    await _speech.stop();
  }

}