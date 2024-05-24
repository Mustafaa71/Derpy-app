import 'package:derpy/Constants/text_style_manager.dart';
import 'package:flutter/material.dart';

class Sponsors extends StatelessWidget {
  const Sponsors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sponsors'),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                child: Container(
                  color: Colors.grey,
                  child: Column(
                    children: [
                      Image.asset('assets/Belle.jpeg'),
                      Text(
                        'Belle Vie',
                        style: TextStyleManager(kColor: Colors.white, kFontSize: 25, kFontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                child: Container(
                  color: Colors.grey,
                  child: Column(
                    children: [
                      Image.asset('assets/sweet.jpeg'),
                      Text(
                        'Candy World',
                        style: TextStyleManager(kColor: Colors.white, kFontSize: 25, kFontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
