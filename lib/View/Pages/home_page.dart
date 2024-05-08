import 'dart:developer';

import 'package:derpy/Components/buttons/filter_button.dart';
import 'package:derpy/Components/reusable_card.dart';
import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/Constants/text_style_manager.dart';
import 'package:derpy/Controller/Auth/auth_controller.dart';
import 'package:derpy/Controller/group_controller.dart';
import 'package:derpy/View/Pages/group_content.dart';
import 'package:derpy/View/Pages/join_group_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMM d, yyyy').format(now).toUpperCase();
    final authController = ref.watch(AuthController.authControllerProvider.notifier);
    final getName = authController.getName();
    final userNameShortCut = getName.isNotEmpty ? getName[0].toUpperCase() : 'D';
    final userName = getName.isNotEmpty ? getName : 'In Derpy';
    final supabase = Supabase.instance.client;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
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
                          style: TextStyleManager(kColor: Colors.white, kFontSize: 15.0, kFontWeight: FontWeight.bold),
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
                    onTap: () {
                      log('');
                    },
                  ),
                  FilterButton(
                    title: 'Groups',
                    onTap: () {
                      log('');
                    },
                  ),
                  FilterButton(
                    title: 'Events',
                    onTap: () {
                      log('');
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final groupListAsyncValue = ref.watch(GroupController.groupControllerProvider);
                  return groupListAsyncValue.when(
                    data: (groupList) {
                      if (groupList.isEmpty) {
                        return const Center(
                          child: Icon(
                            Icons.emergency,
                            size: 50,
                            color: Colors.blueAccent,
                          ),
                        );
                      }
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final data = groupList[index];
                          final hh = supabase.storage.from('Gg').getPublicUrl(data.groupImage);
                          return ReusableCard(
                            imagePath: hh,
                            title: data.name,
                            description: data.description,
                            visibilty: data.category,
                            groupOrEvent: 'Group',
                            numberOfMember: '10',
                            onTap: () {
                              if (supabase.auth.currentUser != null) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => JoinGroupPage(
                                      groupAvatar: hh,
                                      groupName: data.name,
                                      groupDescription: data.description,
                                      groupLocation: data.location,
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => GroupContent(
                                              groupName: data.name,
                                              groupImage: hh,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('User is not registered'),
                                      content: const Text('Please register to view our content'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.of(context).pop(),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                          );
                        },
                        itemCount: groupList.length,
                      );
                    },
                    loading: () => const Center(child: CircularProgressIndicator.adaptive()),
                    error: (error, stack) => Text('Error: $error'),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
      backgroundColor: ColorManager.kBackgroundColor,
    );
  }
}
