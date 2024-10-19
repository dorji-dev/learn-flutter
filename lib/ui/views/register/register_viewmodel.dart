import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:twitter_clone/app/app.locator.dart';
import 'package:twitter_clone/app/app.router.dart';

class RegisterViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToLoginPage() {
    _navigationService.navigateToLoginView();
  }
}
