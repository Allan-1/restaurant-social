import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Authenticate {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbref = FirebaseDatabase.instance.ref().child('Users');

  void registerToDb(email, password, username, ctx) {
    firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((result) {
      dbref.child(result.user!.uid).set({
        'email': email,
        'password': password,
        'username': username,
      }).then((res) {
        Navigator.popAndPushNamed(ctx, '/home');
      });
    }).catchError((err) {
      errormessage(err, ctx);
    });
  }

  void logintoDb(email, password, ctx) {
    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((result) {
      Navigator.popAndPushNamed(ctx, '/home');
    }).catchError((err) {
      errormessage(err, ctx);
    });
  }

  void errormessage(err, ctx) {
    showDialog(
        context: ctx,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(err.message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }
}
