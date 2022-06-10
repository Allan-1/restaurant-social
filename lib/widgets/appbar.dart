import 'package:flutter/material.dart';
import 'package:restaurantsocial/widgets/search_text.dart';

class AppBars extends StatefulWidget {
  const AppBars({Key? key}) : super(key: key);

  @override
  State<AppBars> createState() => _AppBarsState();
}

class _AppBarsState extends State<AppBars> {
  bool _isvisible = false;

  void showSearch() {
    setState(() {
      _isvisible = !_isvisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text('Meetia'),
      pinned: true,
      floating: true,
      actions: [
        Visibility(
          child: const SearchText(),
          visible: _isvisible,
        ),
        IconButton(onPressed: showSearch, icon: const Icon(Icons.search)),
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          itemBuilder: (BuildContext ctx) {
            return const [
              PopupMenuItem(
                child: Text('Settings'),
                value: '/setting',
              ),
              PopupMenuItem(
                child: Text('Logout'),
                value: 'logout',
              )
            ];
          },
        ),
      ],
      bottom: const TabBar(
        isScrollable: true,
        tabs: [
          Tab(
            icon: Icon(Icons.location_city),
            text: 'Location',
          ),
          Tab(
            icon: Icon(Icons.person),
            text: 'Friends',
          ),
        ],
      ),
    );
  }
}
