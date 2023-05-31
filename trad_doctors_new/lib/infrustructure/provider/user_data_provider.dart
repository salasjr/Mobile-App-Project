import '../../domain/user_dto.dart';
import '../repository/auth_repository.dart';

class UserProvider {
  Future<User> getUser(token) async {
    try {
      // Fetch user data from database
      // http.Response response = await http.get(
      //   Uri.parse('$uri/getUserData'),
      //   headers: <String, String>{
      //     'Content-Type': 'application/json; charset=UTF-8',
      //     'auth-token': token,
      //   },
      // );

      // if (response.statusCode == 200) {
      //   return User.fromJson(response.body);
      // } else {
      //   return User.empty;
      // }

      return const User(
          id: 0,
          address: 'Addis Ababa',
          answer: '',
          businessId: 'xxxx-xxxx-xxxx-xxxx',
          businessName: 'Hakim Salah',
          fullname: 'Betselot Kidane',
          phoneNumber: '949387908',
          profilePicture:
              "https://th.bing.com/th/id/R.f030e7660f7eab9064c9371f38062c6f?rik=kSan7EQy5Z4Ang&pid=ImgRaw&r=0",
          question: '',
          rating: 0,
          ratingCount: 0,
          role: 'Doctor',
          token: '',
          verified: 0);
    } catch (err) {
      // ignore: avoid_print
      print(err.toString());
    }
    return User.empty;
  }

  Future<bool> editUser(userField, token) async {
    // Edit user data in database
    return true;
  }

  Future<User> userAuth() async {
    // Authenticate user

    return const User(
        id: 0,
        address: 'Addis Ababa',
        answer: '',
        businessId: 'xxxx-xxxx-xxxx-xxxx',
        businessName: 'Hakim Salah',
        fullname: 'Betselot Kidane',
        phoneNumber: '949387908',
        profilePicture:
            "https://th.bing.com/th/id/R.f030e7660f7eab9064c9371f38062c6f?rik=kSan7EQy5Z4Ang&pid=ImgRaw&r=0",
        question: '',
        rating: 0,
        ratingCount: 0,
        role: 'doctor',
        token: '',
        verified: 0);
  }
}
