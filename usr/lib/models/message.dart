import 'package:hive/hive.dart';

part 'message.g.dart';

@HiveType(typeId: 0)
class Message extends HiveObject {
  @HiveField(0)
  final String sender;

  @HiveField(1)
  final String content;

  @HiveField(2)
  final DateTime timestamp;

  @HiveField(3)
  final List<String> reactions;

  Message({
    required this.sender,
    required this.content,
    required this.timestamp,
    this.reactions = const [],
  });

  // Factory constructor for creating a Message from a map (e.g., for Supabase integration)
  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      sender: map['sender'] as String,
      content: map['content'] as String,
      timestamp: DateTime.parse(map['timestamp'] as String),
      reactions: List<String>.from(map['reactions'] as List),
    );
  }

  // Method to convert a Message to a map (e.g., for Supabase integration)
  Map<String, dynamic> toMap() {
    return {
      'sender': sender,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
      'reactions': reactions,
    };
  }
}
