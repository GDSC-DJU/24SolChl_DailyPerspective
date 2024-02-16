import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:whatisthis/screenshot/screenshot.dart';

void generate() async {
  saveScreenshot();
  Gemini.init(apiKey: dotenv.get("key"));
  final gemini = Gemini.instance;

  Uint8List bytes =
      (await rootBundle.load('assets/test.png')).buffer.asUint8List();
  //이후 assets/screenshot.png 로 교체
  final result = await gemini.textAndImage(
    text: "Explain this image in Korean.",
    images: [bytes],
  );
  //log(result?.content?.parts?.last.text ?? '');
  tts(result?.content?.parts?.last.text ?? '');
  //이후 사용 이미지 삭제
  tts("에러가 발생하였습니다. 나중에 시도해주세요.");
}

void tts(String text) async {
  FlutterTts tts = FlutterTts();
  await tts.setLanguage("ko-KR");
  await tts.speak(text);
}
