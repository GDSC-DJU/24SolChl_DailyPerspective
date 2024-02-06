import 'package:dash_bubble/dash_bubble.dart';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              startBubble(
                  bubbleOptions: BubbleOptions(
                    bubbleIcon: 'test',
                    bubbleSize: 40,
                    enableClose: true,
                    distanceToClose: 90,
                    enableAnimateToEdge: true,
                    enableBottomShadow: true,
                    keepAliveWhenAppExit: false,
                  ),
                  onTap: () {
                    logMessage(message: 'Bubble Tapped');
                  });
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
          //---------------------------------------------------------------------------------------------------
        ]),
      ),
    );
  }

  Future<void> requestOverlay() async {
    final isGranted = await DashBubble.instance.hasOverlayPermission();
    if (isGranted == true) {
      print("Permission is granted");
    } else {
      print("Permission is not granted");
    }
  }

  Future<void> startBubble({
    BubbleOptions? bubbleOptions,
    VoidCallback? onTap,
  }) async {
    final hasStarted = await DashBubble.instance.startBubble(
      bubbleOptions: bubbleOptions,
      onTap: onTap,
    );
    if (hasStarted == true) {
      print("Bubble is started");
    } else {
      print("Bubble is not started");
    }
  }

  logMessage({required String message}) {
    log(message);
  }

  Future<void> stopBubble() async {
    final hasStoped = await DashBubble.instance.stopBubble();
    if (hasStoped == true) {
      print("close Bubble");
    } else {
      print("not close Bubble");
    }
  }
}
