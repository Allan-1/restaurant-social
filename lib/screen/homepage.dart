import 'package:flutter/material.dart';
import 'package:restaurantsocial/screen/friend_screen.dart';

//screen import
import 'package:restaurantsocial/screen/map_screen.dart';
import 'package:restaurantsocial/widgets/appbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    Key? key,
  }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxScrollable) {
                return <Widget>[
                  const AppBars(),
                ];
              },
              body: const TabBarView(
                children: [
                  MapScreen(),
                  FriendScreen(),
                ],
              )),
        ));
  }
}
