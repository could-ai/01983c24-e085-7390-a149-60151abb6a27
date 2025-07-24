import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/message.dart';
import 'package:couldai_user_app/services/local_storage_service.dart';

class ChatProvider with ChangeNotifier {
  final LocalStorageService _localStorageService;
  List<Message> _messages = [];

  ChatProvider(this._localStorageService) {
    _loadMessages();
  }

  List<Message> get messages => _messages;

  Future<void> _loadMessages() async {
    _messages = await _localStorageService.getMessages();
    notifyListeners();
  }

  Future<void> sendMessage(String content) async {
    final newMessage = Message(
      sender: 'Me', // Placeholder, will be dynamic later
      content: content,
      timestamp: DateTime.now(),
    );
    _messages.add(newMessage);
    await _localStorageService.saveMessage(newMessage);
    notifyListeners();
  }

  // Placeholder for future features like adding reactions, searching, etc.
}
