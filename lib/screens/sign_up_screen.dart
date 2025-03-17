import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:unify/widgets/custom_button.dart';
import 'package:unify/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                labelText: 'Password',
                hintText: 'Password',
                controller: _passwordController),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                labelText: 'Confirm Password',
                hintText: 'Confirm Password',
                controller: _confirmPasswordController),
            const SizedBox(
              height: 20,
            ),
            CustomButtomRectangle(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                text: 'Sign Up'),
            const SizedBox(height: 10),
            Text.rich(TextSpan(
                text: 'You have an account ? ',
                style: const TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(
                      text: 'Login',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacementNamed(context, '/');
                        })
                ]))
          ],
        ),
      ),
    ));
  }
}
