import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:mime/mime.dart' show lookupMimeType;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../../domain/user_dto.dart';
import '../../presentation/constants/global_variables.dart';

class AuthDataProvider {
  Future<User> signUpUser({
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

      if (httpResponse.statusCode == 200) {
        return User.fromJson(httpResponse.body);
      } else {
        return User.empty;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return User.empty;
  }

  // phone number validation
  Future<bool> phoneValidate({
    required String phoneNumber,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/auth/signupInputValidate'),
        body: jsonEncode({
          'phoneNumber': phoneNumber,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return false;
  }

  Future<dynamic> signInUser({
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

      User user = User.fromJson(res.body);
      return user;
      // return const  User(
      //     id: 1,
      //     fullname: "Abebebe",
      //     phoneNumber: "747564756",
      //     profilePicture: "TEXT",
      //     businessName: "TEXT",
      //     businessId: "TEXT",
      //     address: "TEXT",
      //     verified: 0,
      //     role: "doctor",
      //     token: "TEXT",
      //     rating: 7,
      //     ratingCount: 6,
      //     answer: "yegryr",
      //     question: "hhhhhh");
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
