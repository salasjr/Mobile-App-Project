import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../infrustructure/repository/auth_repository.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginState.initial());

  void phoneNumberChanged(String value) {
    emit(
      state.copyWith(
        phoneNumber: value,
        status: LoginStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(
        password: value,
        status: LoginStatus.initial,
      ),
    );
  }

  Future<void> logInWithCredentials() async {
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      await _authRepository.logInWithPhoneAndPassword(
        phoneNumber: state.phoneNumber,
        password: state.password,
      );
      emit(state.copyWith(status: LoginStatus.success));
    } catch (_) {}
  }
}
