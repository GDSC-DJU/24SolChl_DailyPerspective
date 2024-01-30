import 'package:flutter/material.dart';
import 'package:whatisthis/screen/pip.dart';

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
          )
        ]),
      ),
    );
  }
}
