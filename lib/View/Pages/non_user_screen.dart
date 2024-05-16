import 'package:derpy/Components/register_dashboard.dart';
import 'package:derpy/Components/reusable_card.dart';
import 'package:derpy/Controller/group_controller.dart';
import 'package:derpy/Model/group.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NonUserScreen extends HookConsumerWidget {
  const NonUserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supabase = Supabase.instance.client;

    return Expanded(
      child: Consumer(
        builder: (context, ref, child) {
          final groupListAsyncValue = ref.watch(GroupController.groupControllerProvider);

          if (groupListAsyncValue is AsyncLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (groupListAsyncValue is AsyncError) {
            return Center(child: Text('Error: ${groupListAsyncValue.error}'));
          } else if (groupListAsyncValue is AsyncData<List<Group>>) {
            final groupList = groupListAsyncValue.value;

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
                  onTap: () {
                    if (supabase.auth.currentUser == null) {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const RegisterDashboard();
                        },
                      );
                    }
                  },
                );
              },
              itemCount: groupList.length,
            );
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
