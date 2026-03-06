import 'dart:convert';
import 'api_client.dart';
import '../models/message.dart';

/// Service gọi API LiveBoard messages
class MessageService {
  MessageService._();

  /// Lấy tất cả tin nhắn - GET /messages
  static Future<List<Message>> getAllMessages() async {
    try {
      final response = await ApiClient.get('/messages');
      final body = jsonDecode(response.body);

      if (response.statusCode == 200 && body['isSuccess'] == true) {
        final items = body['data'] as List? ?? [];
        return items.map((item) => Message.fromJson(item)).toList();
      }
      return [];
    } catch (e) {
      print('Error fetching messages: $e');
      return [];
    }
  }

  /// Gửi tin nhắn mới - POST /messages
  static Future<bool> createMessage({
    required String senderName,
    required String content,
  }) async {
    try {
      final response = await ApiClient.post('/messages', {
        'senderName': senderName,
        'content': content,
      });
      final body = jsonDecode(response.body);
      return response.statusCode >= 200 &&
          response.statusCode < 300 &&
          body['isSuccess'] == true;
    } catch (e) {
      print('Error creating message: $e');
      return false;
    }
  }

  /// Like tin nhắn - PUT /messages/{id}/like
  static Future<bool> likeMessage(int id) async {
    try {
      final response = await ApiClient.put('/messages/$id/like', {});
      final body = jsonDecode(response.body);
      return response.statusCode >= 200 &&
          response.statusCode < 300 &&
          body['isSuccess'] == true;
    } catch (e) {
      print('Error liking message: $e');
      return false;
    }
  }

  /// Xóa tin nhắn - DELETE /messages/{id}
  static Future<bool> deleteMessage(int id) async {
    try {
      final response = await ApiClient.delete('/messages/$id');
      final body = jsonDecode(response.body);
      return response.statusCode >= 200 &&
          response.statusCode < 300 &&
          body['isSuccess'] == true;
    } catch (e) {
      print('Error deleting message: $e');
      return false;
    }
  }
}
