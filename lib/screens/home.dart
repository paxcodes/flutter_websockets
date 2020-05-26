import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:websocketssample/components/message_list.dart';

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
        SizedBox(height: 20),
        RaisedButton(
          child: Text("Send!"),
          onPressed: () {
            if (_messageFieldController.text.isNotEmpty) {
              widget.channel.sink.add(_messageFieldController.text);
              _messageFieldController.clear();
            }
          },
        ),
        MessagesStream(stream: widget.channel.stream),
      ],
    );
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}
