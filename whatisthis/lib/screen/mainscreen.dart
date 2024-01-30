import 'package:flutter/material.dart';
import 'package:whatisthis/screen/pip.dart';

class mainscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('image TTs', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 20,
            width: 30,
          ),
          ElevatedButton(
            onPressed: () {
              pip();
            },
            child: Text(
              'start',
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
            style: FilledButton.styleFrom(
                minimumSize: Size(300, 300), backgroundColor: Colors.red),
          )
        ]),
      ),
    );
  }
}
