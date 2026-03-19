import 'package:hive/hive.dart';

class LocalStorageService {
  static const String _userProfilesBox = 'userProfiles';
  static const String _messagesBox = 'messages';
  static const String _chatHistoryBox = 'chatHistory';

  Future<void> init() async {
    await Hive.initFlutter(); // Initialize Hive
    await Hive.openBox(_userProfilesBox);
    await Hive.openBox(_messagesBox);
    await Hive.openBox(_chatHistoryBox);
  }

  // Store user profile
  Future<void> storeUserProfile(String userId, Map<String, dynamic> profile) async {
    var box = Hive.box(_userProfilesBox);
    await box.put(userId, profile);
  }

  // Retrieve user profile
  Map<String, dynamic>? getUserProfile(String userId) {
    var box = Hive.box(_userProfilesBox);
    return box.get(userId);
  }

  // Store a message
  Future<void> storeMessage(String messageId, Map<String, dynamic> message) async {
    var box = Hive.box(_messagesBox);
    await box.put(messageId, message);
  }

  // Retrieve a message
  Map<String, dynamic>? getMessage(String messageId) {
    var box = Hive.box(_messagesBox);
    return box.get(messageId);
  }

  // Add chat history
  Future<void> addChatHistory(String userId, Map<String, dynamic> chat) async {
    var box = Hive.box(_chatHistoryBox);
    var chatHistory = box.get(userId, defaultValue: []);
    chatHistory.add(chat);
    await box.put(userId, chatHistory);
  }

  // Retrieve chat history
  List<Map<String, dynamic>> getChatHistory(String userId) {
    var box = Hive.box(_chatHistoryBox);
    return box.get(userId, defaultValue: []);
  }
}