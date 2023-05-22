// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trad_doctors/constants/utils.dart';
import 'package:http/http.dart' as http;
import 'package:trad_doctors/providers/all_doctors_provider.dart';

import '../../../constants/global_variables.dart';

class AllDoctorsService {
  Future<List<dynamic>?> getAllDoctors({required BuildContext context}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("auth-token");

      if (token == null) {
        prefs.setString("auth-token", '');
        token = '';
      }

      // Get all doctors
      http.Response res = await http.get(
        Uri.parse('$uri/user/getAllDoctors'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token
        },
      );

      var allDoctorsProvider =
          Provider.of<AllDoctorsProvider>(context, listen: false);
      if (res.statusCode == 200) {
        final List<dynamic> doctors = json.decode(res.body);
        allDoctorsProvider.setAllDoctors(doctors);
        return doctors;
      } else {
        return null;
      }
    } catch (err) {
      showSnackBar(context, err.toString());
    }
    return null;
  }
}
