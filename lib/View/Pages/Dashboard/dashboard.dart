import 'dart:developer';

import 'package:derpy/Components/reusable_card.dart';
import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/Constants/text_style_manager.dart';
import 'package:derpy/Controller/Auth/auth_controller.dart';
import 'package:derpy/Model/group.dart';
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
    final adminGroups = authController.getUserId().toString();
    final ownGroups = useState<List<Group>>([]);
    final myGroupAsMember = useState<List<Group>>([]);
    final isLoading = useState<bool>(true);
    final error = useState<String?>(null);
    final dashboardControl = useState(DashboardControl.admin);

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
    ///

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

    if (isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    }

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

    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () => fetchMyGroupsAsMember(),
          child: Text(
            'Dashboard',
            style: TextStyleManager(kColor: Colors.white, kFontSize: 25.0, kFontWeight: FontWeight.normal),
          ),
        ),
        backgroundColor: ColorManager.kBackgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: segmentedButton,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final group = ownGroups.value[index];
                final imageAvatar = supabase.storage.from('Gg').getPublicUrl(group.groupImage);
                if (dashboardControl.value == DashboardControl.admin) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                            builder: (context) => GroupContent(groupName: group.name, groupImage: imageAvatar),
                          ),
                        );
                      },
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
                            builder: (context) => GroupContent(groupName: group.name, groupImage: imageAvatar),
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
