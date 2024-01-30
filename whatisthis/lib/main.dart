import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_in_app_pip/flutter_in_app_pip.dart';
import 'package:whatisthis/screen/mainscreen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PiPMaterialApp(
      title: 'imageTTs',
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark)),
      home: mainscreen(),
    );
  }
}
