import 'dart:developer';

import 'package:derpy/Components/buttons/filter_button.dart';
import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/Constants/text_style_manager.dart';
import 'package:derpy/Controller/Auth/auth_controller.dart';
import 'package:derpy/View/Pages/non_user_screen.dart';
import 'package:derpy/View/Pages/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum PageCategory { all, groups }

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMM d, yyyy').format(now).toUpperCase();
    final authController = ref.watch(AuthController.authControllerProvider.notifier);
    final String? getName = authController.getName();
    log('getName: $getName');
    final userNameShortCut = getName?.isNotEmpty ?? false ? getName![0].toUpperCase() : 'D';
    final userName = getName?.isNotEmpty ?? false ? getName! : 'In Derpy';
    final supabase = Supabase.instance.client;
    late GoogleSignInAccount googleUseew;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Consumer(
              builder: (context, ref, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          color: const Color(0xFF54585f),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            child: Text(
                              userNameShortCut,
                              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width: 6.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Derpy',
                              style:
                                  TextStyleManager(kColor: Colors.white, kFontSize: 15.0, kFontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Welcome, $userName',
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.notifications,
                      size: 32.0,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 6.0),
            Text(formattedDate),
            const Divider(color: Colors.white),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  FilterButton(
                    title: 'All',
                    onTap: () {},
                  ),
                  FilterButton(
                    title: 'Groups',
                    onTap: () {
                      log('');
                    },
                  ),
                ],
              ),
            ),
            supabase.auth.currentSession != null ? const UserScreen() : const NonUserScreen(),
          ]),
        ),
      ),
      backgroundColor: ColorManager.kBackgroundColor,
    );
  }
}
