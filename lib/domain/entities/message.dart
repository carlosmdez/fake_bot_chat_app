enum UserType {
  sender,
  receiver,
}

class Message {
  final String text;
  final UserType userType;
  final String? imageUrl;

  Message({
    required this.text,
    required this.userType,
    this.imageUrl,
  });
}
