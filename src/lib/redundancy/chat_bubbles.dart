import 'package:flutter/material.dart';
import 'package:adopte_1_candidat/constants.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatBubble extends StatefulWidget {
  final String text;
  final bool isSender;
  final String hour;
  final bool delivered;
  final bool read;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isSender,
    required this.hour,
    required this.delivered,
    required this.read,
  });

  @override
  State<ChatBubble> createState() => ChatBubbleState();
}

class ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AttachmentBubble extends StatefulWidget {
  const AttachmentBubble({super.key});

  @override
  State<AttachmentBubble> createState() => _AttachmentBubbleState();
}

class _AttachmentBubbleState extends State<AttachmentBubble> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
