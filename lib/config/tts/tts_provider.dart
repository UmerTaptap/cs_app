import 'dart:io';

import 'package:flutter_tts/flutter_tts.dart';

class TtsProvider {
  // singleton
  static final TtsProvider _instance = TtsProvider._internal();
  late FlutterTts _flutterTts;

  factory TtsProvider() {
    return _instance;
  }

  TtsProvider._internal();

  // init tts
  Future<void> init() async {
    _flutterTts = FlutterTts();

    if(Platform.isIOS) {
      await _flutterTts.setSharedInstance(true);
      await _flutterTts.setIosAudioCategory(IosTextToSpeechAudioCategory.ambient,
          [
            IosTextToSpeechAudioCategoryOptions.allowBluetooth,
            IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
            IosTextToSpeechAudioCategoryOptions.mixWithOthers
          ],
          IosTextToSpeechAudioMode.voicePrompt
      );
    }

    await _flutterTts.setLanguage('en-US');

    await _flutterTts.setSpeechRate(0.5);

    await _flutterTts.setVolume(1.0);

    await _flutterTts.setPitch(1.0);

    await _flutterTts.awaitSynthCompletion(true);

    await _flutterTts.awaitSpeakCompletion(true);

    //await _flutterTts.setVoice({"name": "en-US-language", "locale": "es-US"});

    var voices = await _flutterTts.getVoices;
    var defaultVoice = await _flutterTts.getDefaultVoice;
    print("Voices: $voices");
    print("Default Voice: $defaultVoice");
  }


  // speak
  Future<void> speak(String text) async {
    await _flutterTts.speak(text);
  }

  // stop
  Future<void> stop() async {
    try{
      await _flutterTts.stop();
    }catch (e){
      print(e);
    }
  }

  // dispose
  void dispose() {
    _flutterTts.stop();
  }




}