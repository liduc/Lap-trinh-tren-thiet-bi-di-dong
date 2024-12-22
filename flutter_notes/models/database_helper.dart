import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'Note.dart';
import 'User.dart';

class DatabaseHelper {
  static Database? _database; // static + nullable
  static final DatabaseHelper instance = DatabaseHelper._(); // singleton pattern

  DatabaseHelper._(); // Private constructor

  // Getter để lấy instance của database:
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }
// Method to create both user and notes tables
  Future<void> createTables() async {
    final db = await database;

    // Drop existing tables if needed (optional)
    await db.execute('''DROP TABLE IF EXISTS notes''');
    await db.execute('''DROP TABLE IF EXISTS user''');

    // Create new tables
    await db.execute('''
    CREATE TABLE user (
      id INTEGER PRIMARY KEY,
      username TEXT NOT NULL,
      password TEXT NOT NULL
    );
  ''');

    await db.execute('''
    CREATE TABLE notes (
      id INTEGER PRIMARY KEY,
      title TEXT NOT NULL,
      content TEXT NOT NULL,
      createdAt TEXT NOT NULL,
      user_id INTEGER,
      FOREIGN KEY(user_id) REFERENCES user(id)
    );
  ''');

    print('Tables created successfully!');
  }

  // Khởi tạo database:
  // version để quản lý phiên bản database
  // onCreate sẽ được gọi khi database được tạo lần đầu
  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'notes_and_user.db');
    deleteDatabase(path);
    return await openDatabase(
      path,
      version: 2, // Update version to reflect schema changes
      onCreate: _createDB,
      onUpgrade: _onUpgrade, // Handle database upgrades
    );
  }

  // Tạo bảng trong database (version 1)
  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user (
        id INTEGER PRIMARY KEY,
        username TEXT NOT NULL,
        password TEXT NOT NULL
      );

      CREATE TABLE notes (
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        createdAt TEXT NOT NULL,
        user_id INTEGER, 
        FOREIGN KEY(user_id) REFERENCES user(id)
      );
    ''');
  }

  // Handle upgrading the database (from version 1 to version 2 or higher)
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Migrate from version 1 to 2: Add user_id in 'notes' table (or other changes if needed)
      await db.execute('''
        ALTER TABLE notes ADD COLUMN user_id INTEGER;
        ALTER TABLE notes ADD FOREIGN KEY(user_id) REFERENCES user(id);
      ''');
    }
    // If you want to support more versions, add more conditions here
  }

  // Thêm ghi chú:
  Future<int> insertNote(Note note) async {
    final db = await database;
    return await db.insert('notes', {
      'title': note.title,
      'content': note.content,
      'createdAt': DateTime.now().toIso8601String(),
      'user_id': note.userId, // Sử dụng user_id thay vì user
    });
  }

  // Lấy danh sách ghi chú:
  Future<List<Note>> getNotes() async {
    final db = await database;

    // Safely get query results
    final List<Map<String, dynamic>>? maps = await db.query('notes', orderBy: 'createdAt DESC');

    if (maps == null || maps.isEmpty) {
      print('No notes found in the database.');
      return []; // Return an empty list if no notes are found
    }

    return maps.map((noteMap) => Note.fromMap(noteMap)).toList();
  }


  // Xóa ghi chú:
  Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Phương thức đăng nhập:
  Future<User?> login(String username, String password) async {
    final db = await database;
    var result = await db.query(
      'user',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    } else {
      print('Login failed');
      return null;
    }
  }
  Future<int> deleteAllNotes() async {
    final db = await database;
    return await db.delete(
      'notes', // Tên bảng
    );
  }
  // Phương thức đăng ký:
  Future<void> register(String username, String password) async {
    final db = await database;

    // Kiểm tra xem tên người dùng đã tồn tại chưa
    var result = await db.query(
      'user',
      where: 'username = ?',
      whereArgs: [username],
    );

    if (result.isNotEmpty) {
      print('Username already exists');
    } else {
      await db.insert(
        'user',
        {
          'username': username,
          'password': password,
        },
      );
      print('Registration successful');
    }
  }
}