import 'package:derpy/Components/buttons/reusable_button.dart';
import 'package:derpy/Constants/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JoinGroupPage extends HookConsumerWidget {
  const JoinGroupPage({
    required this.groupAvatar,
    required this.groupName,
    required this.groupDescription,
    required this.groupLocation,
    required this.buttonTitle,
    required this.buttonBackgroundcolor,
    required this.borderColor,
    required this.textColor,
    required this.onTap,
    super.key,
  });

  final String groupAvatar;
  final String groupName;
  final String groupDescription;
  final String groupLocation;
  final VoidCallback onTap;

  final String buttonTitle;
  final Color textColor;
  final Color buttonBackgroundcolor;
  final Color borderColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.network(
              groupAvatar,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: Color(0xFF3c3e47),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      groupName,
                      style: TextStyleManager(kColor: Colors.white, kFontSize: 25.0, kFontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: Color(0xFF3c3e47),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      groupDescription,
                      style: TextStyleManager(kColor: Colors.white, kFontSize: 25.0, kFontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on),
                          Text(
                            groupLocation,
                            style:
                                TextStyleManager(kColor: Colors.white, kFontSize: 20.0, kFontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.people),
                          Text(
                            '10',
                            style:
                                TextStyleManager(kColor: Colors.white, kFontSize: 20.0, kFontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: ReusableButton(
                label: buttonTitle,
                textColor: textColor,
                backgroundcolor: buttonBackgroundcolor,
                onClick: onTap,
                borderColor: borderColor),
          ),
        ],
      ),
    );
  }
}
