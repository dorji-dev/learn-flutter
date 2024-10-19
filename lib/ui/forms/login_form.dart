import 'package:flutter/material.dart';
import 'package:twitter_clone/ui/widgets/button.dart'; // Update with your actual path to the ViewModel

class LoginForm extends StatefulWidget {
  final Function onLogin; // Callback for login action
  final bool isLoading; // Indicates if the form is in loading state

  const LoginForm({
    super.key,
    required this.onLogin,
    required this.isLoading,
  });

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  final _loginFormKey = GlobalKey<FormState>();
  final _emailFieldKey = GlobalKey<FormFieldState<String>>();
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          // Email Field
          TextFormField(
            key: _emailFieldKey,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Required';
              } else if (!emailRegex.hasMatch(value)) {
                return 'Invalid email format';
              }
              return null;
            },
            onChanged: (value) => _emailFieldKey.currentState!.validate(),
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 20),

          // Password Field
          TextFormField(
            key: _passwordFieldKey,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Required';
              } else if (value.length < 6) {
                return 'Min 6 characters';
              }
              return null;
            },
            onChanged: (value) => _passwordFieldKey.currentState!.validate(),
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
          ),

          // Forgot Password Button
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // Add forgot password functionality here
              },
              child: const Text("Forgot Password?"),
            ),
          ),
          const SizedBox(height: 20),

          // Login Button
          XButton(
            label: 'Login',
            onPressed: () async {
              if (_loginFormKey.currentState!.validate()) {
                await widget
                    .onLogin(); // Call the login function passed from the parent
              }
            },
            isLoading: widget.isLoading,
          ),
        ],
      ),
    );
  }
}
