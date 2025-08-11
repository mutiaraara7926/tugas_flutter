import 'package:flutter/material.dart';

class SwitchTugas extends StatefulWidget {
  const SwitchTugas({super.key});

  @override
  State<SwitchTugas> createState() => _SwitchTugasState();
}

class _SwitchTugasState extends State<SwitchTugas> {
  bool isCheck = false;
  bool isCheckSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: isCheckSwitch == true
          ? Colors.black
          : const Color.fromARGB(255, 249, 253, 255),
      child: Column(
        children: [
          Row(
            children: [
              Switch(
                activeColor: const Color.fromARGB(0, 49, 48, 48),
                value: isCheckSwitch,
                onChanged: (value) {
                  setState(() {
                    isCheckSwitch = value;
                  });
                },
              ),
              Text(
                isCheckSwitch == true
                    ? "Mode Gelap Aktif"
                    : "Mode terang Aktif",
                style: TextStyle(
                  color: isCheckSwitch == true ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
