import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:trad_doctors_new/domain/doctor_dto.dart';
import 'package:trad_doctors_new/domain/user_dto.dart';
import 'package:trad_doctors_new/presentation/constants/global_variables.dart';

class DoctorApi {
  Future<List<Doctor>> getDoctors(token) async {
    try {
      //Get all doctors
      http.Response response = await http.get(
        Uri.parse('$uri/user/getAllDoctors'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token
        },
      );

      if (response.statusCode == 200) {
        var doctorsJson = jsonDecode(response.body);
        List<Doctor> doctors = Doctor.fromList(doctorsJson);
        return doctors;
      } else {
        return [];
      }
    } catch (err) {
      return [];
    }
  }

  Future<User> getDoctorById(id) async {
    http.Response response = await http.get(
      Uri.parse('$uri/user/getDoctorById'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'auth-token': ''
      },
    );

    if (response.statusCode == 200) {
      var doctorJson = jsonDecode(response.body);
      return User.fromJson(doctorJson);
    } else {
      return User.empty;
    }
  }
}
