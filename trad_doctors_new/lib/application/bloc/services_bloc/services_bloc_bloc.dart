import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:trad_doctors_new/domain/service_fetch_dto.dart';
import 'package:trad_doctors_new/infrustructure/repository/service_repository.dart';
import '../../../domain/service_dto.dart';

part 'services_bloc_event.dart';
part 'services_bloc_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final ServiceRepositoryInterface serviceRepositoryInterface;
  ServicesBloc(this.serviceRepositoryInterface) : super(ServicesLoading()) {
    on<LoadServices>(_onLoadServices);
    on<UpdateServices>(_onUpdateServices);
    on<DeleteServices>(_onDeleteServices);
    on<AddService>(_onAddServices);
  }

  void _onLoadServices(LoadServices event, Emitter<ServicesState> emit) async {
    if (state is ServicesLoaded) return;
    emit(ServicesLoading());
    try {
      List<Service> services = await serviceRepositoryInterface.getServiceByID(
          event.service.token, event.service.id);

      services = services.reversed.toList();
      emit(ServicesLoaded(services: services));
    } catch (err) {
      emit(ServicesError());
    }
  }

  void _onUpdateServices(
      UpdateServices event, Emitter<ServicesState> emit) async {
    List<Service> oldServices = [];
    if (state is ServicesLoaded) {
      oldServices = (state as ServicesLoaded).services;
    }

    emit(ServicesLoading());
    try {
      await serviceRepositoryInterface.updateService(
          event.token, event.service);

      oldServices[event.index] = event.service;
      emit(ServicesLoaded(services: oldServices));
    } catch (err) {
      emit(ServicesError());
    }
  }

  void _onDeleteServices(
      DeleteServices event, Emitter<ServicesState> emit) async {
    List<Service> oldServices = [];
    if (state is ServicesLoaded) {
      oldServices = (state as ServicesLoaded).services;
    }
    emit(ServicesLoading());
    try {
      await serviceRepositoryInterface.deleteService(event.token, event.id);
      oldServices.removeAt(event.index);
      emit(ServicesLoaded(services: oldServices));
    } catch (err) {
      emit(ServicesError());
    }
  }

  void _onAddServices(AddService event, Emitter<ServicesState> emit) {
    List<Service> oldServices = [];
    if (state is ServicesLoaded) {
      oldServices = (state as ServicesLoaded).services;
    }

    emit(ServicesLoading());
    try {
      serviceRepositoryInterface.addService(event.token, event.service);
      oldServices.insert(0, event.service);
      emit(ServicesLoaded(services: oldServices));
    } catch (err) {
      emit(ServicesError());
    }
  }
}
