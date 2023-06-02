part of 'login_cubit.dart';

enum LoginStatus { initial, submitting, success, error }

class LoginState extends Equatable {
  final String phoneNumber;
  final String password;
  final LoginStatus status;
  final User user;
  final String error;

  const LoginState({
    required this.error,
    required this.phoneNumber,
    required this.password,
    required this.status,
    this.user = User.empty,
  });

  factory LoginState.initial() {
    return const LoginState(
      error: '',
      phoneNumber: '',
      password: '',
      status: LoginStatus.initial,
    );
  }

  LoginState copyWith({
    String? phoneNumber,
    String? password,
    LoginStatus? status,
    User? user,
    String? error,
  }) {
    return LoginState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      status: status ?? this.status,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [phoneNumber, password, status];
}
