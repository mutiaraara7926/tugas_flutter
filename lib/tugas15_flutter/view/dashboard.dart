import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas15_flutter/api/register_user.dart';
import 'package:ppkd_b_3/tugas15_flutter/model/get_User.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static const id = "/Dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  GetUserModel? userData;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final data = await AuthenticationAPI.getProfile();
      setState(() {
        userData = data;
        _nameController.text = data.data?.name ?? '';
        _emailController.text = data.data?.email ?? '';
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  void showEditDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Profile"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                AuthenticationAPI.updateUser(name: _nameController.text);
                _loadProfileData();
                setState(() {});
                Navigator.pop(context);
              },
              child: const Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: const Color.fromARGB(255, 159, 131, 204),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : errorMessage != null
            ? Text("Error: $errorMessage")
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 250,
                    width: 380,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Row(
                            children: [
                              const Icon(Icons.person_2_rounded),
                              const SizedBox(width: 20),
                              const Text(
                                "Nama: ",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                userData?.data?.name ?? '-',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Row(
                            children: [
                              const Icon(Icons.email_rounded),
                              const SizedBox(width: 20),
                              const Text(
                                "Email: ",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                userData?.data?.email ?? '-',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: tambahin logika logout
                    },
                    child: const Text("Logout"),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: showEditDialog,
                    child: const Text("Edit"),
                  ),
                ],
              ),
      ),
    );
  }
}
