import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class MyHomePage extends StatefulWidget {
  final channel = IOWebSocketChannel.connect('ws://echo.websocket.org');

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("DATA FROM THE SERVER"),
    );
  }
}
