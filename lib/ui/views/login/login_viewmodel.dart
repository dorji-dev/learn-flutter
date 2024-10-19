import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:twitter_clone/app/app.locator.dart';
import 'package:twitter_clone/app/app.router.dart';
import 'package:twitter_clone/app/custom-styles/snackbar_style.dart';
import 'package:twitter_clone/app/keys/global_keys.dart';
import 'package:twitter_clone/services/authentication_service.dart';

class LoginViewModel extends BaseViewModel {
  bool formSubmitting = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();

  void navigateToRegisterPage() {
    _navigationService.navigateToRegisterView();
  }

  Future<void> login() async {
    formSubmitting = true;
    notifyListeners();
    String? error = await _authService.loginWithEmailAndPassword(
        emailController.text, passwordController.text);
    if (error != null) {
      scaffoldMessengerKey.currentState?.showSnackBar(snackBarStyles(
          text:
              "Couldn't login. Make sure your email and password is correct"));
    } else {
      _navigationService.navigateToHomeView();
    }
    formSubmitting = false;
    notifyListeners();
  }
}
