import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  void _login() => {
        setState(() {
          _isLoading = true;
          _errorMessage = '';
        }),
        Future.delayed(
            const Duration(seconds: 2),
            () => {
                  setState(() {
                    _isLoading = false;
                    if (_emailController.text == 'user@gmail.com' &&
                        _passwordController.text == '123') {
                      Navigator.pushReplacementNamed(context, '/home');
                    } else {
                      _errorMessage = 'Invalid email or password !';
                    }
                  })
                })
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Image.asset(
                  'assets/images/unify_1.png', // Your image path
                  width: 200,
                  height: 200,
                ),
              ),
              CustomTextField(
                  labelText: 'Email',
                  hintText: 'Email',
                  controller: _emailController),
              const SizedBox(height: 20),
              CustomTextField(
                  labelText: 'Password',
                  hintText: 'Password',
                  obscureText: true,
                  controller: _passwordController),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : CustomButtomRectangle(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      text: 'Login'),
              const SizedBox(height: 10),
              const Text.rich(TextSpan(
                  text: "You don't have an account yet? ",
                  style: TextStyle(fontSize: 16),
                  children: [
                    TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent))
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
