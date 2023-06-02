import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trad_doctors_new/infrustructure/repository/user_repository.dart';

import 'package:trad_doctors_new/domain/user_dto.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepositoryInterface userRepositoryInterface;
  UserBloc(this.userRepositoryInterface) : super(UserLoading()) {
    on<LoadUser>(_loadUser);
    on<UserEdit>(_userEdit);
  }

  void _loadUser(LoadUser event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      // fetch the list of doctors from the repository
      final user = await userRepositoryInterface.getUser('');
      emit(UserLoaded(user));
    } catch (error) {
      emit(UserLoadingFalilur());
    }
  }

  void _userEdit(UserEdit event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      // post the list of doctors from the repository
      final editSuccess = await userRepositoryInterface.editUser('', '');
      if (editSuccess) {
        emit(UserEditSuccess());
      }
    } catch (error) {
      emit(UserLoadingFalilur());
    }
  }
}
