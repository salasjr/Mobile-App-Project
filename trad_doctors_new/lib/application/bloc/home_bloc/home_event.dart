part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadHome extends HomeEvent {
  final User user;

  const LoadHome({this.user = User.empty});

  @override
  List<Object> get props => [user];
}

class DoctorClicked extends HomeEvent {
  final User doctor;
  const DoctorClicked({required this.doctor});

  @override
  List<Object> get props => [doctor];
}
