// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:mime/mime.dart' show lookupMimeType;
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:trad_doctors/common/doctor_bottom_bar.dart';
import 'package:trad_doctors/common/patient_bottom_bar.dart';
import 'package:trad_doctors/constants/error_handling.dart';
import 'package:trad_doctors/features/landing/screens/landing_screen.dart';
import 'package:trad_doctors/providers/user_provider.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signUpInputValidate({
    required BuildContext context,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
    required VoidCallback pageStateIncrement,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/auth/signupInputValidate'),
        body: jsonEncode({
          'phoneNumber': phoneNumber,
          'password': password,
          'confirmPassword': confirmPassword
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () {
            pageStateIncrement();
          });
    } catch (err) {
      showSnackBar(context, "Something went wrong");
    }
  }

  void signUpUser({
    required BuildContext context,
    required String fullName,
    required String phoneNumber,
    required String password,
    required File profilePicture,
    required String businessName,
    required String businessId,
    required String address,
    required String question,
    required String answer,
    required String role,
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$uri/auth/signup'),
      );
      request.headers.addAll({'Content-Type': 'multipart/form-data'});

      var mimeTypeData =
          lookupMimeType(profilePicture.path, headerBytes: [0xFF, 0xD8])!
              .split('/');
      var file = await http.MultipartFile.fromPath(
        'image',
        profilePicture.path,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
      );
      request.files.add(file);
      request.fields['fullName'] = fullName;
      request.fields['phoneNumber'] = phoneNumber;
      request.fields['password'] = password;
      request.fields['businessName'] = businessName;
      request.fields['businessId'] = businessId;
      request.fields['address'] = address;
      request.fields['question'] = question;
      request.fields['answer'] = answer;
      request.fields['role'] = role;

      var response = await request.send();

      var httpResponse = await http.Response.fromStream(response);

      httpErrorHandler(
        response: httpResponse,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          debugPrint(httpResponse.body);
          Provider.of<UserProvider>(context, listen: false)
              .setUser(httpResponse.body);
          await prefs.setString(
              "auth-token", jsonDecode(httpResponse.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
            context,
            DoctorBottomBar.routeName,
            (route) => false,
          );
          showSnackBar(
              context, "Congrats! Account has been created succesfully.");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/auth/signin'),
        body: jsonEncode({
          'phoneNumber': phoneNumber,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () async {
          debugPrint(' ========== ${res.body}=================== ');
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString("auth-token", jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
            context,
            jsonDecode(res.body)['role'] == 'doctor'
                ? DoctorBottomBar.routeName
                : PatientBottomBar.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<Map<String, dynamic>?> getUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("auth-token");

      if (token == null) {
        prefs.setString("auth-token", '');
        token = '';
      }

      http.Response userRes = await http.get(
        Uri.parse('$uri/user/getUserData'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token
        },
      );

      var userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUser(userRes.body);

      if (userRes.statusCode == 200) {
        return jsonDecode(userRes.body);
      } else {
        return null;
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return null;
  }

  // Sign out user
  void signOut(BuildContext context) async {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("auth-token", '');
    });
    Navigator.pushNamedAndRemoveUntil(
        context, LandingPage.routeName, (route) => false);
    showSnackBar(context, "Signed out");
  }
}
