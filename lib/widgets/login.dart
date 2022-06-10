import 'package:flutter/material.dart';

import '../functions/authenticate.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({Key? key}) : super(key: key);

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meetia Login')),
      body: Center(
        child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Meetia Login',
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
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
                          return 'Enter email address';
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
                    child: ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            Authenticate().logintoDb(emailcontroller.text,
                                passwordcontroller.text, context);
                          }
                        }),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
