import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trad_doctors_new/domain/models.dart';
import 'package:trad_doctors_new/infrustructure/provider/auth_data_provider.dart';


class AuthRepository {
  final AuthDataProvider _dataProvider;

  AuthRepository() : _dataProvider = AuthDataProvider();
  var currentUser = User.empty;

  Future<User> editProfile(attribute, value, token) async {
    return await _dataProvider.editProfile(attribute, value, token);
  }

  Future<bool> deleteProfile(id, token) async {
    return await _dataProvider.deleteProfile(id, token);
  }

  Future<bool> forgetPassword(
      phoneNumber, question, answer, newPassword) async {
    return await _dataProvider.forgetPassword(
        phoneNumber, question, answer, newPassword);
  }

  Future<bool> changePassword(
      {required oldPassword,
      required newPassword,
      required token,
      required id}) async {
    return await _dataProvider.changePassword(
        newPassword: newPassword,
        oldPassword: oldPassword,
        id: id,
        token: token);
  }

  Future<User?> signup({
    required String question,
    required String answer,
    required String fullName,
    required String phoneNumber,
    required String password,
    required File profilePicture,
    required String businessName,
    required String businessId,
    required String address,
    required String role,
  }) async {
    try {
      User user = await _dataProvider.signUpUser(
        question: question,
        answer: answer,
        fullName: fullName,
        phoneNumber: phoneNumber,
        password: password,
        profilePicture: profilePicture,
        businessName: businessName,
        businessId: businessId,
        address: address,
        role: role,
      );

      // cacheUser(user);
      return user;
    } catch (_) {}
    return null;
  }

  // check weather or not the phone number already exists.
  Future<bool> phoneValidate({
    required String phoneNumber,
  }) async {
    try {
      bool valid = await _dataProvider.phoneValidate(phoneNumber: phoneNumber);
      return valid;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return false;
  }

  // Update the logInWithPhoneAndPassword method to make an HTTP request to your Node.js Express backend
  Future<dynamic> logInWithPhoneAndPassword({
    required String phoneNumber,
    required String password,
  }) async {
    // form valid`ation here

    final user = await _dataProvider.signInUser(
        phoneNumber: phoneNumber, password: password);
    await cacheUser(user);
    return user;
  }

  static const String tableName = 'users';
  static const String dbName = 'user_cache.db';

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

  // remove cache
  Future<void> removeCachedUser() async {
    final db = await _openDb();
    db.delete(tableName);
  }
}
