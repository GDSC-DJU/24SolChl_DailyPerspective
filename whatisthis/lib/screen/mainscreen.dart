import 'package:flutter_in_app_pip/flutter_in_app_pip.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:whatisthis/screen/pip.dart';

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

class mainscreen extends StatelessWidget {
  const mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('image TTs', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 20,
            width: 30,
          ),
          ElevatedButton(
            onPressed: () {
              pip();
            },
            style: FilledButton.styleFrom(
                minimumSize: const Size(300, 300), backgroundColor: Colors.red),
            child: const Text(
              'start',
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),
          // ---------------------------------------재형쨩의 테스트 버튼-------------------------------------
          ElevatedButton(
            onPressed: () {
              //기능
            },
            style: FilledButton.styleFrom(
                minimumSize: const Size(50, 50), backgroundColor: Colors.red),
            child: const Text(
              'start',
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          )
          //------------------------------------------------------------------
        ]),
      ),
    );
  }
}
