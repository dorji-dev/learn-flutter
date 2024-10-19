import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:twitter_clone/app/app.locator.dart';
import 'package:twitter_clone/app/app.router.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final users = {
    'dribbble@gmail.com': '12345',
    'hunter@gmail.com': 'hunter',
  };
  Duration get loginTime => const Duration(milliseconds: 2250);

  void navigateToRegisterPage() {
    _navigationService.navigateToRegisterView();
  }

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
