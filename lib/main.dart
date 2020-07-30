import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State createState() {
    return _MyState();
  }

}

class _MyState extends State<MyApp> {

  List _colors;
  Random _rnd;
  int _secret, _index;

  @override
  void initState() {
    _colors = [Colors.white, Colors.indigo, Colors.yellow, Colors.blue, Colors.green, Colors.red, Colors.purple];
    _rnd = new Random();
    _secret = 0;
    _index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: _colors[_index],
        appBar: new AppBar(
          title: new Text("Change background on tap"),
          centerTitle: true,
        ),
        body: Center (
              child: InkWell(
                  onTap: () {
                    if(_isCharged())  {


                    } else {
                      _generateBackgroundColor();
                    }
                  },
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: Center(
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage("assets/background/kenobi.jpg"),
                            ),
                          )
                        ),
                        Center(
                          child: Text("Hello there...", style: TextStyle(color: Colors.white, fontSize: 20),),
                        )
                      ],
                    ),
                ),
        )
      ),
    );

  }



  void _generateBackgroundColor() {
    setState(() {
      _index = _rnd.nextInt(6);
    });
  }

  bool _isCharged() {
      if(_secret < 10) {
        _secret++;
        return false;
      } else
        return true;
  }

}


