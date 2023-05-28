part of 'doctor_appointment_bloc.dart';

abstract class DoctorAppointmentEvent extends Equatable {
  const DoctorAppointmentEvent();

  @override
  List<Object> get props => [];
}


class CreateAppointement extends DoctorAppointmentEvent {
  final Appointment appointment;
  const CreateAppointement({required this.appointment});

  @override
  List<Object> get props => [appointment];
}

class LoadDoctorPendingAppointment extends DoctorAppointmentEvent {
  final List<Appointment> appointments;
  const LoadDoctorPendingAppointment(
      {this.appointments = const <Appointment>[]});

  @override
  List<Object> get props => [appointments];
}

class LoadDoctorAcceptedAppointment extends DoctorAppointmentEvent {
  final List<Appointment> appointments;
  const LoadDoctorAcceptedAppointment(
      {this.appointments = const <Appointment>[]});

  @override
  List<Object> get props => [appointments];
}

class LoadDoctorRejectedAppointment extends DoctorAppointmentEvent {
  final List<Appointment> appointments;
  const LoadDoctorRejectedAppointment(
      {this.appointments = const <Appointment>[]});

  @override
  List<Object> get props => [appointments];
}

class LoadDoctorCompletedAppointment extends DoctorAppointmentEvent {
  final List<Appointment> appointments;
  const LoadDoctorCompletedAppointment(
      {this.appointments = const <Appointment>[]});

  @override
  List<Object> get props => [appointments];
}

// CRUD OPERATION

class UpdateDoctorAppointment extends DoctorAppointmentEvent {
  final Appointment appointment;
  const UpdateDoctorAppointment({required this.appointment});

  @override
  List<Object> get props => [appointment];
}

class DeleteDoctorAppointment extends DoctorAppointmentEvent {
  final Appointment appointment;
  const DeleteDoctorAppointment({required this.appointment});

  @override
  List<Object> get props => [appointment];
}
