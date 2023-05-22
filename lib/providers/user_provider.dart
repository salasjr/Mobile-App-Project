import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: 0,
    fullname: '',
    phoneNumber: '',
    profilePicture: '',
    businessName: '',
    businessId: '',
    address: '',
    verified: 1,
    role: '',
    token: '',
    rating: 0,
    rating_count: 0,
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
