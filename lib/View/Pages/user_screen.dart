import 'package:derpy/Components/register_dashboard.dart';
import 'package:derpy/Components/reusable_card.dart';
import 'package:derpy/Controller/Auth/auth_controller.dart';
import 'package:derpy/Controller/group_controller.dart';
import 'package:derpy/Controller/permissions.dart';
import 'package:derpy/View/Pages/group_content.dart';
import 'package:derpy/View/Pages/join_group_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserScreen extends HookConsumerWidget {
  const UserScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supabase = Supabase.instance.client;
    final groupController = ref.watch(GroupController.groupControllerProvider.notifier);
    final authController = ref.watch(AuthController.authControllerProvider.notifier);
    final getUserId = authController.getUserId();
    final groupListAsyncValue = ref.watch(GroupController.groupControllerProvider);
    final permission = ref.watch(permissionsProvider.notifier);

    return Expanded(
      child: groupListAsyncValue.when(
        skipLoadingOnRefresh: false,
        skipLoadingOnReload: true,
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
                location: data.location,
                onTap: () async {
                  if (supabase.auth.currentUser != null) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                    bool isMember = await permission.hideJoinGroup(supabase.auth.currentUser!.id, data.id);
                    Navigator.of(context).pop();

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => JoinGroupPage(
                          groupAvatar: hh,
                          groupName: data.name,
                          groupDescription: data.description,
                          groupLocation: data.location,
                          buttonTitle: isMember ? 'You are already a member or admin' : 'Join Group',
                          buttonBackgroundcolor:
                              isMember ? const Color(0xFFea3323).withOpacity(0.2) : const Color(0xFF184239),
                          textColor: isMember ? const Color(0xffea3323) : const Color(0xFF42CA90),
                          borderColor: isMember ? const Color(0xffea3323) : const Color(0xFF42CA90),
                          onTap: () {
                            if (!isMember) {
                              groupController.enrollGroup(getUserId.toString(), data.id);
                              groupController.addUserIdIntoMembers(getUserId.toString(), data.id);
                              Navigator.of(context)
                                  .push(
                                    MaterialPageRoute(
                                      builder: (context) => GroupContent(
                                        groupId: data.id,
                                        groupName: data.name,
                                        groupImage: hh,
                                      ),
                                    ),
                                  )
                                  .then((value) => ref.refresh(GroupController.groupControllerProvider));
                            }
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
            itemCount: groupList.length,
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Text('Error: $error'),
      ),
    );
  }
}
