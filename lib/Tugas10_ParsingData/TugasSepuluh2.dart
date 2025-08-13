import 'package:flutter/material.dart';

class Tugassepuluh2 extends StatelessWidget {
  const Tugassepuluh2({
    super.key,
    required this.email,
    required this.phone,
    required this.name,
    required this.kotaDomisili,
  });
  final String email;
  final String? phone;
  final String name;
  final String kotaDomisili;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Terima kasih",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "dari",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                kotaDomisili,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "telah mendaftar",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
