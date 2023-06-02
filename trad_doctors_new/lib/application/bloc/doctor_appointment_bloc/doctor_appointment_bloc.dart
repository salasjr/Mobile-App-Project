import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trad_doctors_new/domain/patient_appoint_dto.dart';
import 'package:trad_doctors_new/infrustructure/repository/appointement_repository.dart';

import 'package:trad_doctors_new/domain/appointemt_dto.dart';

part 'doctor_appointment_event.dart';
part 'doctor_appointment_state.dart';

class DoctorAppointmentBloc
    extends Bloc<DoctorAppointmentEvent, DoctorAppointmentState> {
  final AppointmentInterface _appointmentInterface;
  DoctorAppointmentBloc(this._appointmentInterface)
      : super(DoctorAppointmentLoading()) {
    on<LoadDoctorAppointment>(_onLoadDoctorAppointment);
    on<UpdateDoctorAppointment>(_onUpdateDoctorAppointment);
    on<DeleteDoctorAppointment>(_onDeleteDoctorAppointment);
  }

  void _onLoadDoctorAppointment(
      LoadDoctorAppointment event, Emitter<DoctorAppointmentState> emit) async {
    try {
      emit(DoctorAppointmentLoading());

      List<PatientAppointment> appointments = await _appointmentInterface
          .getAcceptedAppointment(event.token, event.id);

      List<List<PatientAppointment>> filtered = helper(appointments);

      emit(DoctorAppointmentLoaded(appointments: filtered));
    } catch (err) {
      emit(DoctoAppointmentError());
    }
  }

  void _onUpdateDoctorAppointment(UpdateDoctorAppointment event,
      Emitter<DoctorAppointmentState> emit) async {
    List<List<PatientAppointment>> oldData = [];
    if (state is DoctorAppointmentLoaded) {
      oldData = (state as DoctorAppointmentLoaded).appointments;
    }
    emit(DoctorAppointmentLoading());
    try {
      await _appointmentInterface.updateAppointment(
          event.token, event.id, event.attribute);

      var temp = oldData[event.indexes[0]].removeAt(event.indexes[1]);
      PatientAppointment newDate = PatientAppointment(
          profilePicture: temp.profilePicture,
          fullname: temp.fullname,
          phoneNumber: temp.phoneNumber,
          address: temp.address,
          appointment_id: temp.appointment_id,
          patient_id: temp.patient_id,
          doctor_id: temp.doctor_id,
          status: event.attribute["status"],
          case_description: temp.case_description,
          message: event.attribute["messsage"],
          rating: temp.rating);

      Map val = {"pending": 0, "accepted": 1, "rejected": 2, "done": 3};
      oldData[val[event.attribute["status"]]].add(newDate);

      emit(DoctorAppointmentLoaded(appointments: oldData));
    } catch (err) {
      emit(DoctorAppointmentLoading());
    }
  }

  void _onDeleteDoctorAppointment(DeleteDoctorAppointment event,
      Emitter<DoctorAppointmentState> emit) async {
    List<List<PatientAppointment>> oldData = [];
    if (state is DoctorAppointmentLoaded) {
      oldData = (state as DoctorAppointmentLoaded).appointments;
    }

    emit(DoctorAppointmentLoading());
    try {
      await _appointmentInterface.deleteAppointment(event.token, event.id);
      oldData[event.indexes[0]].removeAt(event.indexes[1]);

      emit(DoctorAppointmentLoaded(appointments: oldData));
    } catch (err) {
      emit(DoctoAppointmentError());
    }
  }

  List<List<PatientAppointment>> helper(List<PatientAppointment> appointments) {
    List<List<PatientAppointment>> filtered = [[], [], [], []];
    Map val = {"pending": 0, "accepted": 1, "rejected": 2, "done": 3};

    for (int i = 0; i < appointments.length; i++) {
      PatientAppointment selected = appointments[i];
      filtered[val[selected.status]].add(selected);
    }
    return filtered;
  }
}
