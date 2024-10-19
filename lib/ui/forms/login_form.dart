import 'package:flutter/material.dart';
import 'package:twitter_clone/ui/widgets/button.dart'; // Update with your actual path to the ViewModel

class LoginForm extends StatefulWidget {
  final Function onLogin; // Callback for login action
  final bool isLoading; // Indicates if the form is in loading state
  final _loginFormKey = GlobalKey<FormState>();

  LoginForm({
    super.key,
    required this.onLogin,
    required this.isLoading,
  });

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._loginFormKey,
      child: Column(
        children: [
          // Email Field
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Required';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 20),

          // Password Field
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Required';
              }
              return null;
            },
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
              if (widget._loginFormKey.currentState!.validate()) {
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
