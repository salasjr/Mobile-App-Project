part of 'doctor_appointment_bloc.dart';

abstract class DoctorAppointmentState extends Equatable {
  const DoctorAppointmentState();

  @override
  List<Object> get props => [];
}

class DoctorAppointmentLoading extends DoctorAppointmentState {}

class DoctoAppointmentError extends DoctorAppointmentState {}

class DoctorAppointmentLoaded extends DoctorAppointmentState {
  final List<List<PatientAppointment>> appointments;
  const DoctorAppointmentLoaded({required this.appointments});

  @override
  List<Object> get props => [appointments];
}
