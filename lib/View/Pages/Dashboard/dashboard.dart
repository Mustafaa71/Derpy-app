import 'dart:developer';

import 'package:derpy/Components/register_dashboard.dart';
import 'package:derpy/Components/reusable_card.dart';
import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/Constants/text_style_manager.dart';
import 'package:derpy/Controller/Auth/auth_controller.dart';
import 'package:derpy/Controller/dashboard_controller.dart';
import 'package:derpy/View/Pages/Dashboard/add_group.dart';
import 'package:derpy/View/Pages/group_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
                                      child: ReusableCard(
                                        imagePath: imageAvatar,
                                        title: group.name,
                                        description: group.description,
                                        visibilty: 'Public',
                                        groupOrEvent: group.category,
                                        numberOfMember: '10',
                                        location: group.location,
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => GroupContent(
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
