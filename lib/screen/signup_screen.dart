import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meetia'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Meetia',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.deepOrange),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SignInButton(
                Buttons.Email,
                text: 'Sign up with Email',
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SignInButton(
                Buttons.Google,
                text: 'Sign up with Google',
                onPressed: () {},
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.deepOrange),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    }))
          ],
        ),
      ),
    );
  }
}
