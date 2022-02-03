enum ChatMessageType { text }

class ChatMessage {
  final String text;
  final ChatMessageType messageType;
  final bool isSender;

  ChatMessage({
    this.text = '',
    required this.messageType,
    required this.isSender,
  });

  factory ChatMessage.fromBot(String msg) {
    return ChatMessage(
      text: msg,
      messageType: ChatMessageType.text,
      isSender: false,
    );
  }

  String? get message {
    return text;
  }

}