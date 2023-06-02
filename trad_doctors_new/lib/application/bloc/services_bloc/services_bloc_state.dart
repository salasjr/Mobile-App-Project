part of 'services_bloc_bloc.dart';

abstract class ServicesState extends Equatable {
  const ServicesState();

  @override
  List<Object> get props => [];
}

class ServicesLoading extends ServicesState {}

class ServicesLoaded extends ServicesState {
  final List<Service> services;
  const ServicesLoaded({required this.services});

  @override
  List<Object> get props => [services];
}

class ServicesError extends ServicesState {}
