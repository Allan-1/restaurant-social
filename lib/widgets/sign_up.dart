import 'package:flutter/material.dart';
import 'package:restaurantsocial/functions/authenticate.dart';

class EmailSignUp extends StatefulWidget {
  const EmailSignUp({Key? key}) : super(key: key);

  @override
  State<EmailSignUp> createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUp> {
  final _formKey = GlobalKey<FormState>();
  // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // DatabaseReference dbref = FirebaseDatabase.instance.ref().child('Users');
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController passwordconfcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meetia Signup')),
      body: Center(
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Meetia Signup',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: usernamecontroller,
                    decoration: const InputDecoration(
                        labelText: 'Enter username',
                        labelStyle: TextStyle(color: Colors.deepOrange)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter username';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: emailcontroller,
                    decoration: const InputDecoration(
                        labelText: 'Enter Email Adress',
                        labelStyle: TextStyle(color: Colors.deepOrange)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter EmailAdress';
                      } else if (!value.contains('@')) {
                        return 'Enter valid email';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: passwordcontroller,
                    decoration: const InputDecoration(
                        labelText: 'Enter password',
                        labelStyle: TextStyle(color: Colors.deepOrange)),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Password';
                      } else if (value.length < 9) {
                        return 'Password too short';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: passwordconfcontroller,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Confirm password',
                      labelStyle: TextStyle(color: Colors.deepOrange),
                    ),
                    validator: (value) {
                      if (value != passwordcontroller.text) {
                        return 'Password do not match';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                      child: const Text('Signup'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Authenticate().registerToDb(
                              emailcontroller.text,
                              passwordconfcontroller.text,
                              usernamecontroller.text,
                              context);
                        }
                      }),
                )
              ]),
            )),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    usernamecontroller.dispose();
    passwordconfcontroller.dispose();
    passwordcontroller.dispose();
    emailcontroller.dispose();
  }
}
