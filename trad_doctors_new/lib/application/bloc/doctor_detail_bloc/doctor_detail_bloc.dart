import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/appointemt_dto.dart';
import '../../../domain/doctor_dto.dart';
import '../../../domain/service_dto.dart';
import '../../../domain/user_dto.dart';
import '../../../infrustructure/repository/service_repository.dart';

part 'doctor_detail_event.dart';
part 'doctor_detail_state.dart';

class DoctorDetailBloc extends Bloc<DoctorDetailBlocEvent, DoctorDetailState> {
  final ServiceRepositoryInterface serviceRepositoryInterface;
  DoctorDetailBloc(this.serviceRepositoryInterface)
      : super(DoctorDetailLoading()) {
    on<LoadService>(_onLoadService);
    on<AppointmentClicked>(_onAppointmentClicked);
  }

  _onLoadService(LoadService event, Emitter<DoctorDetailState> emit) async {
    emit(DoctorDetailLoading());
    try {
      List<Service> services =
          await serviceRepositoryInterface.getServiceByID(event.doctor.id);
      emit(DoctorDetialLoaded(services: services));
      // fetch the list of services from the repository
    } catch (error) {
      emit(DoctorDetialError());
    }
  }

  _onAppointmentClicked(
      AppointmentClicked event, Emitter<DoctorDetailState> emit) {}
}
