import 'package:flutter/material.dart';

class DropdownTugas extends StatefulWidget {
  const DropdownTugas({super.key});

  @override
  State<DropdownTugas> createState() => _DropdownTugasState();
}

class _DropdownTugasState extends State<DropdownTugas> {
  bool isCheck = false;
  bool isCheckSwitch = false;
  String? dropdownSelect;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Drop Down"),
          DropdownButton(
            value: dropdownSelect,
            hint: Text("Pilih Kategori Produk "),
            items: ["Elektronik", "Pakaian", "Makanan", "Lainnya"].map((
              String value,
            ) {
              return DropdownMenuItem(value: value, child: Text(value));
            }).toList(),
            onChanged: (value) {
              setState(() {});
              dropdownSelect = value;
            },
          ),
        ],
      ),
    );
  }
}
