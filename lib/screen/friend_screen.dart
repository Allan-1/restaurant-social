import 'package:flutter/material.dart';

class FriendScreen extends StatelessWidget {
  const FriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Ooops !!! You have no friends yet'),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){}, 
          label: const Text('Add Friends'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
