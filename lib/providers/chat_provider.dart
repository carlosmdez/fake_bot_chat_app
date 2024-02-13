import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  List<Message> messagesList = [
    Message(text: 'Hola, perdido', userType: UserType.sender),
    Message(text: 'Hola?', userType: UserType.receiver),
  ];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text, userType: UserType.receiver);
    messagesList.add(newMessage);
    notifyListeners();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      moveScrollToButton();
    });
  }

  void moveScrollToButton() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
