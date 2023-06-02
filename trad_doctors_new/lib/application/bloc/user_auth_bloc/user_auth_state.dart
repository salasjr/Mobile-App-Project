part of 'user_auth_bloc.dart';

abstract class UserAuthState extends Equatable {
  const UserAuthState();

  @override
  List<Object> get props => [];
}

class UserAuthInitial extends UserAuthState {}

class AuthLoading extends UserAuthState {}

class Authenticated extends UserAuthState {
  final User user;

  Authenticated({required this.user});
}


class Unauthenticated extends UserAuthState{
  
}