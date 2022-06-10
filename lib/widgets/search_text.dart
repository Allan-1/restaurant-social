import 'package:flutter/material.dart';

class SearchText extends StatefulWidget {
  const SearchText({Key? key}) : super(key: key);

  @override
  State<SearchText> createState() => _SearchTextState();
}

class _SearchTextState extends State<SearchText> {
  final TextEditingController _searchText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: TextField(
        controller: _searchText,
        decoration: const InputDecoration(
          hintText: 'Search a place',
          hintStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        onSubmitted: (_) {},
      ),
    );
  }
}
