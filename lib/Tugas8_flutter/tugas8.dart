import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas7flutter/tugas7_flutter.dart';

class Tugaas8 extends StatefulWidget {
  const Tugaas8({super.key});

  @override
  State<Tugaas8> createState() => _Tugaas8State();
}

class _Tugaas8State extends State<Tugaas8> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    tugasTujuh(),
    AboutPage(),
    // CheckboxPage(), //
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 165, 137, 240),
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 24, 16, 32),
        unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Tentang'),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.check_box),
          //   label: 'Checkbox',
          //   backgroundColor: Color.fromARGB(255, 58, 139, 246), // 🟦
          // ),
        ],
      ),
    );
  }
}

// Halaman pertama (Home)
class Tugas7Flutter extends StatelessWidget {
  const Tugas7Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 165, 137, 240),
      ),
      body: Center(
        // child: Text(

        // ),
      ),
    );
  }
}

// Halaman kedua (Tentang)
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang'),
        backgroundColor: const Color.fromARGB(255, 165, 137, 240),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'aplikasi manajemen tugas yang dirancang untuk membantu pengguna mengatur jadwal harian, membuat daftar tugas, dan mengingatkan deadline dengan cepat serta praktis.',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Nama Pembuat: Mutiara Sa'diyah",
            style: TextStyle(fontSize: 20),
          ),
          Text("Versi: 1.0.0", style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
