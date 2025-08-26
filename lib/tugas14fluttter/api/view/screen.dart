import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas14fluttter/api/get_user.dart';
import 'package:ppkd_b_3/tugas14fluttter/api/model/user_model.dart';

class getScreen extends StatefulWidget {
  const getScreen({super.key});
  static const id = "/getScreen";
  @override
  State<getScreen> createState() => _getScreenState();
}

class _getScreenState extends State<getScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<List<Result>>(
                future: getUser(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    final users = snapshot.data as List<Result>;
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: users.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Char = users[index];
                        return ListTile(
                          leading: Image.network(Char.image ?? ""),
                          title: Text(Char.name ?? ""),
                        );
                      },
                    );
                  } else {
                    return Text("Gagal Memuat Data");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
