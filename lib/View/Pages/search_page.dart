import 'package:derpy/Constants/color_manager.dart';
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

    // Perform the search on the Supabase
    final response = await Supabase.instance.client.from('group').select().ilike('name', '%$query%');

    setState(() {
      _searchResults = response;
    });

    setState(() {
      _isLoading = false;
    });
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
              itemBuilder: (context, index) {
                var result = _searchResults[index];
                final groupName = result['name'];
                return ListTile(
                  title: Text(
                    result['name'],
                  ),
                );
              },
              itemCount: _searchResults.length,
            ),
    );
  }
}
