import 'package:trad_doctors_new/infrustructure/provider/doctor_dataprovider.dart';
import 'package:trad_doctors_new/domain/doctor_dto.dart';
import 'package:trad_doctors_new/domain/user_dto.dart';

abstract class DoctorRepositoryInterface {
  Future<List<Doctor>> getDoctors(token);
  Future<User> getDoctorById(id, token);
}

class DoctorRepositoryImp implements DoctorRepositoryInterface {
  @override
  Future<List<Doctor>> getDoctors(token) async {
    DoctorApi doctorApi = DoctorApi();
    List<Doctor> doctors = await doctorApi.getDoctors(token);
    return doctors;
  }

  @override
  Future<User> getDoctorById(id, token) async {
    DoctorApi doctorApi = DoctorApi();
    return doctorApi.getDoctorById(id);
  }
}
