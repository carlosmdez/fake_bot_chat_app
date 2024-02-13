import 'package:flutter/material.dart';
import 'package:yes_no_app/widgets/chat/message_bubble.dart';
import 'package:yes_no_app/widgets/chat/user_message_bubble.dart';
import 'package:yes_no_app/widgets/shared/message_input.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage:
                NetworkImage('https://images6.alphacoders.com/125/1258531.jpg'),
          ),
        ),
        title: const Text('Chat Screen'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                if (index % 2 == 0) {
                  return const UserMessageBubble();
                }
                return const MessageBubble();
              },
            )),
            const MessageInpt()
          ],
        ),
      ),
    );
  }
}
