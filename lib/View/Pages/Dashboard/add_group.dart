import 'package:derpy/Constants/text_style_manager.dart';
import 'package:flutter/material.dart';

class AddGroup extends StatelessWidget {
  const AddGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.abc),
              ),
              Text(
                'Create Group',
                style: TextStyleManager(kColor: Colors.white, kFontSize: 15.0, kFontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
