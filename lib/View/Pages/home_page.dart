import 'dart:developer';

import 'package:derpy/Components/buttons/filter_button.dart';
import 'package:derpy/Components/reusable_card.dart';
import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/Controller/Auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime now = DateTime.now();

    String formattedDate = DateFormat('MMM d, yyyy').format(now).toUpperCase();
    final authController = ref.read(AuthController.authControllerProvider.notifier);
    authController.userStateListiner();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 30.0, right: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                      const SizedBox(width: 6.0),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Derpy',
                            // style: TextStyleManager.primaryTextStyle,
                          ),
                          Text('Welcome, Mustafa'),
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
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ReusableCard(
                      imagePath: 'cc',
                      title: 'Cross-Fit Gg',
                      description:
                          "If you're looking for a single word to succinctly convey the option of making information public or private, you could use the term ",
                      visibilty: 'Public',
                      groupOrEvent: 'Group',
                      onTap: () {
                        log('message');
                      },
                    );
                  },
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: ColorManager.kBackgroundColor,
    );
  }
}
