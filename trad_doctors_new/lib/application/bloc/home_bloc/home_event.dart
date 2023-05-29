part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadHome extends HomeEvent {
  final List<User> doctors;

  const LoadHome({this.doctors = const <User>[]});

  @override
  List<Object> get props => [doctors];
}

class DoctorClicked extends HomeEvent {
  final User doctor;
  const DoctorClicked({required this.doctor});

  @override
  List<Object> get props => [doctor];
}

