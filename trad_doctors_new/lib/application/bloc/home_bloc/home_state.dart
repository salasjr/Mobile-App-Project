part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<User> doctors;

  const HomeLoaded(this.doctors);

  @override
  List<Object> get props => [doctors];
}

class HomeLoadingFalilur extends HomeState {}


