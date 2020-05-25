import 'package:flutter/material.dart';

class MessagesList extends StatelessWidget {
  final List<String> messages = [
    "This ain't no competition",
    "Hope you don't think you're winning",
    "Navarro"
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(messages[index]),
        ),
      ),
    );
  }
}
