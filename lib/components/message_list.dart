import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class MessagesStream extends StatefulWidget {
  MessagesStream({this.stream});

  final Stream stream;

  @override
  _MessagesStreamState createState() => _MessagesStreamState();
}

class _MessagesStreamState extends State<MessagesStream> {
  final List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.stream,
      builder: (context, snapshot) {
        String text = '';
        if (snapshot.hasData) {
          text = snapshot.data;
          messages.add(text);
        }
        return Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(messages[index]),
            ),
          ),
        );
      },
    );
  }
}
