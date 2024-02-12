import 'package:dash_bubble/dash_bubble.dart';
import 'package:whatisthis/screen/pip.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:whatisthis/generate/generate_text.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'imageTTs',
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark)),
      home: const mainscreen(),
    );
  }
}

class mainscreen extends StatelessWidget {
  const mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('image TTs', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 20,
            width: 30,
          ),
          //start button
          ElevatedButton(
            onPressed: () {
              requestOverlay();
              startBubble(
                  bubbleOptions: BubbleOptions(
                    bubbleIcon: 'test2',
                    bubbleSize: 140,
                    enableClose: true,
                    distanceToClose: 90,
                    enableAnimateToEdge: true,
                    enableBottomShadow: true,
                    keepAliveWhenAppExit: false,
                  ),
                  onTap: () {
                    logMessage(message: "실행증");
                    generate();
                  });
            },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 300),
                backgroundColor: Colors.black,
                side: BorderSide(
                  color: Colors.white,
                  width: 10,
                )),
            child: const Text(
              'start',
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),

          //help button
          ElevatedButton(
            onPressed: () {
              //help page
            },
            child: Text('HELP'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(300, 50),
                side: BorderSide(color: Colors.white, width: 5)),
          ),

          SizedBox(
            height: 100,
          ),

          //close button
          ElevatedButton(
            onPressed: () {
              stopBubble();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(300, 50),
              backgroundColor: Colors.black,
              side: BorderSide(
                color: Colors.white,
                width: 5,
              ),
            ),
            child: Text('Close',
                style: TextStyle(fontSize: 20, color: Colors.white)),
          )
        ]),
      ),
    );
  }
}
