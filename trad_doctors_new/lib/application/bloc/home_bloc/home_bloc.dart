import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/user_dto.dart';
import '../../../infrustructure/repository/doctor_repository.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DoctorRepositoryInterface doctorRepositoryInterface;

  HomeBloc(this.doctorRepositoryInterface) : super(HomeLoading()) {
    on<LoadHome>(_onLoadHome);
    on<DoctorClicked>(_onDoctorClicked);
  }

  void _onLoadHome(LoadHome event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      // fetch the list of doctors from the repository
      final List<User> doctors = await doctorRepositoryInterface.getDoctors();
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
