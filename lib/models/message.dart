/// Model class for LiveBoard message
class Message {
  final int id;
  final String senderName;
  final String content;
  final int likeCount;
  final DateTime createdAt;

  Message({
    required this.id,
    required this.senderName,
    required this.content,
    required this.likeCount,
    required this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] ?? 0,
      senderName: json['senderName'] ?? '',
      content: json['content'] ?? '',
      likeCount: json['likeCount'] ?? 0,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }
}
