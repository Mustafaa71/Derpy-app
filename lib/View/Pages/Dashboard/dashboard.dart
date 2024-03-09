import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/Constants/text_style_manager.dart';
import 'package:derpy/Controller/group_controller.dart';
import 'package:derpy/View/Pages/Dashboard/add_group.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Dashboard extends HookConsumerWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createGroupController = ref.read(GroupController.groupControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child: const Icon(Icons.add),
        ),
        title: Text(
          'Dashboard',
          style: TextStyleManager(kColor: Colors.white, kFontSize: 25.0, kFontWeight: FontWeight.normal),
        ),
        backgroundColor: ColorManager.kBackgroundColor,
      ),
      body: const Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const AddGroup();
            },
            useSafeArea: true,
            isScrollControlled: true,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
