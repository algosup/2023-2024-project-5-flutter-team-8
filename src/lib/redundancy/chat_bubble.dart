import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:adopte_1_candidat/constants.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final String timestamp;
  final bool isSeen;
  final bool showAvatar;
  final String? avatarImage;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isSender,
    required this.timestamp,
    this.isSeen = false,
    this.showAvatar = false,
    this.avatarImage,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isSender && showAvatar && avatarImage != null)
              CircleAvatar(
                backgroundImage: AssetImage(avatarImage!),
                radius: size.height / 48,
              ),
            Flexible(
              child: BubbleNormal(
                text: text,
                isSender: isSender,
                color: isSender ? Colors.black : chatNotSenderBackgroundColor,
                tail: true,
                textStyle: TextStyle(
                  fontSize: 20,
                  color: isSender ? Colors.white : chatNotSenderTextColor,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment:
              isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            SizedBox(width: size.width / 7),
            Text(
              timestamp,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: chatAnnotationsColor,
                fontSize: 14,
              ),
            ),
            SizedBox(width: size.width / 72),
            if (isSender)
              Icon(
                Icons.done_all,
                color: isSeen ? Colors.green : Colors.black45,
                size: 19,
              ),
            SizedBox(width: size.width / 16),
          ],
        ),
      ],
    );
  }
}
