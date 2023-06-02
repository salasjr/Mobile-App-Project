import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trad_doctors_new/domain/appointemt_dto.dart';
import 'package:trad_doctors_new/domain/patient_appoint_dto.dart';
import 'package:trad_doctors_new/infrustructure/repository/appointement_repository.dart';
part 'patient_appointment_event.dart';
part 'patient_appointment_state.dart';

class PatientAppointmentBloc
    extends Bloc<PatientAppointmentEvent, PatientAppointmentState> {
  final AppointmentInterface _appointmentInterface;
  PatientAppointmentBloc(this._appointmentInterface)
      : super(PatientAppointmentLoading()) {
    on<CreateAppointment>(_onCreateAppointment);
    on<LoadAppointment>(_onLoadAppointment);
    on<RateAppointment>(_onRateAppointment);
    on<UpdateAppointment>(_onUpdateAppointment);
    on<DeleteAppointment>(_onDeleteAppointment);
  }

  FutureOr<void> _onCreateAppointment(
      CreateAppointment event, Emitter<PatientAppointmentState> emit) {
    _appointmentInterface.createAppointment(event.token, event.appointment);
  }

  FutureOr<void> _onLoadAppointment(
      LoadAppointment event, Emitter<PatientAppointmentState> emit) async {
    emit(PatientAppointmentLoading());
    try {
      List<PatientAppointment> patientAppointment = await _appointmentInterface
          .getPateintAppointments(event.token, event.id);
      emit(PateintAppointmentLoaded(appointments: patientAppointment));
    } catch (err) {
      emit(PatientAppointmentError());
    }
  }

  FutureOr<void> _onRateAppointment(
      RateAppointment event, Emitter<PatientAppointmentState> emit) {
    _appointmentInterface.rateAppointment(
        event.token, event.doctorid, event.appointment_id, event.rating);
  }

  FutureOr<void> _onUpdateAppointment(
      UpdateAppointment event, Emitter<PatientAppointmentState> emit) async {
    List<PatientAppointment> oldData = [];
    if (state is PateintAppointmentLoaded) {
      oldData = (state as PateintAppointmentLoaded).appointments;
    }
    emit(PatientAppointmentLoading());
    try {
      await _appointmentInterface.updateAppointment(
          event.token, event.id, event.attribute);
      var temp = oldData.removeAt(event.index);
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
          message: event.attribute["message"],
          rating: temp.rating);

      oldData.insert(event.index, newDate);
      emit(PateintAppointmentLoaded(appointments: oldData));
    } catch (err) {
      emit(PatientAppointmentError());
    }
  }

  FutureOr<void> _onDeleteAppointment(
      DeleteAppointment event, Emitter<PatientAppointmentState> emit) async {
    List<PatientAppointment> oldAppointments = [];
    if (state is PateintAppointmentLoaded) {
      oldAppointments = (state as PateintAppointmentLoaded).appointments;
    }
    emit(PatientAppointmentLoading());
    try {
      await _appointmentInterface.deleteAppointment(
          event.token, event.appointment_id);

      oldAppointments.removeAt(event.index);
      emit(PateintAppointmentLoaded(appointments: oldAppointments));
    } catch (err) {
      emit(PatientAppointmentError());
    }
  }
}
