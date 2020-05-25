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
    return Column(
      children: <Widget>[
        StreamBuilder(
          stream: widget.channel.stream,
          builder: (context, snapshot) {
            return Text(snapshot.hasData ? '${snapshot.data}' : '');
          },
        )
      ],
    );
  }
}
