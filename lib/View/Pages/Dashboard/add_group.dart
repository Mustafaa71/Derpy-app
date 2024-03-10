import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/Constants/text_style_manager.dart';
import 'package:flutter/material.dart';

class AddGroup extends StatefulWidget {
  const AddGroup({super.key});

  @override
  _AddGroupState createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  String selectedItem = 'Football';
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
        color: ColorManager.kBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(
            'Create Group',
            style: TextStyleManager(kColor: Colors.white, kFontSize: 15.0, kFontWeight: FontWeight.bold),
          ),
          const Divider(color: Colors.blueAccent),
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 130, maxHeight: 130),
              margin: const EdgeInsets.all(20.0),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF272A36),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.camera,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(height: 6.0),
                        Text(
                          'Add photo',
                          style: TextStyleManager(
                            kColor: const Color(0xFF797B83),
                            kFontSize: 20.0,
                            kFontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration:
                const BoxDecoration(color: Color(0xFF272A36), borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: const Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Group Title (required)',
                    prefixIcon: Icon(
                      Icons.border_color,
                      color: Colors.blueAccent,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                Divider(),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Group Description (required)',
                    prefixIcon: Icon(
                      Icons.document_scanner,
                      color: Colors.blueAccent,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                Divider(),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Group Location (required)',
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.blueAccent,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Category',
              style: TextStyleManager(kColor: Colors.white, kFontSize: 15.0, kFontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: const BoxDecoration(
              color: Color(0xFF272A36),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            width: double.infinity,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                items: <String>['Football', 'Padel', 'Chess', 'Diving']
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(value: value, child: Text(value)),
                    )
                    .toList(),
                value: selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedItem = newValue!;
                  });
                },
                icon: const Icon(Icons.arrow_downward),
              ),
            ),
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
