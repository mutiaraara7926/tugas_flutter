import 'package:flutter/material.dart';

class Tugas4Flutter extends StatelessWidget {
  const Tugas4Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> productList = [
    //   {
    //     'icon': Icons.phone_android,
    //     'name': 'Smartphone',
    //     'price': 'Rp 3.000.000',
    //   },
    //   {'icon': Icons.laptop, 'name': 'Laptop', 'price': 'Rp 7.500.000'},
    //   {'icon': Icons.headphones, 'name': 'Headphone', 'price': 'Rp 500.000'},
    //   {'icon': Icons.tv, 'name': 'TV LED', 'price': 'Rp 4.000.000'},
    //   {'icon': Icons.watch, 'name': 'Smartwatch', 'price': 'Rp 1.200.000'},
    // ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulir"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(243, 29, 122, 125),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Row(children: [Text("Nama:")]),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            Row(children: [Text("Email")]),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            Row(children: [Text("No.Hp")]),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            Row(children: [Text("Deskripsi")]),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 23),
            Text("Daftar Produk"),
            SizedBox(height: 3),
            Card(
              color: const Color.fromARGB(255, 31, 70, 70),
              child: ListTile(
                leading: Image.asset(
                  "assets/images/tralalelo.jpg",
                  height: 50,
                  width: 50,
                ),
                title: Text("Tralalelo Tralala",
                style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold
                ),),
                subtitle: Text("Rp 150.000",style: TextStyle(color: Colors.white),),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 31, 70, 70),
              child: ListTile(
                leading: Image.asset(
                  "assets/images/tungtung.png",
                  height: 50,
                  width: 50,
                ),
                title: Text("Tung Tung Sahur",style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold
                ),),
                subtitle: Text("Rp 50.000",style: TextStyle(color: Colors.white),),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 31, 70, 70),
              child: ListTile(
                leading: Image.asset(
                  "assets/images/ballerina_capucina-removebg-preview.png",
                  height: 50,
                  width: 50,
                ),
                title: Text("Ballerina Cappucino",style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold
                ),),
                subtitle: Text("Rp 200.000",style: TextStyle(color: Colors.white),),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 31, 70, 70),
              child: ListTile(
                leading: Image.asset(
                  "assets/images/bombardilo-removebg-preview.png",
                  height: 50,
                  width: 50,
                ),
                title: Text("Bombardilo Crocodilo",style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold
                ),),
                subtitle: Text("Rp 150.000",style: TextStyle(color: Colors.white),),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 31, 70, 70),
              child: ListTile(
                leading: Image.asset(
                  "assets/images/brrbrr_patapim-removebg-preview.png",
                  height: 50,
                  width: 50,
                ),
                title: Text("Brr Brr Patapim",style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold
                ),),
                subtitle: Text("Rp 80.000",style: TextStyle(color: Colors.white),),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
