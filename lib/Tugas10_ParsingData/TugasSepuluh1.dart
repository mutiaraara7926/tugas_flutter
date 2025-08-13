// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ppkd_b_3/Tugas10_ParsingData/TextForm.dart';
import 'package:ppkd_b_3/Tugas10_ParsingData/TugasSepuluh2.dart';
import 'package:ppkd_b_3/extension/navigation.dart';
import 'package:ppkd_b_3/praktek_flutter/cobain_cobaaan.dart';
// import 'package:ppkd_b_3/Tugas10_ParsingData/TextForm.dart';

class ParsingData1 extends StatefulWidget {
  const ParsingData1({super.key});

  @override
  State<ParsingData1> createState() => _ParsingData1State();
}

class _ParsingData1State extends State<ParsingData1> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController kotaDomisiliController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 10,
            children: [
              Row(children: [Text("Isi Data Diri Anda")]),
              TextFormConst(
                hintText: " Masukkan Email",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email Tidak boleh kosong";
                  }
                  if (!value.contains("@")) {
                    return "Email tidak valid";
                  }
                  return null;
                },
                controller: emailController,
                onChanged: (p0) {
                  setState(() {});
                },
              ),

              TextFormConst(
                hintText: " Masukkan Nama Anda",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama tidak boleh kosong";
                  }
                  return null;
                },
                controller: nameController,
                onChanged: (p0) {
                  setState(() {});
                },
              ),
              TextFormConst(
                hintText: " Masukkan No.Tlp",
                controller: phoneController,
                onChanged: (p0) {
                  setState(() {});
                },
              ),
              TextFormConst(
                hintText: " Kota Domisili",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama kota tidak boleh kosong";
                  }
                  return null;
                },
                controller: kotaDomisiliController,
                onChanged: (p0) {
                  setState(() {});
                },
              ),
              Text(
                emailController.text,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              Text(
                nameController.text,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                phoneController.text,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                kotaDomisiliController.text,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showSuccessDialog(context, message: 'Berhasil Daftar');

                      Future.delayed(Duration(seconds: 5), () {
                        context.push(
                          Tugassepuluh2(
                            email: emailController.text,
                            name: nameController.text,
                            phone: phoneController.text,
                            kotaDomisili: kotaDomisiliController.text,
                          ),
                        );
                      });
                    }
                  },
                  child: Text("Daftar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
