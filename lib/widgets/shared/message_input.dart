import 'package:flutter/material.dart';

class MessageInpt extends StatelessWidget {
  final ValueChanged<String> onSubmitted;
  const MessageInpt({super.key, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;

    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(16),
    );

    final inputDecoration = InputDecoration(
      hintText: 'Type a message',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_rounded),
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          onSubmitted(textValue);
        },
      ),
    );

    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      decoration: inputDecoration,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onSubmitted(value);
      },
    );
  }
}
