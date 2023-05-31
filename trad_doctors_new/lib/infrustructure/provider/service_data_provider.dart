import '../../domain/service_dto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../presentation/constants/global_variables.dart';

class ServiceApi {
  Future<List<Service>> getServiceById(token, id) async {
    try {
      //Get all doctors
      http.Response response = await http.get(
        Uri.parse('$uri/service/getservicebyid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token,
          'id': id.toString()
        },
      );

      if (response.statusCode == 200) {
        var doctorsJson = jsonDecode(response.body);
        return Service.fromList(doctorsJson);
      } else {
        return [];
      }
    } catch (err) {
      rethrow;
      // showSnackBar(context, err.toString());
    }
  }

  Future<bool> addService(token, service) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$uri/service/addService'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token,
        },
        body: jsonEncode({
          "doctor_id": service.doctor_id,
          "title": service.title,
          "description": service.description,
          "price": service.price
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> updateService(token, service) async {
    // update service
    try {
      http.Response response = await http.put(
        Uri.parse('$uri/service/updateService'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token,
        },
        body: jsonEncode({
          "id": service.id,
          "title": service.title,
          "description": service.description,
          "price": service.price
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> deleteService(token, id) async {
    print(' ---------id ---------${id}');
    try {
      http.Response response = await http.delete(
        Uri.parse('$uri/service/deleteservice'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "auth-token": token,
          "id": id.toString()
        },
      );

      if (response.statusCode == 204) {
        return true;
      } else {
        throw Error();
      }
    } catch (err) {
      rethrow;
    }
  }
}
