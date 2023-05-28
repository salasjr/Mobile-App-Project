import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../infrustructure/repository/auth_repository.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository _authRepository;

  SignupCubit(this._authRepository) : super(SignupState.initial());

  void phoneNumberChanged(String value) {
    emit(
      state.copyWith(
        phoneNumber: value,
        status: SignupStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(
        password: value,
        status: SignupStatus.initial,
      ),
    );
  }

  void questionChanged(String value) {
    emit(
      state.copyWith(
        question: value,
        status: SignupStatus.initial,
      ),
    );
  }

  void answerChanged(String value) {
    emit(
      state.copyWith(
        answer: value,
        status: SignupStatus.initial,
      ),
    );
  }

  void businessNameChanged(String value) {
    emit(
      state.copyWith(
        businessName: value,
        status: SignupStatus.initial,
      ),
    );
  }

  void businessIdChanged(String value) {
    emit(
      state.copyWith(
        businessId: value,
        status: SignupStatus.initial,
      ),
    );
  }

  void addressChanged(String value) {
    emit(
      state.copyWith(
        address: value,
        status: SignupStatus.initial,
      ),
    );
  }

  void fullNameChanged(String value) {
    emit(
      state.copyWith(
        fullName: value,
        status: SignupStatus.initial,
      ),
    );
  }

  void roleChanged(String value) {
    emit(
      state.copyWith(
        role: value,
        status: SignupStatus.initial,
      ),
    );
  }

//! type for photo profilePicture
  void onProfileChange(File image) {
    emit(
      state.copyWith(
        profilePicture: image,
        status: SignupStatus.initial,
      ),
    );
  }

  Future<void> signupFormSubmitted() async {
    if (state.status == SignupStatus.submitting) return;
    emit(state.copyWith(status: SignupStatus.submitting));
    try {
      await _authRepository.signup(
        phoneNumber: state.phoneNumber,
        password: state.password,
        question: state.question,
        answer: state.answer,
        fullName: state.fullName,
        profilePicture: state.profilePicture,
        businessName: state.businessName,
        businessId: state.businessId,
        address: state.address,
        role: state.role,
      );
      emit(state.copyWith(status: SignupStatus.success));
    } catch (_) {}
  }
}
