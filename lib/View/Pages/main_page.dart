import 'package:derpy/Components/nav_bar.dart';
import 'package:derpy/Components/nav_bar_item.dart';
import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/View/Pages/Dashboard/dashboard.dart';
import 'package:derpy/View/Pages/home_page.dart';
import 'package:derpy/View/Pages/search_page.dart';
import 'package:derpy/View/Pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainPage extends HookWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageIndex = useState(0);

    const pages = [
      HomePage(),
      SearchPage(),
      Dashboard(),
      SettingPage(),
    ];

    return Scaffold(
      /// Body
      body: pages[pageIndex.value],

      /// Bottom Navigation Bar
      bottomNavigationBar: NavBar(
        selectedIndex: pageIndex.value,
        onTap: (value) {
          pageIndex.value = value;
          print(value);
        },
        children: [
          NavBarItem(
            icon: Icons.home,
            title: 'Home',
            isSelected: pageIndex.value == 0,
          ),
          NavBarItem(
            icon: Icons.search,
            title: 'Search',
            isSelected: pageIndex.value == 1,
          ),
          NavBarItem(
            icon: Icons.flash_on_outlined,
            title: 'Dashboard',
            isSelected: pageIndex.value == 2,
          ),
          NavBarItem(
            icon: Icons.settings,
            title: 'Setting',
            isSelected: pageIndex.value == 3,
          ),
        ],
      ),
      backgroundColor: ColorManager.kBackgroundColor,
    );
  }
}
