import 'package:flutter/material.dart';
import 'package:websocketssample/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Websockets Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Websockets'),
        ),
        body: Center(
          child: MyHomePage(),
        ),
      ),
    );
  }
}
