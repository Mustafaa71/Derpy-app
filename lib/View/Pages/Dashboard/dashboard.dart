import 'dart:developer';

import 'package:derpy/Components/buttons/reusable_button.dart';
import 'package:derpy/Components/register_dashboard.dart';
import 'package:derpy/Components/reusable_card.dart';
import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/Constants/text_style_manager.dart';
import 'package:derpy/Controller/Auth/auth_controller.dart';
import 'package:derpy/Controller/group_controller.dart';
import 'package:derpy/Model/group.dart';
import 'package:derpy/View/Pages/Dashboard/add_group.dart';
import 'package:derpy/View/Pages/group_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

enum DashboardControl { admin, member }

class Dashboard extends HookConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supabase = Supabase.instance.client;
    final authController = ref.watch(AuthController.authControllerProvider.notifier);
    final adminGroups = authController.getUserId().toString();
    final ownGroups = useState<List<Group>>([]);
    final myGroupAsMember = useState<List<Group>>([]);
    final isLoading = useState<bool>(true);
    final error = useState<String?>(null);
    final dashboardControl = useState(DashboardControl.admin);
    final groupController = ref.watch(GroupController.groupControllerProvider.notifier);

    void fetchMyOwnGroups() async {
      isLoading.value = true;
      try {
        final response = await supabase.from('group').select().eq('admin_id', adminGroups);

        ownGroups.value = (response).map((e) => Group.fromJson(e)).toList();
      } catch (e) {
        error.value = e.toString();
      } finally {
        isLoading.value = false;
      }
    }

    /// Some GG is Happining here ...

    void fetchMyGroupsAsMember() async {
      isLoading.value = true;
      try {
        final response = await supabase.from('user').select('member_of').eq('id', adminGroups);
        isLoading.value = false;
        List<Map<String, dynamic>> responseData = response;
        for (var item in responseData) {
          List memberOfList = item['member_of'];
          print('Member of list: $memberOfList');
          for (var groupId in memberOfList) {
            final response = await supabase.from('group').select().eq('group_id', groupId);
            List<Map<String, dynamic>> groupData = response;
            List<Group> groups = groupData.map((groupMap) => Group.fromJson(groupMap)).toList();
            myGroupAsMember.value.addAll(groups);
            log('Groups: $groups');
          }
        }
      } catch (e) {
        isLoading.value = false;
        log(e.toString());
      }
    }

    useEffect(() {
      fetchMyOwnGroups();
      fetchMyGroupsAsMember();
      return null;
    }, []);

    if (error.value != null) {
      return Center(child: Text('Error: ${error.value}'));
    }

    var segmentedButton = SegmentedButton(
      segments: const [
        ButtonSegment<DashboardControl>(
          value: DashboardControl.admin,
          icon: Icon(Icons.admin_panel_settings),
          label: Text('Admin'),
        ),
        ButtonSegment<DashboardControl>(
          value: DashboardControl.member,
          icon: Icon(Icons.people),
          label: Text('Member'),
        ),
      ],
      selected: <DashboardControl>{dashboardControl.value},
      onSelectionChanged: (Set<DashboardControl> newSection) {
        dashboardControl.value = newSection.first;
      },
    );

    int gg() {
      return dashboardControl.value == DashboardControl.admin ? ownGroups.value.length : myGroupAsMember.value.length;
    }

    Future<List<Map<String, dynamic>>> fetchUsersWithGroup(String groupId) async {
      try {
        final response = await supabase.from('user').select('id, member_of').contains('member_of', [groupId]);

        log('response: $response');

        return List<Map<String, dynamic>>.from(response);
      } catch (e) {
        log('Exception fetching users: $e');
        return [];
      }
    }

    Future<void> removeGroupIdFromUsers(String groupId) async {
      final users = await fetchUsersWithGroup(groupId);
      for (var user in users) {
        List<String> updatedMemberOf = List<String>.from(user['member_of']);
        updatedMemberOf.removeWhere((id) => id == groupId);

        try {
          final response = await supabase.from('user').update({'member_of': updatedMemberOf}).eq('id', user['id']);

          if (response.error != null) {
            log('Error updating user ${user['id']}: ${response.error!.message}');
          } else {
            log('Updated user ${user['id']} successfully');
          }
        } catch (e) {
          log('Exception updating user ${user['id']}: $e');
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyleManager(kColor: Colors.white, kFontSize: 25.0, kFontWeight: FontWeight.normal),
        ),
        backgroundColor: ColorManager.kBackgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: segmentedButton,
          ),
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
              : isLoading.value
                  ? const Expanded(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    ))
                  : Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          final group = ownGroups.value[index];
                          final imageAvatar = supabase.storage.from('Gg').getPublicUrl(group.groupImage);
                          if (dashboardControl.value == DashboardControl.admin) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: InkWell(
                                onLongPress: () {
                                  log(group.id);
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Stack(
                                          children: [
                                            SizedBox(
                                              height: double.infinity,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(20.0),
                                                    child: WidgetCircularAnimator(
                                                      innerColor: Colors.white,
                                                      outerColor: Colors.blue,
                                                      innerAnimation: Curves.easeInOutBack,
                                                      outerAnimation: Curves.easeInOutBack,
                                                      size: 100,
                                                      innerAnimationSeconds: 10,
                                                      outerAnimationSeconds: 10,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.grey[200], shape: BoxShape.circle),
                                                        child: CircleAvatar(
                                                          backgroundColor: const Color(0xff034C5C),
                                                          radius: 30,
                                                          child: CircleAvatar(
                                                            backgroundImage: NetworkImage(imageAvatar.toString()),
                                                            radius: 30,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      group.name,
                                                                      style: TextStyleManager(
                                                                        kColor: Colors.grey,
                                                                        kFontSize: 20.0,
                                                                        kFontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const Divider(),
                                                              Text(
                                                                'Description: ${group.description}',
                                                                style: TextStyleManager(
                                                                  kColor: Colors.grey,
                                                                  kFontSize: 20.0,
                                                                  kFontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                              const Divider(),
                                                              Text(
                                                                'Note: You are going to delete this group',
                                                                style: TextStyleManager(
                                                                  kColor: Colors.redAccent,
                                                                  kFontSize: 25.0,
                                                                  kFontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              left: 0,
                                              right: 0,
                                              bottom: 0,
                                              child: Padding(
                                                padding: const EdgeInsets.all(20.0),
                                                child: ReusableButton(
                                                  label: 'Delete Group',
                                                  textColor: const Color(0xffea3323),
                                                  backgroundcolor: const Color(0xFFea3323).withOpacity(0.2),
                                                  onClick: () {
                                                    groupController.removeGroupIdFromUsers(group.id);
                                                    groupController.removeGroup(group.id);
                                                    Navigator.of(context).pop();
                                                  },
                                                  borderColor: const Color(0xffea3323),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                child: ReusableCard(
                                  imagePath: imageAvatar,
                                  title: group.name,
                                  description: group.description,
                                  visibilty: 'Public',
                                  groupOrEvent: group.category,
                                  numberOfMember: '10',
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            GroupContent(groupName: group.name, groupImage: imageAvatar),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          } else {
                            final guestGroup = myGroupAsMember.value[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: ReusableCard(
                                imagePath: imageAvatar,
                                title: guestGroup.name,
                                description: guestGroup.description,
                                visibilty: 'Public',
                                groupOrEvent: guestGroup.category,
                                numberOfMember: '10',
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          GroupContent(groupName: group.name, groupImage: imageAvatar),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        },
                        itemCount: gg(),
                      ),
                    ),
        ],
      ),
      floatingActionButton: dashboardControl.value == DashboardControl.admin && authController.getUserId() != null
          ? FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const AddGroup(),
                  isScrollControlled: true,
                  useSafeArea: true,
                );
              },
              child: const Icon(Icons.add),
            )
          : const SizedBox.shrink(),
    );
  }
}
