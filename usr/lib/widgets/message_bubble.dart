import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String timestamp;
  // final List<String> reactions; // Will be used later

  const MessageBubble({
    super.key,
    required this.message,
    required this.isMe,
    required this.timestamp,
    // this.reactions = const [],
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(15.0);
    final Color bubbleColor = isMe ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.surfaceVariant; // Changed for better contrast
    final Color textColor = isMe ? Colors.white : Theme.of(context).colorScheme.onSurfaceVariant; // Changed for better contrast

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: isMe
              ? borderRadius.subtract(BorderRadius.only(bottomRight: Radius.circular(5.0))) // Adjust for tail
              : borderRadius.subtract(BorderRadius.only(bottomLeft: Radius.circular(5.0))), // Adjust for tail
        ),
        child: Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(color: textColor, fontSize: 16.0),
            ),
            const SizedBox(height: 4.0),
            Text(
              timestamp,
              style: TextStyle(color: textColor.withOpacity(0.7), fontSize: 10.0),
            ),
            // if (reactions.isNotEmpty) ...[
            //   const SizedBox(height: 4.0),
            //   Wrap(
            //     spacing: 4.0,
            //     children: reactions.map((reaction) => Text(reaction)).toList(),
            //   ),
            // ],
          ],
        ),
      ),
    );
  }
}
