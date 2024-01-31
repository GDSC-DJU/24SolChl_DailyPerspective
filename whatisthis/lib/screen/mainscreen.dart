import 'package:flutter_in_app_pip/flutter_in_app_pip.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:whatisthis/screen/pip.dart';
import 'package:simple_pip_mode/simple_pip.dart';

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
<<<<<<< HEAD
            onPressed: () => SimplePip().setAutoPipMode(),
            child: Text(
=======
            onPressed: () {
              pip();
            },
            style: FilledButton.styleFrom(
                minimumSize: const Size(300, 300), backgroundColor: Colors.red),
            child: const Text(
>>>>>>> ac4bd5e6ac16f475c373a1c316952239759c236d
              'start',
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }
}
