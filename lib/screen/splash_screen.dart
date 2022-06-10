import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurantsocial/screen/homepage.dart';
import 'package:restaurantsocial/screen/signup_screen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  Widget build(BuildContext context) {
    User? result = FirebaseAuth.instance.currentUser;

    return SplashScreen(
      seconds: 15,
      navigateAfterSeconds:
          result != null ? const Homepage() : const SignupScreen(),
      image: Image.asset('assets/meetialogo.png', fit: BoxFit.scaleDown),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: const TextStyle(),
      photoSize: 100,
      loaderColor: Colors.deepOrange,
    );
  }
}
