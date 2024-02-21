import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:whatisthis/generate/get_screenshot.dart';
import 'package:whatisthis/generate/tts.dart';

void generate() async {
  Gemini.init(apiKey: dotenv.get("key"));
  final gemini = Gemini.instance;
  //null 수정
  Uint8List image = (await getRecentImage()) as Uint8List;

  // ignore: unnecessary_null_comparison
  if (image != null) {
    final result = await gemini.textAndImage(
      text: "Explain this image in Korean.",
      images: [image],
    );
    tts(result?.content?.parts?.last.text ?? '');
    log(result?.content?.parts?.last.text ?? '');
  } else {
    tts("null발생");
  }
}
