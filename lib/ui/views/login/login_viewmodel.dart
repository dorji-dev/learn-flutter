import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final users = {
    'dribbble@gmail.com': '12345',
    'hunter@gmail.com': 'hunter',
  };
  Duration get loginTime => const Duration(milliseconds: 2250);
  Future<String?> authUser(data) {
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> signUpUser(data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }
}
