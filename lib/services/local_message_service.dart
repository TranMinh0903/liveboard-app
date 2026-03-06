import '../models/message.dart';
import 'database_helper.dart';

/// Service đọc/ghi messages từ SQLite local database
/// (Tương tự MessageService nhưng dùng SQLite thay vì REST API)
class LocalMessageService {
  LocalMessageService._();

  /// Lấy tất cả tin nhắn từ SQLite
  static Future<List<Message>> getAllMessages() async {
    try {
      final rows = await DatabaseHelper.getAllMessages();
      return rows.map((row) => Message(
        id: row['id'] as int,
        senderName: row['senderName'] as String,
        content: row['content'] as String,
        likeCount: row['likeCount'] as int,
        createdAt: DateTime.parse(row['createdAt'] as String),
      )).toList();
    } catch (e) {
      print('SQLite Error fetching messages: $e');
      return [];
    }
  }

  /// Gửi tin nhắn mới vào SQLite
  static Future<bool> createMessage({
    required String senderName,
    required String content,
  }) async {
    try {
      final id = await DatabaseHelper.insertMessage(
        senderName: senderName,
        content: content,
      );
      return id > 0;
    } catch (e) {
      print('SQLite Error creating message: $e');
      return false;
    }
  }

  /// Like tin nhắn trong SQLite
  static Future<bool> likeMessage(int id) async {
    try {
      final affected = await DatabaseHelper.likeMessage(id);
      return affected > 0;
    } catch (e) {
      print('SQLite Error liking message: $e');
      return false;
    }
  }

  /// Xóa tin nhắn khỏi SQLite
  static Future<bool> deleteMessage(int id) async {
    try {
      final affected = await DatabaseHelper.deleteMessage(id);
      return affected > 0;
    } catch (e) {
      print('SQLite Error deleting message: $e');
      return false;
    }
  }
}
