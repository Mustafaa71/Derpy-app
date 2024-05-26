import 'package:derpy/Components/register_dashboard.dart';
import 'package:derpy/Constants/text_style_manager.dart';
import 'package:flutter/material.dart';

class RegisterNotify extends StatelessWidget {
  const RegisterNotify({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.admin_panel_settings,
          size: 80.0,
          color: Colors.redAccent,
        ),
        Text(
          'Register to Access Derpy Features',
          style: TextStyleManager(
            kColor: Colors.redAccent,
            kFontSize: 30.0,
            kFontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12.0),
        ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const RegisterDashboard();
                  });
            },
            style: const ButtonStyle(),
            child: Text(
              'Join Us',
              style: TextStyleManager(kColor: Colors.blueAccent, kFontSize: 25.0, kFontWeight: FontWeight.normal),
            ))
      ],
    );
  }
}
