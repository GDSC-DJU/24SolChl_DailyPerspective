import 'dart:developer';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

generate() {
  Gemini.init(apiKey: dotenv.get("key"));
  final gemini = Gemini.instance;

  final file = File('assets/test.png');
  gemini
      .textAndImage(
          text: "Explain this image in Korean.",
          images: [file.readAsBytesSync()])
      .then((value) => log(value?.content?.parts?.last.text ?? ''))
      .catchError((e) => log('textAndImageInput', error: e));
}
