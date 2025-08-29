import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ppkd_b_3/extension/navigation.dart';
import 'package:ppkd_b_3/shared_preference/shared_preference.dart';
import 'package:ppkd_b_3/tugas15_flutter/api/register_user.dart';
import 'package:ppkd_b_3/tugas15_flutter/model/register_model.dart';
import 'package:ppkd_b_3/tugas15_flutter/view/dashboard.dart';
import 'package:ppkd_b_3/tugas15_flutter/view/register_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showSuccessDialog(BuildContext context, {required String message}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black54,
    builder: (context) {
      Future.delayed(Duration(seconds: 3), () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      });

      return Center(
        child: Material(
          color: Colors.transparent,
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
                Lottie.asset(
                  'assets/lottie/sus.json',
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

class Login extends StatefulWidget {
  const Login({super.key});
  static const id = "/login";
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisibility = false;
  final _formKey = GlobalKey<FormState>();
  Future<void> _saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("userName", name);
  }

  //fungsi untuk cek data register
  RegisterUserModel? user;
  String? errorMessage;
  // bool isVisibility = false;
  bool isLoading = false;
  void loginUser() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email, dan Password tidak boleh kosong")),
      );
      isLoading = false;

      return;
    }
    try {
      final result = await AuthenticationAPI.loginUser(
        email: email,
        password: password,
      );
      setState(() {
        user = result;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Login berhasil")));
      PreferenceHandler.saveToken(user?.data?.token.toString() ?? "");
      context.pushReplacementNamed(Dashboard.id);
      print(user?.toJson());
    } catch (e) {
      print(e);
      setState(() {
        errorMessage = e.toString();
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage.toString())));
    } finally {
      setState(() {});
      isLoading = false;
    }
    // final user = User(email: email, password: password, name: name);
    // await DbHelper.registerUser(user);
    // Future.delayed(const Duration(seconds: 1)).then((value) {
    //   isLoading = false;
    //   ScaffoldMessenger.of(
    //     context,
    //   ).showSnackBar(const SnackBar(content: Text("Pendaftaran berhasil")));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(245, 41, 89, 121),
      ),
      body: Container(
        color: const Color.fromARGB(245, 41, 89, 121),
        child: Padding(
          padding: EdgeInsetsGeometry.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hello",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 35),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    spacing: 12,
                    children: [
                      TextFormField(
                        controller: emailController,
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
                          if (!(value.endsWith("@gmail.com") ||
                              value.endsWith("@yahoo.com"))) {
                            return "Email tidak terdaftar";
                          }
                          if (RegExp('[A-Z]').hasMatch(value)) {
                            return "Email harus huruf kecil";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 35),
                      TextFormField(
                        controller: passwordController,
                        obscureText: !isVisibility,
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
                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisibility
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.amberAccent,
                            ),
                            onPressed: () {
                              setState(() {
                                isVisibility = !isVisibility;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password salah";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 75),
                      SizedBox(
                        width: 327,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amberAccent,
                            // foregroundColor: Colors.amber,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              loginUser();
                              // pakai fungsi login baru
                            }
                          },

                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(245, 41, 89, 121),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
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

                      SizedBox(height: 50),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterApi(),
                                    ),
                                  );
                                },
                              text: "Sign Up",
                              style: TextStyle(
                                color: Colors.amberAccent,
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
