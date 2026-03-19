// Import necessary packages
import 'package:flutter/material.dart';
import 'package:flutter_chat/flutter_chat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'P2P Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [];

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      final message = Message(
        text: text,
        sentAt: DateTime.now(),
      );
      setState(() {
        _messages.add(message);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Chat(
        messages: _messages,
        onSendPressed: (text) {
          _sendMessage(text);
        },
      ),
    );
  }
}

class UserDiscoveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Discovery'),
      ),
      body: Center(child: Text('Discover Users Here')), // Placeholder
    );
  }
}

class ProfileManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Management'),
      ),
      body: Center(child: Text('Manage Your Profile Here')), // Placeholder
    );
  }
}

// Define Message class
class Message {
  final String text;
  final DateTime sentAt;

  Message({required this.text, required this.sentAt});
}