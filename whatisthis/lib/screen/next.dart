import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class nextscreen extends StatelessWidget {
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
            onPressed: () {},
            child: Text(
              'start',
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
            style: FilledButton.styleFrom(
                minimumSize: Size(50, 50), backgroundColor: Colors.red),
          )
        ]),
      ),
    );
  }
}
