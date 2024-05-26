import 'dart:developer';

import 'package:derpy/Components/buttons/reusable_button.dart';
import 'package:derpy/Components/register_dashboard.dart';
import 'package:derpy/Components/reusable_card.dart';
import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/Constants/text_style_manager.dart';
import 'package:derpy/Controller/Auth/auth_controller.dart';
import 'package:derpy/Controller/dashboard_controller.dart';
import 'package:derpy/Controller/group_controller.dart';
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
    final dashboardController = ref.watch(dashboardControllerProvider);
    final currentUserId = authController.getUserId().toString();
    final dashboardControl = useState(DashboardControl.admin);
    final groupController = ref.watch(GroupController.groupControllerProvider.notifier);

    useEffect(() {
      Future.delayed(Duration.zero, () {
        dashboardController.fetchMyOwnGroups(currentUserId);
        dashboardController.fetchMyGroupsAsMember(currentUserId);
      });

      return null;
    }, []);

    int gg() {
      final result = dashboardControl.value == DashboardControl.admin
          ? dashboardController.ownGroups.length
          : dashboardController.myGroupAsMember.length;
      log('Dashboard List: $result');
      return result;
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
                            },
                          );
                        },
                        style: const ButtonStyle(),
                        child: Text(
                          'Join Us',
                          style: TextStyleManager(
                            kColor: Colors.blueAccent,
                            kFontSize: 25.0,
                            kFontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : dashboardController.isLoading
                  ? const Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: CircularProgressIndicator(),
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: dashboardController.ownGroups.isEmpty && dashboardController.myGroupAsMember.isEmpty
                          ? const Center(child: Text('No groups found.'))
                          : RefreshIndicator(
                              key: const Key('Refresh'),
                              onRefresh: () async {
                                dashboardController.fetchMyOwnGroups(currentUserId);
                                dashboardController.fetchMyGroupsAsMember(currentUserId);
                              },
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  final group = dashboardControl.value == DashboardControl.admin
                                      ? dashboardController.ownGroups[index]
                                      : dashboardController.myGroupAsMember[index];
                                  final imageAvatar = supabase.storage.from('Gg').getPublicUrl(group.groupImage);
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: InkWell(
                                      onLongPress: () async {
                                        final result = await showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Stack(
                                                children: [
                                                  InkWell(
                                                    child: SizedBox(
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
                                                                    backgroundImage: NetworkImage(imageAvatar),
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
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child: Text(
                                                                              group.name,
                                                                              style: TextStyleManager(
                                                                                kColor: Colors.grey,
                                                                                kFontSize: 25.0,
                                                                                kFontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const Divider(height: 0),
                                                                      const SizedBox(height: 10.0),
                                                                      Text(
                                                                        'Location: ${group.location}',
                                                                        style: TextStyleManager(
                                                                          kColor: Colors.white,
                                                                          kFontSize: 15.0,
                                                                          kFontWeight: FontWeight.normal,
                                                                        ),
                                                                      ),
                                                                      const Divider(),
                                                                      Text(
                                                                        'NOTE: IF YOU DELETE THIS GROUP YOU WILL NOT BE ABLE TO RECOVER IT',
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
                                                  ),
                                                  Positioned(
                                                    left: 0,
                                                    right: 0,
                                                    bottom: 0,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(20.0),
                                                      child: ReusableButton(
                                                        label: 'Remove',
                                                        textColor: const Color(0xffea3323),
                                                        backgroundcolor: const Color(0xFFea3323).withOpacity(0.2),
                                                        onClick: () async {
                                                          showDialog(
                                                              context: context,
                                                              builder: (context) {
                                                                return Center(
                                                                    child: TweenAnimationBuilder<double>(
                                                                  tween: Tween<double>(begin: 0.0, end: 1),
                                                                  duration: const Duration(milliseconds: 3500),
                                                                  builder: (context, value, _) =>
                                                                      CircularProgressIndicator(value: value),
                                                                ));
                                                              });
                                                          Navigator.of(context).pop(true);
                                                          if (supabase.auth.currentUser!.id == group.admin) {
                                                            await groupController.deleteAgroup(group.id);
                                                          } else {
                                                            await groupController.removeGroupIdFromUsers(group.id);
                                                          }
                                                          Navigator.of(context).pop(true);
                                                        },
                                                        borderColor: const Color(0xffea3323),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });
                                        if (result == true) {
                                          dashboardController.fetchMyOwnGroups(currentUserId);
                                          dashboardController.fetchMyGroupsAsMember(currentUserId);
                                        }
                                      },
                                      child: ReusableCard(
                                        imagePath: imageAvatar,
                                        title: group.name,
                                        description: group.description,
                                        visibilty: 'Public',
                                        groupOrEvent: group.category,
                                        numberOfMember: group.members.length.toString(),
                                        location: group.location,
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => GroupContent(
                                                groupId: group.id,
                                                groupName: group.name,
                                                groupImage: imageAvatar,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                                itemCount: gg(),
                              ),
                            ),
                    ),
        ],
      ),
      floatingActionButton: dashboardControl.value == DashboardControl.admin && authController.getUserId() != null
          ? FloatingActionButton(
              onPressed: () async {
                final result = await showModalBottomSheet<bool>(
                  context: context,
                  builder: (context) => const AddGroup(),
                  isScrollControlled: true,
                  useSafeArea: true,
                );
                if (result == true) {
                  dashboardController.fetchMyOwnGroups(currentUserId);
                  dashboardController.fetchMyGroupsAsMember(currentUserId);
                }
              },
              child: const Icon(Icons.add),
            )
          : const SizedBox.shrink(),
    );
  }
}
