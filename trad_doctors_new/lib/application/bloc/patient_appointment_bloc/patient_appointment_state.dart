part of 'patient_appointment_bloc.dart';

abstract class PatientAppointmentState extends Equatable {
  const PatientAppointmentState();

  @override
  List<Object> get props => [];
}

class PatientAppointmentLoading extends PatientAppointmentState {}

class PateintAppointmentLoaded extends PatientAppointmentState {
  final List<PatientAppointment> appointments;

  const PateintAppointmentLoaded({required this.appointments});
}

class PatientAppointmentError extends PatientAppointmentState {}
