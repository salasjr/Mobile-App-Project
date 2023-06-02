import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trad_doctors_new/domain/models.dart';
import 'package:trad_doctors_new/infrustructure/repository/auth_repository.dart';

import 'package:trad_doctors_new/infrustructure/repository/user_repository.dart';

part 'user_auth_event.dart';
part 'user_auth_state.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  final UserRepositoryInterface userRepositoryInterface;
  UserAuthBloc(this.userRepositoryInterface) : super(AuthLoading()) {
    on<LoadAuth>(_onLoadAuth);
  }

  Future<void> _onLoadAuth(LoadAuth event, Emitter<UserAuthState> emit) async {
    try {
      final User user = await AuthRepository().getCachedUser();
      // ignore: avoid_print
      if (User.empty == user) {
        emit(Unauthenticated());
        return;
      } else {
        emit(Authenticated(user: user));
        return;
      }
    } catch (err) {
      // ignore: avoid_print
      print(err);
    }
  }
}
