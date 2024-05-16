import 'package:derpy/Components/register_dashboard.dart';
import 'package:derpy/Components/reusable_card.dart';
import 'package:derpy/Controller/Auth/auth_controller.dart';
import 'package:derpy/Controller/group_controller.dart';
import 'package:derpy/Model/group.dart';
import 'package:derpy/View/Pages/group_content.dart';
import 'package:derpy/View/Pages/join_group_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserScreen extends HookConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supabase = Supabase.instance.client;
    final groupController = ref.watch(GroupController.groupControllerProvider.notifier);
    final authController = ref.watch(AuthController.authControllerProvider.notifier);
    final getUserId = authController.getUserId();
    final groupState = ref.watch(GroupController.groupControllerProvider);

    if (groupState is AsyncLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (groupState is AsyncError) {
      return Center(child: Text('Error: ${groupState.error}'));
    } else if (groupState is AsyncData<List<Group>>) {
      final groupList = groupState.value;

      return Expanded(
        child: ListView.builder(
          itemCount: groupList.length,
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
                          groupController.addMeAsAmember(getUserId.toString(), data.id);
                          groupController.addUserIdIntoGroups(getUserId.toString(), data.id);
                          Navigator.of(context)
                              .push(
                                MaterialPageRoute(
                                  builder: (context) => GroupContent(
                                    groupName: data.name,
                                    groupImage: hh,
                                  ),
                                ),
                              )
                              .then((value) => ref.refresh(GroupController.groupControllerProvider));
                        },
                      ),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const RegisterDashboard();
                    },
                  );
                }
              },
            );
          },
        ),
      );
    } else {
      return const Center(child: Text('Unknown state'));
    }
  }
}
