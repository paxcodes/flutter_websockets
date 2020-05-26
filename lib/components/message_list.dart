import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class MessagesStream extends StatefulWidget {
  MessagesStream({this.channel});

  final IOWebSocketChannel channel;

  @override
  _MessagesStreamState createState() => _MessagesStreamState();
}

class _MessagesStreamState extends State<MessagesStream> {
  final List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.channel.stream,
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

  @override
  void dispose() {
    // TODO Do I have to also close it here???
    widget.channel.sink.close();
    super.dispose();
  }
}
