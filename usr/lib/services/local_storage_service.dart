import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:couldai_user_app/models/message.dart';

class LocalStorageService {
  static const String _messageBox = 'messages';

  Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(MessageAdapter());
    }
    await Hive.openBox<Message>(_messageBox);
  }

  Box<Message> _getMessageBox() {
    return Hive.box<Message>(_messageBox);
  }

  Future<void> saveMessage(Message message) async {
    final box = _getMessageBox();
    await box.add(message);
  }

  Future<List<Message>> getMessages() async {
    final box = _getMessageBox();
    return box.values.toList();
  }

  Future<void> clearAllMessages() async {
    final box = _getMessageBox();
    await box.clear();
  }
}
