import 'dart:developer';

import 'package:derpy/Components/buttons/log_out_button.dart';
import 'package:derpy/Components/other_setting.dart';
import 'package:derpy/Components/register_dashboard.dart';
import 'package:derpy/Components/settings/user_info.dart';
import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/Constants/text_style_manager.dart';
import 'package:derpy/Controller/Auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(AuthController.authControllerProvider.notifier);
    final isLoading = useState<bool>(false);
    final supabase = Supabase.instance.client;
    final getName = authController.getName() ?? 'Derpy';
    final shortCut = (getName.isNotEmpty ? getName.characters.first.toUpperCase() : 'D');
    final getUserName = authController.getUserName();
    final userName = getUserName!.isNotEmpty ? getUserName : 'Derpy';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Info', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
        elevation: 0.0,
        backgroundColor: ColorManager.kBackgroundColor,
      ),
      body: isLoading.value == true
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  UserInfo(
                    userLetterShortCut: shortCut,
                    name: getName,
                    userName: userName,
                  ),
                  const SizedBox(height: 35.0),
                  supabase.auth.currentUser == null
                      ? Expanded(
                          child: Column(
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
                                    style: TextStyleManager(
                                        kColor: Colors.blueAccent, kFontSize: 25.0, kFontWeight: FontWeight.normal),
                                  ))
                            ],
                          ),
                        )
                      : buildAccountSettings(),
                  const Spacer(),
                  supabase.auth.currentUser == null
                      ? const SizedBox.shrink()
                      : buildLogoutSection(ref, context, isLoading),
                ],
              ),
            ),
    );
  }

  void ggOut(ValueNotifier<bool> isLoading, BuildContext context, WidgetRef ref) async {
    isLoading.value = true;
    const webClientId = '497698355565-41mnh8g4j4sr72bj8a6v41hv5lsfbiaf.apps.googleusercontent.com';

    const iosClientId = '497698355565-4prgkkbvra2ndgjga1n7353dqi2jji7b.apps.googleusercontent.com';

    try {
      final authController = ref.read(AuthController.authControllerProvider.notifier);
      await authController.signOut();
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: iosClientId,
        serverClientId: webClientId,
      );
      googleSignIn.signOut();
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to sign out: ${e.toString()}')));
    } finally {
      isLoading.value = false;
    }
  }

  Widget buildLogoutSection(WidgetRef ref, BuildContext context, ValueNotifier<bool> isLoading) {
    if (isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        const LogoutButton(
          title: 'Delete Account',
          buttonColor: Color.fromARGB(104, 255, 201, 66),
          borderColor: Color(0xFFF9D949),
          textButtonColor: Color(0xFFF9D949),
        ),
        InkWell(
          onTap: () => ggOut(isLoading, context, ref),
          child: LogoutButton(
            title: 'Logout',
            buttonColor: const Color(0xFFea3323).withOpacity(0.2),
            borderColor: const Color(0xffea3323),
            textButtonColor: const Color(0xffea3323),
          ),
        ),
      ],
    );
  }

  Widget buildAccountSettings() {
    return const Column(
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
    );
  }
}
