part of 'doctor_detail_bloc.dart';

abstract class DoctorDetailBlocEvent extends Equatable {
  const DoctorDetailBlocEvent();

  @override
  List<Object> get props => [];
}

class LoadService extends DoctorDetailBlocEvent {
  final User doctor;
  const LoadService({required this.doctor});

  @override
  List<Object> get props => [doctor];
}

class AppointmentClicked extends DoctorDetailBlocEvent {
  final Appointment appointment;
  const AppointmentClicked({required this.appointment});

  @override
  List<Object> get props => [appointment];
}
