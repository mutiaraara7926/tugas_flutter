import 'package:flutter/material.dart';

class Tugas3flutter extends StatelessWidget {
  const Tugas3flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulir"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(243, 29, 122, 125),
      ),
      body: Column(
        children: [
          Row(children: [Text("Nama:")]),
          TextField(decoration: InputDecoration(border: OutlineInputBorder())),
          Row(children: [Text("Email")]),
          TextField(decoration: InputDecoration(border: OutlineInputBorder())),
          Row(children: [Text("No.Hp")]),
          TextField(decoration: InputDecoration(border: OutlineInputBorder())),
          Row(children: [Text("Deskripsi")]),
          TextField(decoration: InputDecoration(border: OutlineInputBorder())),
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.all(8),
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 24, 80, 71),
                    ),
                  ),
                  Text(
                    "Satu",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 83, 130, 122),
                    ),
                  ),
                  Text(
                    "Dua",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  Text(
                    "",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),

              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 28, 75, 67),
                    ),
                  ),
                  Text(
                    "Tiga",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 24, 46, 43),
                    ),
                  ),
                  Text(
                    "Empat",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 34, 101, 90),
                    ),
                  ),
                  Text(
                    "Lima",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 22, 46, 42),
                    ),
                  ),
                  Text(
                    "Enam",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
