import 'package:flutter/material.dart';
import '../models/user.dart';

class AllDoctorsProvider extends ChangeNotifier {
  List<User> _allDoctors = [];

  List<User> get allDoctors => _allDoctors;

  void setAllDoctors(List<dynamic> doctors) {
    _allDoctors = User.fromList(doctors);
    notifyListeners();
  }
}
