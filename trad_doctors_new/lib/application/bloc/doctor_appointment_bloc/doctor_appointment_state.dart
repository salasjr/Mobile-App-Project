part of 'doctor_appointment_bloc.dart';

abstract class DoctorAppointmentState extends Equatable {
  const DoctorAppointmentState();

  @override
  List<Object> get props => [];
}

class DoctorAppointmentLoading extends DoctorAppointmentState {}

class DoctoAppointmentError extends DoctorAppointmentState {}

class DoctorAcceptedAppointment extends DoctorAppointmentState {
  final List<Appointment> appointments;
  const DoctorAcceptedAppointment(this.appointments);

  @override
  List<Object> get props => [appointments];
}

class DoctorRejectedAppointment extends DoctorAppointmentState {
  final List<Appointment> appointments;
  const DoctorRejectedAppointment(this.appointments);

  @override
  List<Object> get props => [appointments];
}

class DoctorPendingAppointment extends DoctorAppointmentState {
  final List<Appointment> appointments;
  const DoctorPendingAppointment(this.appointments);

  @override
  List<Object> get props => [appointments];
}

class DoctorCompletedAppointment extends DoctorAppointmentState {
  final List<Appointment> appointments;
  const DoctorCompletedAppointment(this.appointments);

  @override
  List<Object> get props => [appointments];
}
