import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_tts/flutter_tts.dart';

generate() async {
  Gemini.init(apiKey: dotenv.get("key"));
  final gemini = Gemini.instance;

  Uint8List bytes =
      (await rootBundle.load('assets/test.png')).buffer.asUint8List();

  final result = await gemini.textAndImage(
    text: "Explain this image in Korean.",
    images: [bytes],
  );

  log(result?.content?.parts?.last.text ?? '');
  tts(result?.content?.parts?.last.text ?? '');
}

void tts(String text) async {
  FlutterTts tts = FlutterTts();
  await tts.setLanguage("ko-KR");
  await tts.speak(text);
}
