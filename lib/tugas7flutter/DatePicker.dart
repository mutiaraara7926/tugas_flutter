import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerTugas extends StatefulWidget {
  const DatePickerTugas({super.key});

  @override
  State<DatePickerTugas> createState() => _DatePickerTugasState();
}

class _DatePickerTugasState extends State<DatePickerTugas> {
  bool isCheck = false;
  bool isCheckSwitch = false;
  String? dropdownSelect;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Date Picker"),
          ElevatedButton(
            child: Text("Pilih Tanggal"),
            onPressed: () async {
              final DateTime? pickerDate = await showDatePicker(
                context: context,
                firstDate: DateTime(1999),
                lastDate: DateTime(2050),
              );
              if (pickerDate != null) {
                setState(() {});
                selectedDate = pickerDate;
              }
            },
          ),
          Text(
            selectedDate == null
                ? "Pilih tanggal dulu"
                : DateFormat('EEEE, dd MMMM yyyy').format(selectedDate!),
          ),
        ],
      ),
    );
  }
}
