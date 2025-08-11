import 'package:flutter/material.dart';

class TimepickerTugas extends StatefulWidget {
  const TimepickerTugas({super.key});

  @override
  State<TimepickerTugas> createState() => _TimePickerTugasState();
}

class _TimePickerTugasState extends State<TimepickerTugas> {
  bool isCheck = false;
  bool isCheckSwitch = false;
  String? dropdownSelect;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Time Picker"),
          ElevatedButton(
            child: Text("Atur Pengingat"),
            onPressed: () async {
              final TimeOfDay? pickerDate = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                // firstDate: DateTime(1999),
                // lastDate: DateTime(2050),
              );
              if (pickerDate != null) {
                setState(() {});
                selectedTime = pickerDate;
              }
            },
          ),
          Text(
            selectedTime == null
                ? "Pilih Jam"
                : "${selectedTime!.hour.toString()} : ${selectedTime!.minute.toString()}",
          ),
        ],
      ),
    );
  }
}
