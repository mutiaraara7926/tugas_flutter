import 'package:flutter/material.dart';

class Tugas5Flutter extends StatefulWidget {
  const Tugas5Flutter({super.key});

  @override
  State<Tugas5Flutter> createState() => _Tugas5FlutterState();
}

class _Tugas5FlutterState extends State<Tugas5Flutter> {
  int counter = 0;
  String name = "lirili larila";
  String text = "okee";
  bool showName = true;
  bool textInkwell = true;
  bool isLiked=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HAI!!!"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(220, 20, 113, 194),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Text(counter.toString(), style: const TextStyle(fontSize: 40)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          counter--;
                        });
                      },
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(width: 20),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          counter++;
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {});
              showName = !showName;
              print("Mutiara");
              print("Mutiara");
            },
            child: Text(showName ? "Sembunyikan" : "Munculkan"),
          ),
          showName ? Text(name, style: TextStyle(fontSize: 30)) : SizedBox(),
          // iconButton
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(width: 20)],
          ),
          IconButton(
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                      if (isLiked) print("Disukai");
                    },
                    icon: const Icon(Icons.favorite, size: 40),
                    color: isLiked ? Colors.pink[500] : Colors.grey,
                  ),

          // textbutton
          TextButton(
            onPressed: () {
              setState(() {});
              textInkwell = !textInkwell;
              print("blablabla");
            },
            child: Text(textInkwell ? "Sembunyikan" : "Lihat Selengkapnya"),
          ),
          textInkwell ? Text(text, style: TextStyle(fontSize: 30)) : SizedBox(),

          InkWell(
            onTap: () {
              setState(() {
                textInkwell = !textInkwell;
              });
              print("Kotak Disentuh");
            },
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/ballerina_capucina-removebg-preview.png",
                  ),
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: textInkwell
                  ? Text("Ballerina Cappucina", style: TextStyle(fontSize: 20))
                  : SizedBox(),
            ),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              print("Ditekan Sekali");
            },
            onDoubleTap: () {
              print("Ditekan Dua Kali");
            },
            onLongPress: () {
              print("Tahan Lama");
            },
            child: Container(
              color: const Color.fromARGB(255, 186, 106, 224),
              height: 30,
              width: double.infinity,
              child: Text("Tekan Aku"),
            ),
          ),
        ],
      ),
    );
  }
}
