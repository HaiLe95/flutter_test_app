import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(StatefulTestApp());
}

class StatefulTestApp extends StatefulWidget {

    @override
    State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyFirstState();
  }

}

class _MyFirstState extends State<StatefulTestApp> {
  bool _loading;
  double _progressValue;

  @override
  void initState() {
    _loading = false;
    _progressValue = 0.0;
    super.initState();
  }

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
            child: _loading ?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LinearProgressIndicator(value: _progressValue),
                Text(
                  '${(_progressValue * 100).round()}%', // увеличение по проценту
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            )
                : Text(
              'Press button to continue',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _loading = !_loading;
              _updateProgress();
            });
          },
          child: Icon(Icons.play_circle_outline)
        ),
      ),
    );
  }

  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.2;
        if(_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          _progressValue = 0;
          return;
        }
      });
    });
  }
}