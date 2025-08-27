// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas14fluttter/api/get_user.dart';
import 'package:ppkd_b_3/tugas14fluttter/model/user_model.dart';
import 'package:ppkd_b_3/tugas14fluttter/view/detail_screen.dart';

class getScreen extends StatefulWidget {
  const getScreen({super.key});
  static const id = "/getScreen";
  @override
  State<getScreen> createState() => _getScreenState();
}

class _getScreenState extends State<getScreen> {
  final TextEditingController searchController = TextEditingController();

  List<Result> allUsers = [];
  List<Result> filteredUsers = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadUsers();

    // listener search
    searchController.addListener(() {
      _searchItem(searchController.text);
    });
  }

  Future<void> _loadUsers() async {
    setState(() {
      isLoading = true;
    });
    final data = await getUser();
    setState(() {
      allUsers = data;
      filteredUsers = data;
      isLoading = false;
    });
  }

  void _searchItem(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredUsers = allUsers;
      });
    } else {
      setState(() {
        filteredUsers = allUsers
            .where(
              (user) => user.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      });
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Rick & Morty Characters")),
      body: Container(
        color: const Color.fromARGB(244, 9, 73, 28),
        child: Column(
          children: [
            // search bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Cari karakter...",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      searchController.clear();
                      _searchItem("");
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : RefreshIndicator(
                      onRefresh: _loadUsers,
                      child: ListView.builder(
                        itemCount: filteredUsers.length,
                        itemBuilder: (BuildContext context, int index) {
                          final user = filteredUsers[index];
                          return Card(
                            color: const Color.fromARGB(255, 82, 148, 121),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              leading: Image.network(
                                user.image,
                                width: 50,
                                height: 50,
                              ),
                              title: Text(user.name),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailScreen(result: user),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
