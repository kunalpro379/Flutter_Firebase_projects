import 'package:TurboFlashMeet/resources/auth_methods.dart';
import 'package:TurboFlashMeet/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Start/Join the Flash Meet!',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Image(image: AssetImage("assets/onboarding.jpg")),
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          CustumButton(
            text: "Sign In",
            onPressed: () async {
              String email = _emailController.text.trim();
              String password = _passwordController.text.trim();

              bool res = await _authMethods.signInWithEmailPassword(
                context,
                email,
                password,
              );

              if (res) {
                // User signed in successfully
              } else {
                // Sign-in failed, handle the error
              }
            },
          ),
        ],
      ),
    );
  }
}
