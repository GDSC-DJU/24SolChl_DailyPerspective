import 'package:dash_bubble/dash_bubble.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatisthis/generate/get_screenshot.dart';
import 'package:whatisthis/generate/tts.dart';
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
  final List<String> gifPaths = const [
    'lib/explin/sen1.gif',
    'lib/explin/sen2.gif',
    'lib/explin/sen3.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('image TTs', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
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
            onPressed: () async {
              var status = await Permission.photos.status;
              if (status.isDenied) {
                tts("미디어 사용 권한을 허용해주세요.");
              }
              var requestStatus = await Permission.photos.request();
              if (requestStatus.isGranted || status.isGranted) {
                requestOverlay();
                startBubble(
                    bubbleOptions: BubbleOptions(
                      bubbleIcon: 'button2',
                      bubbleSize: 140,
                      enableClose: true,
                      distanceToClose: 90,
                      enableAnimateToEdge: true,
                      enableBottomShadow: true,
                      keepAliveWhenAppExit: false,
                    ),
                    onTap: () async {
                      logMessage(message: "실행중");
                      tts("잠시 기다리세요.");
                      getRecentImage();
                      //generate();
                    });
                //
                //SystemNavigator.pop();
              } else if (requestStatus.isPermanentlyDenied ||
                  status.isPermanentlyDenied) {
                tts("앱 사용 권한을 확인해주세요");
                openAppSettings();
              } else if (status.isDenied) {
                tts("권한이 없다면 앱 사용이 불가능 합니다.");
                openAppSettings();
              }
            },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 300),
                backgroundColor: Colors.black,
                side: const BorderSide(
                  color: Colors.white,
                  width: 10,
                )),
            child: const Text(
              'start',
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),
          const SizedBox(width: 20, height: 30),
          //help button
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("TIP",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                    content: const Text(
                      "내용",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    actions: <Widget>[
                      Container(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("yes"),
                        ),
                      )
                    ],
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(300, 50),
                side: const BorderSide(color: Colors.white, width: 5)),
            child: const Text('HELP',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),

          const SizedBox(
            height: 40,
          ),

          //close button
          ElevatedButton(
            onPressed: () {
              stopBubble();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(300, 50),
              backgroundColor: Colors.black,
              side: const BorderSide(
                color: Colors.white,
                width: 5,
              ),
            ),
            child: const Text('Close',
                style: TextStyle(fontSize: 20, color: Colors.white)),
          )
        ]),
      ),
    );
  }
}
