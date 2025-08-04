import 'package:flutter/material.dart';

class TugasDuaFlutter extends StatelessWidget {
  const TugasDuaFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil Lengkap",
          style: TextStyle(fontFamily: "BitcounProp"),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/images/tralalelo.jpg"),
          ),

          // Container(
          //   height: 200,
          //   width: 200,
          //   decoration: BoxDecoration(
          //     color: Colors.amber,
          //     shape: BoxShape.circle,
          //     image: DecorationImage(
          //       fit: BoxFit.cover,
          //       image: AssetImage("assets/images/tralalelo.jpeg"),
          //     ),
          //   ),
          // // ),
          // Image.asset("assets/images/tralalelo.jpeg", height: 200),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(20),

              child: Row(
                children: [
                  Text(
                    "Mutiara Sa'diyah",
                    style: TextStyle(fontFamily: "BitcounProp", fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 203, 94, 147),
                border: Border.all(
                  color: const Color.fromARGB(232, 49, 9, 94),
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Icon(Icons.email),

                  Text(
                    "arahwtfdwju@gmail.com",
                    style: TextStyle(fontFamily: "BitcounProp", fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 203, 94, 147),
                border: Border.all(
                  color: const Color.fromARGB(232, 49, 9, 94),
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Icon(Icons.call),
                  Text(
                    "085874369797",
                    style: TextStyle(fontFamily: "BitcounProp", fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 102, 146),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Center(child: Text("Postingan")),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 224, 134, 164),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(child: Text("followers")),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 238, 160, 186),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Center(
                      child: Text(
                        "Bisa ga yaaaa saya bertahan sampe akhirrrrr xixixixixixi",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
