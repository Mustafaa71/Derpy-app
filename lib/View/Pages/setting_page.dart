import 'package:derpy/Components/buttons/log_out_button.dart';
import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/Controller/Auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(AuthController.authControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Info', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
        elevation: 0.0,
        backgroundColor: ColorManager.kBackgroundColor,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            /// Setting First Section .....
            AccountSetting(),
            SizedBox(height: 40.0),

            /// Account Setting ....
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Account',
                    style: TextStyle(color: Color(0xFF7e7f81), fontSize: 17.0),
                  ),
                ),
                Divider(thickness: 0.5, color: Color(0xFF7e7f81)),
                OtherSetting(icon: Icons.person_outline, label: 'Edit Personal Details'),
                Divider(thickness: 0.5, color: Color(0xFF7e7f81)),
                OtherSetting(icon: Icons.color_lens_outlined, label: 'Theme'),
                Divider(thickness: 0.5, color: Color(0xFF7e7f81)),
                OtherSetting(icon: Icons.account_balance_wallet_outlined, label: 'Invoice'),
                Divider(thickness: 0.5, color: Color(0xFF7e7f81)),
              ],
            ),
            Spacer(),

            ///Logout Button ....
            LogoutButton(
              title: 'Delete Account',
              buttonColor: Color.fromARGB(160, 255, 204, 75),
              borderColor: Color(0xFFF9D949),
              textButtonColor: Color(0xFFF9D949),
            ),

            LogoutButton(
              title: 'Logout',
              buttonColor: Color.fromARGB(157, 179, 18, 18),
              borderColor: Color.fromARGB(255, 252, 42, 42),
              textButtonColor: Color.fromARGB(255, 252, 42, 42),
            ),
          ],
        ),
      ),
    );
  }
}

class OtherSetting extends StatelessWidget {
  final IconData icon;
  final String label;
  const OtherSetting({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 25.0, color: Colors.white),
        const SizedBox(width: 12.0),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        const Spacer(),
        const Icon(Icons.chevron_right_sharp, size: 35.0, color: Colors.white),
      ],
    );
  }
}

class AccountSetting extends StatelessWidget {
  const AccountSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Row(
        children: [
          Container(
            color: const Color(0xFF54585f),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                'M',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mustafa Yassin',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '@Mustafa71',
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
