import 'package:flutter/material.dart';
import 'package:ppkd_b_3/Tugas9_Flutter/Model/Produk_Model.dart';

class ListTugas extends StatefulWidget {
  const ListTugas({super.key});

  @override
  State<ListTugas> createState() => _ListTugasState();
}

class _ListTugasState extends State<ListTugas> {
  final List<String> namaProduk = [
    "Karpet Mobil",
    "Jam Analog Dashboard",
    "Cover Setir Kulit",
    "Pengharum Mobil",
    "Pelindung Pintu bagasi",
    "Dash Cam",
    "Air Purifier Mobil",
    "Pompa Ban",
    "Moulding Pintu",
    "Pengharum Kayu",
  ];
  final List<Map<String, dynamic>> produk = [
    {
      "nama": "Karpet Mobil",
      "price": 500000,
      'icon': Icons.directions_car,
      "warna": const Color.fromARGB(255, 181, 37, 191),
    },

    {
      "nama": "Jam Analog Dashboard",
      "price": 30000,
      'icon': Icons.timer,
      "warna": const Color.fromARGB(255, 181, 37, 191),
    },
    {
      "nama": "Cover Setir Kulit",
      "price": 60000,
      'icon': Icons.settings,
      "warna": Color.fromARGB(255, 181, 37, 191),
    },
    {
      "nama": "Pengharum Mobil",
      "price": 55000,
      'icon': Icons.air,
      "warna": const Color.fromARGB(255, 181, 37, 191),
    },
    {
      "nama": "Pelindung Pintu bagasi",
      "price": 35000,
      'icon': Icons.door_front_door,
      "warna": Color.fromARGB(255, 181, 37, 191),
    },
    {
      "nama": "Dash Cam",
      "price": 1000000,
      'icon': Icons.videocam,
      "warna": Color.fromARGB(255, 181, 37, 191),
    },
    {
      "nama": "Air Purifier Mobil",
      "price": 500000,
      'icon': Icons.cleaning_services,
      "warna": Color.fromARGB(255, 181, 37, 191),
    },
    {
      "nama": "Pompa Ban",
      "price": 300000,
      'icon': Icons.compress,
      "warna": const Color.fromARGB(255, 181, 37, 191),
    },
    {
      "nama": "Moulding Pintu",
      "price": 1000000,
      'icon': Icons.architecture,
      "warna": Color.fromARGB(255, 181, 37, 191),
    },
    {
      "nama": "Pengharum Kayu",
      "price": 50000,
      'icon': Icons.spa,
      "warna": const Color.fromARGB(255, 181, 37, 191),
    },
  ];
  final List<ProdukModel> produkModel =[

  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),

            shrinkWrap: true,
            itemCount: namaProduk.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(namaProduk[index]),
                leading: CircleAvatar(child: Text("${index + 1}")),
              );
            },
          ),
          Divider(),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: produk.length,
            itemBuilder: (BuildContext context, int index) {
              final dataProduk = produk[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: dataProduk["warna"],
                  child: Icon(dataProduk["icon"], color: Colors.white),
                ),
                title: Text(dataProduk["nama"]),
                subtitle: Text("Rp ${dataProduk["price"]}"),
              );
            },
          ),
        ],
      ),
    );
  }
}
