part of 'doctor_detail_bloc.dart';

abstract class DoctorDetailState extends Equatable {
  const DoctorDetailState();

  @override
  List<Object> get props => [];
}

class DoctorDetailLoading extends DoctorDetailState {}

class DoctorDetialLoaded extends DoctorDetailState {
  final List<Service> services;
  const DoctorDetialLoaded({required this.services});

  @override
  List<Object> get props => [services];
}

class DoctorOwnerState extends DoctorDetailState {
  final Doctor doctor;
  const DoctorOwnerState(this.doctor);

  @override
  List<Object> get props => [doctor];
}

class DoctorAppointState extends DoctorDetailState {
  final Appointment appointment;
  const DoctorAppointState(this.appointment);

  @override
  List<Object> get props => [appointment];
}

class DoctorDetialError extends DoctorDetailState {}
