import 'package:flutter/material.dart';
import 'package:whatisthis/screen/mainscreen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  //AI테스트용
  //generate();
  runApp(const MyApp());
}
