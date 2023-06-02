part of 'user_auth_bloc.dart';

abstract class UserAuthEvent extends Equatable {
  const UserAuthEvent();

  @override
  List<Object> get props => [];
}



class LoadAuth extends UserAuthEvent{
}

