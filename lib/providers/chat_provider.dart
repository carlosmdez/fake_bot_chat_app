import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messagesList = [
    Message(text: 'Hola, perdido', userType: UserType.sender),
    Message(text: 'Hola?', userType: UserType.receiver),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, userType: UserType.receiver);
    messagesList.add(newMessage);
    notifyListeners();
  }
}
