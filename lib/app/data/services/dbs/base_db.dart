import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'db_path.dart';

class BaseDb {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final dbPath = await getDatabasesPath();
    final path = join(directory.path, DbPath.dbName);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE ${DbPath.postsTable} (
      ${DbPath.colId} INTEGER PRIMARY KEY,
      ${DbPath.colUserId} INTEGER,
      ${DbPath.colTitle} TEXT,
      ${DbPath.colBody} TEXT,
      ${DbPath.colIsRead} INTEGER
    )
  ''');
  }
}

class DbResponse<T> {
  final bool status;
  final String? message;
  final T? data;

  DbResponse({required this.status, this.message, this.data});

  factory DbResponse.success(T data) {
    return DbResponse(status: true, message: '', data: data);
  }

  factory DbResponse.failed(String message) {
    return DbResponse(status: false, message: message, data: null);
  }
}
