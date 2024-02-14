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
  final List<String> gifPaths = const [
    'lib/explin/sen1.gif',
    'lib/explin/sen2.gif',
    'lib/explin/sen3.gif'
  ];
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
                    bubbleIcon: 'button2',
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
              //SystemNavigator.pop();
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
          SizedBox(width: 20, height: 30),
          //help button
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return AlertDialog(
                    title: Text("TIP",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                    content: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2.0),
                      ),
                      child: Image.asset('lib/explain/sen1.gif'),
                    ),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    actions: <Widget>[
                      Container(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("yes"),
                        ),
                      )
                    ],
                  );
                },
              );
            },
            child: Text('HELP',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(300, 50),
                side: BorderSide(color: Colors.white, width: 5)),
          ),

          SizedBox(
            height: 40,
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
