import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/providers/chat_provider.dart';
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
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: chatProvider.messagesList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messagesList[index];
                if (message.userType == UserType.sender) {
                  return UserMessageBubble(message: message.text);
                }
                return MessageBubble(message: message.text);
              },
            )),
            MessageInpt(
              // Cuando los argumentos de una función son los mismos que los de la función que se llama, se puede usar el nombre de la función en lugar de la función anónima
              // onSubmitted: (text) => chatProvider.sendMessage(text),
              onSubmitted: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
