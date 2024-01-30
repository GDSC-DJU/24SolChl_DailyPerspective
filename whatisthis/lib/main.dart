import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_in_app_pip/flutter_in_app_pip.dart';
import 'package:whatisthis/generate/generate_text.dart';
import 'package:whatisthis/screen/mainscreen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  //AI테스트용
  //generate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PiPMaterialApp(
      title: 'imageTTs',
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark)),
      home: const mainscreen(),
    );
  }
}
