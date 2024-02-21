import 'package:flutter_tts/flutter_tts.dart';

void tts(String text) async {
  FlutterTts tts = FlutterTts();
  await tts.setLanguage("ko-KR");
  await tts.speak(text);
}
