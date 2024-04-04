import 'dart:developer';

import 'package:derpy/Components/buttons/filter_button.dart';
import 'package:derpy/Components/reusable_card.dart';
import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/Constants/text_style_manager.dart';
import 'package:derpy/Controller/Auth/auth_controller.dart';
import 'package:derpy/Model/group.dart';
import 'package:derpy/View/Pages/group_content_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime now = DateTime.now();
    final supabase = Supabase.instance.client;
    String formattedDate = DateFormat('MMM d, yyyy').format(now).toUpperCase();
    final authController = ref.read(AuthController.authControllerProvider.notifier);
    authController.userStateListiner();

    var dataList = useState<List<Group>>([]);

    Future<void> fetchData() async {
      final response = await supabase.from('group').select(); // Fetch data from Supabase
      if (response == null && response != null) {
        dataList.value = response!.map((e) => Group.fromJson(e)).toList();
      } else {
        print('Error fetching data: ${response}');
      }
    }

    useEffect(() {
      fetchData();
      return null;
    }, []);

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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Derpy',
                            style:
                                TextStyleManager(kColor: Colors.white, kFontSize: 15.0, kFontWeight: FontWeight.bold),
                          ),
                          const Text('Welcome, Mustafa'),
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
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final data = dataList.value[index];
                    return ReusableCard(
                      imagePath: data.groupImage,
                      title: data.name,
                      description: data.description,
                      visibilty: 'false',
                      groupOrEvent: 'Group',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const GroupContentPage(),
                          ),
                        );
                      },
                    );
                  },
                  itemCount: dataList.value.length,
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
