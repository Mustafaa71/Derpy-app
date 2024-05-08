import 'package:derpy/Constants/color_manager.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: TextStyle(color: Colors.white),
          autofocus: true,
          cursorColor: Colors.white,
        ),
        backgroundColor: ColorManager.kBackgroundColor,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Search people',
        onPressed: () => print('object'),
        child: const Icon(Icons.search),
      ),
    );
  }
}
