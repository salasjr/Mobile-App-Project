part of 'services_bloc_bloc.dart';

abstract class ServicesEvent extends Equatable {
  const ServicesEvent();

  @override
  List<Object> get props => [];
}

class LoadServices extends ServicesEvent {
  final ServiceFetch service;
  const LoadServices({required this.service});

  @override
  List<Object> get props => [service];
}

class UpdateServices extends ServicesEvent {
  final Service service;
  final String token;
  final int index;

  const UpdateServices(
      {required this.service, required this.token, required this.index});

  @override
  List<Object> get props => [service];
}

class DeleteServices extends ServicesEvent {
  final int index;
  final String token;
  final int id;
  const DeleteServices(
      {required this.token, required this.id, required this.index});

  @override
  List<Object> get props => [index, token, id];
}

class AddService extends ServicesEvent {
  final Service service;
  final String token;
  const AddService({required this.token, required this.service});

  @override
  List<Object> get props => [service];
}
