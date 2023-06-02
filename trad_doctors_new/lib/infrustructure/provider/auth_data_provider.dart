import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:mime/mime.dart' show lookupMimeType;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:trad_doctors_new/domain/user_dto.dart';
import 'package:trad_doctors_new/presentation/constants/global_variables.dart';

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

  Future<bool> forgetPassword(
      phoenNumber, question, answer, newPassword) async {
    try {
      http.Response res = await http.put(
        Uri.parse('$uri/auth/forgetpassword'),
        body: jsonEncode({
          'phoneNumber': phoenNumber,
          'question': question,
          'answer': answer,
          'newPassword': newPassword,
          'reqUrl': "forget"
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      if (res.statusCode == 200) {
        return true;
      } else {
        throw Exception(jsonDecode(res.body)['error']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
    required String token,
    required int id,
  }) async {
    try {
      http.Response res = await http.put(
        Uri.parse('$uri/profile/update/changepassword/$id'),
        body: jsonEncode({
          'oldPassword': oldPassword,
          'newPassword': newPassword,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token,
        },
      );
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      rethrow;
    }
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
        throw Exception(jsonDecode(res.body)['error']);
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

      if (res.statusCode == 200) {
        User user = User.fromJson(res.body);
        return user;
      } else {
        throw Exception(jsonDecode(res.body)['error']);
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<User> editProfile(attribute, value, token) async {
    try {
      http.Response response = await http.put(
        Uri.parse('$uri/profile/update'),
        body: jsonEncode({"attribute": attribute, "value": value}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token
        },
      );

      if (response.statusCode == 200) {
        User user = User.fromJson(response.body);
        return user;
      } else {
        throw Exception(jsonDecode(response.body)['error']);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> deleteProfile(id, token) async {
    try {
      http.Response response = await http.delete(
        Uri.parse('$uri/profile/delete/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token
        },
      );
      print('----------------${response.statusCode}');
      if (response.statusCode == 204) {
        return true;
      } else {
        throw Exception(jsonDecode(response.body)['error']);
      }
    } catch (err) {
      rethrow;
    }
  }
}
