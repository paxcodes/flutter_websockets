import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class MyHomePage extends StatefulWidget {
  final channel = IOWebSocketChannel.connect('ws://echo.websocket.org');

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _messageFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          child: TextFormField(
            controller: _messageFieldController,
            decoration: InputDecoration(labelText: 'Send a message'),
          ),
        ),
        StreamBuilder(
          stream: widget.channel.stream,
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
            );
          },
        ),
        RaisedButton(
          child: Text("Send!"),
          onPressed: () {
            if (_messageFieldController.text.isNotEmpty) {
              widget.channel.sink.add(_messageFieldController.text);
            }
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}
