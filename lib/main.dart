import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restaurantsocial/screen/homepage.dart';
import 'package:restaurantsocial/screen/splash_screen.dart';
import 'package:restaurantsocial/widgets/login.dart';
import 'package:restaurantsocial/widgets/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meetia',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const SplashScreens(),
      routes: {
        '/home': (context) => const Homepage(),
        '/login': (context) => const EmailLogin(),
        '/signup': (context) => const EmailSignUp(),
      },
    );
  }
}
