import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trad_doctors_new/domain/doctor_dto.dart';
import 'package:trad_doctors_new/domain/user_dto.dart';
import 'package:trad_doctors_new/infrustructure/repository/doctor_repository.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DoctorRepositoryInterface doctorRepositoryInterface;

  HomeBloc(this.doctorRepositoryInterface) : super(HomeLoading()) {
    on<LoadHome>(_onLoadHome);
    on<DoctorClicked>(_onDoctorClicked);
  }

  void _onLoadHome(LoadHome event, Emitter<HomeState> emit) async {
    if (state is HomeLoaded) return;
    emit(HomeLoading());
    try {
      final List<Doctor> doctors =
          await doctorRepositoryInterface.getDoctors(event.user.token);
      emit(HomeLoaded(doctors));
    } catch (error) {
      emit(HomeLoadingFalilur());
    }
  }

  void _onDoctorClicked(DoctorClicked event, Emitter<HomeState> emit) {}
}


 // emit(HomeLoaded([
      //   Doctor(
      //     id: 0,
      //     fullname: 'fullname',
      //     phoneNumber: 'phoneNumber',
      //     profilePicture:
      //         'https://th.bing.com/th/id/R.f030e7660f7eab9064c9371f38062c6f?rik=kSan7EQy5Z4Ang&pid=ImgRaw&r=0',
      //     businessName: 'businessName',
      //     businessId: 'businessId',
      //     address: 'address',
      //     token: 'token',
      //     role: 'role',
      //     verified: 0,
      //     rating: 0,
      //     ratingCount: 0,
      //   )
      // ]));