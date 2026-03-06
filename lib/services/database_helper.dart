import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// SQLite Database Helper - Quản lý local database trên điện thoại
class DatabaseHelper {
  static Database? _database;
  static const String _dbName = 'liveboard.db';
  static const String _tableName = 'messages';

  /// Lấy instance database (singleton)
  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;

    String path = join(await getDatabasesPath(), _dbName);

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            senderName TEXT NOT NULL,
            content TEXT NOT NULL,
            likeCount INTEGER DEFAULT 0,
            createdAt TEXT NOT NULL
          )
        ''');
        print('=== SQLite: Table "$_tableName" created ===');
      },
    );
    return _database!;
  }

  /// Thêm message mới
  static Future<int> insertMessage({
    required String senderName,
    required String content,
  }) async {
    final db = await getDatabase();
    return await db.insert(_tableName, {
      'senderName': senderName,
      'content': content,
      'likeCount': 0,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  /// Lấy tất cả messages (mới nhất trước)
  static Future<List<Map<String, dynamic>>> getAllMessages() async {
    final db = await getDatabase();
    return await db.query(
      _tableName,
      orderBy: 'createdAt DESC',
    );
  }

  /// Like message (tăng likeCount lên 1)
  static Future<int> likeMessage(int id) async {
    final db = await getDatabase();
    return await db.rawUpdate(
      'UPDATE $_tableName SET likeCount = likeCount + 1 WHERE id = ?',
      [id],
    );
  }

  /// Xóa message
  static Future<int> deleteMessage(int id) async {
    final db = await getDatabase();
    return await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Đếm số messages
  static Future<int> getMessageCount() async {
    final db = await getDatabase();
    final result = await db.rawQuery('SELECT COUNT(*) as count FROM $_tableName');
    return Sqflite.firstIntValue(result) ?? 0;
  }
}
