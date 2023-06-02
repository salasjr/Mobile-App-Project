import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:trad_doctors_new/domain/user_dto.dart';

class UserDB {
  static const String tableName = 'users';
  static const String dbName = 'user_cache.db';

  Future<void> cacheUser(User user) async {
    final db = await _openDb();
    await db.insert(tableName, user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<User> getCachedUser() async {
  
    final db = await _openDb();
    final result = await db.query(tableName, limit: 1);

    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    } else {
      return User.empty;
    }
  }

  Future<Database> _openDb() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, dbName);
    return openDatabase(dbPath, version: 1, onCreate: (db, version) async {
      await db.execute(''' 
        CREATE TABLE $tableName ( 
          id INTEGER PRIMARY KEY, 
          fullname TEXT, 
          phoneNumber TEXT, 
          profilePicture TEXT, 
          businessName TEXT, 
          businessId TEXT, 
          address TEXT, 
          verified INTEGER, 
          role TEXT, 
          token TEXT, 
          rating INTEGER, 
          ratingCount INTEGER 
        ) 
      ''');
    });
  }
}
