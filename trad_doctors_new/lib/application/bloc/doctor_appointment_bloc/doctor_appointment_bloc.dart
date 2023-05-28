import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/appointemt_dto.dart';

part 'doctor_appointment_event.dart';
part 'doctor_appointment_state.dart';

class DoctorAppointmentBloc
    extends Bloc<DoctorAppointmentEvent, DoctorAppointmentState> {
  DoctorAppointmentBloc() : super(DoctorAppointmentLoading()) {
    on<CreateAppointement>(_onCreateAppointement);
    on<LoadDoctorPendingAppointment>(_onLoadDoctorPendingAppointment);
    on<LoadDoctorAcceptedAppointment>(_onLoadDoctorAcceptedAppointment);
    on<LoadDoctorRejectedAppointment>(_onLoadDoctorRejectedAppointment);
    on<LoadDoctorCompletedAppointment>(_onLoadDoctorCompletedAppointment);

    on<UpdateDoctorAppointment>(_onUpdateDoctorAppointment);
    on<DeleteDoctorAppointment>(_onDeleteDoctorAppointment);
  }

  void _onCreateAppointement(
      CreateAppointement event, Emitter<DoctorAppointmentState> emit) {}

  void _onLoadDoctorPendingAppointment(LoadDoctorPendingAppointment event,
      Emitter<DoctorAppointmentState> emit) {}

  void _onLoadDoctorAcceptedAppointment(LoadDoctorAcceptedAppointment event,
      Emitter<DoctorAppointmentState> emit) {}

  void _onLoadDoctorCompletedAppointment(LoadDoctorCompletedAppointment event,
      Emitter<DoctorAppointmentState> emit) {}

  void _onLoadDoctorRejectedAppointment(LoadDoctorRejectedAppointment event,
      Emitter<DoctorAppointmentState> emit) {}

  void _onUpdateDoctorAppointment(
      UpdateDoctorAppointment event, Emitter<DoctorAppointmentState> emit) {}

  void _onDeleteDoctorAppointment(
      DeleteDoctorAppointment event, Emitter<DoctorAppointmentState> emit) {}
}
