part of 'login_cubit.dart';

enum LoginStatus { initial, submitting, success, error }

class LoginState extends Equatable {
  final String phoneNumber;
  final String password;
  final LoginStatus status;

  const LoginState({
    required this.phoneNumber,
    required this.password,
    required this.status,
  });

  factory LoginState.initial() {
    return const LoginState(
      phoneNumber: '',
      password: '',
      status: LoginStatus.initial,
    );
  }

  LoginState copyWith({
    String? phoneNumber,
    String? password,
    LoginStatus? status,
  }) {
    return LoginState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [phoneNumber, password, status];
}
