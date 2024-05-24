import 'dart:developer';

import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/View/Pages/join_group_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  List<dynamic> _searchResults = [];
  final supabase = Supabase.instance.client;

  Future<List<String>> getCurrentUserEnrollment(String currentUserId) async {
    try {
      final response = await supabase.from('user').select('member_of').eq('id', currentUserId);

      log('response: $response');
      if (response.isNotEmpty) {
        return List<String>.from(response[0]['member_of']);
      } else {
        return [];
      }
    } catch (e) {
      log('Exception fetching users: $e');
      return [];
    }
  }

  Future<bool> hideJoinGroup(String currentUserId, String groupId) async {
    final enrollments = await getCurrentUserEnrollment(currentUserId);
    final response = await supabase.from('group').select('group_id, admin_id').eq('group_id', groupId);

    if (response.isNotEmpty) {
      var groupData = response[0];
      if (enrollments.contains(groupData['group_id']) || currentUserId == groupData['admin_id']) {
        return true;
      }
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _performSearch(query);
    } else {
      setState(() {
        _searchResults = [];
      });
    }
  }

  Future<void> _performSearch(String query) async {
    setState(() {
      _isLoading = true;
    });

    // Perform the search on Supabase
    final response = await supabase.from('group').select().ilike('name', '%$query%');

    setState(() {
      _searchResults = response;
      _isLoading = false;
    });
  }

  Future<String> getMembersLength(groupID) async {
    final response = await supabase.from('group').select('members').eq('group_id', groupID).single();
    final numbs = response['members'].length.toString();
    return numbs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          autofocus: true,
        ),
        backgroundColor: ColorManager.kBackgroundColor,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                var result = _searchResults[index];
                final groupId = result['group_id'];
                final imageAvatar = supabase.storage.from('Gg').getPublicUrl(result['group_image']);

                return FutureBuilder<bool>(
                  future: hideJoinGroup(supabase.auth.currentUser!.id, groupId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ListTile(
                        title: Text(result['name']),
                        subtitle: const Text('Loading...'),
                      );
                    } else if (snapshot.hasError) {
                      return ListTile(
                        title: Text(result['name']),
                        subtitle: const Text('Error loading group information.'),
                      );
                    } else {
                      final hasAccess = snapshot.data ?? false;
                      return FutureBuilder<String>(
                        future: getMembersLength(groupId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return ListTile(
                              title: Text(result['name']),
                              subtitle: const Text('Loading members count...'),
                            );
                          } else if (snapshot.hasError) {
                            return ListTile(
                              title: Text(result['name']),
                              subtitle: const Text('Error loading members count.'),
                            );
                          } else {
                            final numbs = snapshot.data ?? '0';
                            return ListTile(
                              leading: Image.network(imageAvatar),
                              title: Text(result['name']),
                              subtitle: Text(
                                result['description'],
                                maxLines: 1,
                              ),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => JoinGroupPage(
                                    groupAvatar: imageAvatar,
                                    groupName: result['name'],
                                    groupDescription: result['description'],
                                    groupLocation: result['location'],
                                    numberOfMember: numbs,
                                    buttonTitle: hasAccess ? 'You are already a member or admin' : 'Join Group',
                                    textColor: hasAccess ? const Color(0xffea3323) : const Color(0xFF42CA90),
                                    buttonBackgroundcolor:
                                        hasAccess ? const Color(0xFFea3323).withOpacity(0.2) : const Color(0xFF184239),
                                    borderColor: hasAccess ? const Color(0xffea3323) : const Color(0xFF42CA90),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      );
                    }
                  },
                );
              },
            ),
    );
  }
}
