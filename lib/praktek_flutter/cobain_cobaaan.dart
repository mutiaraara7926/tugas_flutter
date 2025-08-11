import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showSuccessDialog(BuildContext context, {required String message}) {
  showDialog(
    context: context,
    barrierDismissible: true, // bisa ditutup dengan tap di luar
    barrierColor: Colors.black54, // semi transparan di belakang
    builder: (context) {
      // Timer auto close
      Future.delayed(Duration(seconds: 4), () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      });

      return Center(
        child: Material(
          color: Colors.transparent, // biar nggak ada background putih
          child: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Lottie animation loop non-active
                Lottie.asset(
                  'assets/lottie/Success.json',
                  width: 150,
                  height: 150,
                  repeat: false,
                  animate: true,
                ),
                SizedBox(height: 8),
                Text(
                  'Success!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 12, 51, 141),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

class CobainCobaaan extends StatefulWidget {
  const CobainCobaaan({super.key});

  @override
  State<CobainCobaaan> createState() => _Tugas6State();
}

class _Tugas6State extends State<CobainCobaaan> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(245, 7, 35, 89),
      ),
      body: Container(
        color: const Color.fromARGB(245, 7, 35, 89),
        child: Padding(
          padding: EdgeInsetsGeometry.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hello welcome Back",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Welcome back please",
                style: TextStyle(
                  fontSize: 14,
                  color: const Color.fromARGB(155, 216, 207, 207),
                ),
              ),
              Text(
                "sign in again",
                style: TextStyle(
                  fontSize: 14,
                  color: const Color.fromARGB(155, 216, 207, 207),
                ),
              ),
              SizedBox(height: 10),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    spacing: 12,
                    children: [
                      TextFormField(
                        style: TextStyle(color: Color(0xFFFFFFFF)),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),

                          hint: Text(
                            "Email",
                            style: TextStyle(color: Colors.white),
                          ),
                          hintStyle: TextStyle(color: Color(0xFFFFFFFF)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email Tidak boleh kosong";
                          }
                          if (!value.contains("@")) {
                            return "Email tidak valid";
                          }
                          return null;
                        },
                      ),

                      TextFormField(
                        style: TextStyle(color: Color(0xFFFFFFFF)),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hint: Text(
                            "Password",
                            style: TextStyle(color: Colors.white),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password salah";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 327,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              249,
                              249,
                              249,
                            ),
                            foregroundColor: const Color.fromARGB(
                              245,
                              7,
                              35,
                              89,
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(content: Text("Login Berhasil")),
                              // );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CobainCobaaan(),
                                ),
                              );
                              showSuccessDialog(
                                context,
                                message: 'Succesful login',
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Login Gagal"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("Email atau Password salah"),
                                        SizedBox(height: 20),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          },

                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(245, 7, 35, 89),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 25),
                      Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsetsGeometry.all(10),
                            child: Text(
                              "or",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),

                      SizedBox(
                        width: 327,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              29,
                              52,
                              107,
                            ),
                            foregroundColor: const Color.fromARGB(
                              255,
                              255,
                              255,
                              255,
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Koneksi Terputus")),
                              );
                            }
                          },
                          child: Text("Facebook"),
                        ),
                      ),
                      SizedBox(
                        width: 327,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              29,
                              52,
                              107,
                            ),
                            foregroundColor: const Color.fromARGB(
                              255,
                              255,
                              255,
                              255,
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Koneksi Terputus")),
                              );
                            }
                          },
                          child: Text("Gmail"),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text.rich(
                        TextSpan(
                          text: "Don't have account?",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("Sign up Tapped");
                                },
                              text: "Sign Up",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 66, 133, 244),
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class pagesetelahnya extends StatefulWidget {
  const pagesetelahnya({super.key});

  @override
  State<pagesetelahnya> createState() => _pagesetelahnyaState();
}

class _pagesetelahnyaState extends State<pagesetelahnya> {
  int counter = 0;
  String name = "lirili larila";
  String text = "okee";
  bool showName = true;
  bool textInkwell = true;
  bool isLiked = true;
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
