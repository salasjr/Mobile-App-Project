part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final User user;

  const UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class UserEditSuccess extends UserState {}

class UserLoadingFalilur extends UserState {}
