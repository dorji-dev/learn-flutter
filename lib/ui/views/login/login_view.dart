import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:twitter_clone/ui/forms/login_form.dart';
// ignore: unused_import
import 'package:twitter_clone/ui/widgets/button.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 40),
                // Email Field
                LoginForm(
                    onLogin: viewModel.login,
                    isLoading: viewModel.formSubmitting),
                const SizedBox(height: 30),
                // Divider with "or" text
                const Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("or"),
                    ),
                    Expanded(
                      child: Divider(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Don't have an account?",
                ),
                // Sign-up Button
                TextButton(
                  onPressed: viewModel.navigateToRegisterPage,
                  child: const Text('Sign Up'),
                ),

                const SizedBox(height: 10),

                // Social Media Login Buttons (Placeholder)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
