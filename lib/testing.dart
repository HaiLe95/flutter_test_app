
import 'package:flutter/material.dart';

void main() {
  runApp(TestingApp());
}

class TestingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text("My Application"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LinearProgressIndicator(value: 23),
                Text(
                  '23%',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'Press button to continue',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          ),
        ),

      ),
    );

  }

}