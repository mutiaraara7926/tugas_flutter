import 'package:flutter/material.dart';
// import 'package:ppkd_b_3/Tugas4_Flutter/tugas4_flutter.dart';
import 'package:ppkd_b_3/extension/navigation.dart';
import 'package:ppkd_b_3/tugas7flutter/DatePicker.dart';
import 'package:ppkd_b_3/tugas7flutter/DropDown.dart';
import 'package:ppkd_b_3/tugas7flutter/TimePicker.dart';
import 'package:ppkd_b_3/tugas7flutter/checkbox.dart';
import 'package:ppkd_b_3/tugas7flutter/switch.dart';

// import 'package:ppkd_b_3/tugas7flutter/DropDown.dart';

class tugasTujuh extends StatefulWidget {
  const tugasTujuh({super.key});
  static const id = "/main";
  @override
  State<tugasTujuh> createState() => _tugasTujuhState();
}

class _tugasTujuhState extends State<tugasTujuh> {
  int _selectedIndexDrawer = 0;
  static const List<String> _titles = [
    "Syarat & Ketentuan",
    "Mode Gelap / Terang",
    "PilihKategori Produk",
    "Pilih Tanggal Lahir",
    "Atur Pengingat",
  ];
  static const List<Widget> _widgetOptions = <Widget>[
    CheckboxTugas(),
    SwitchTugas(),
    DropdownTugas(),
    DatePickerTugas(),
    TimepickerTugas(),
  ];

  void onItemTap(int index) {
    setState(() {
      _selectedIndexDrawer = index;
    });
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndexDrawer],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 165, 137, 240),
      ),
      body: Center(child: _widgetOptions[_selectedIndexDrawer]),
      // appBar: AppBar
      // (backgroundColor: const Color.fromARGB(255, 165, 137, 240)),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Syarat&Ketentuan"),
              onTap: () => onItemTap(0),
            ),
            ListTile(title: Text("Switch"), onTap: () => onItemTap(1)),
            ListTile(title: Text("Drop Down"), onTap: () => onItemTap(2)),
            ListTile(title: Text("Datepicker"), onTap: () => onItemTap(3)),
            ListTile(title: Text("Timepicker"), onTap: () => onItemTap(4)),
          ],
        ),
      ),
    );
  }
}
