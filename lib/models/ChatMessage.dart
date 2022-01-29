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
}