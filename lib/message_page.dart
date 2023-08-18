import 'package:flutter/material.dart';

class msg extends StatefulWidget {
  const msg({super.key});

  @override
  State<msg> createState() => _msgState();
}

class _msgState extends State<msg> {
  List<String> messages = [];

  TextEditingController messageController = TextEditingController();

  void _sendMessage(String message) {
    setState(() {
      messages.add(message);
    });
    messageController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(

                      controller: messageController,
                      decoration: InputDecoration(

                        hintText: 'Type your message...',

                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (messageController.text.isNotEmpty) {
                      _sendMessage(messageController.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
