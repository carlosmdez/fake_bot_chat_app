import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/helpers/http_helper.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final HttpHelper httpHelper = HttpHelper();

  List<Message> messagesList = [];

  Future<void> sendMessage(String text) async {
    final String textFormatted = text.trim();
    if (textFormatted.isEmpty) return;
    final newMessage = Message(text: text, userType: UserType.receiver);
    messagesList.add(newMessage);
    if (textFormatted.endsWith('?')) {
      await getAnswer();
    }
    notifyListeners();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      moveScrollToButton();
    });
  }

  Future<void> getAnswer() async {
    final message = await httpHelper.getAnswer();
    messagesList.add(message);
    // notifyListeners();
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   moveScrollToButton();
    // });
  }

  void moveScrollToButton() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
