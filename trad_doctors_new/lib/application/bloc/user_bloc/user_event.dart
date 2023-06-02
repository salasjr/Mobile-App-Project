part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {
  final User user;

  const LoadUser(
      {this.user = const User(
          id: 0,
          fullname: '',
          phoneNumber: '',
          profilePicture: '',
          businessName: '',
          businessId: '',
          address: '',
          verified: 0,
          role: '',
          token: '',
          rating: 0,
          ratingCount: 0,
          answer: '',
          question: '')});

  @override
  List<Object> get props => [user];
}

class UserEdit extends UserEvent {
  final User user;
  const UserEdit({required this.user});

  @override
  List<Object> get props => [user];
}
