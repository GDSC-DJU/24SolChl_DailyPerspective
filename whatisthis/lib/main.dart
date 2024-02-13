import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatisthis/screen/mainscreen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}
