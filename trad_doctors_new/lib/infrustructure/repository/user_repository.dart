import 'package:trad_doctors_new/infrustructure/provider/user_data_provider.dart';
import 'package:trad_doctors_new/infrustructure/repository/auth_repository.dart';
import 'package:trad_doctors_new/domain/user_dto.dart';

abstract class UserRepositoryInterface {
  Future<User> getUser(token);
  Future<bool> editUser(userField, token);
  Future<User> userAuth();
}

class UserRepositoryImp implements UserRepositoryInterface {
  UserProvider userProvider = UserProvider();
  @override
  Future<User> getUser(token) async {
    return await userProvider.getUser(token);
  }

  @override
  Future<bool> editUser(userField, token) {
    return userProvider.editUser(userField, token);
  }

  @override
  Future<User> userAuth() async {
    // User user = await UserDB().getCachedUser();
    User user = await AuthRepository().getCachedUser();
    return user;
  }
}
