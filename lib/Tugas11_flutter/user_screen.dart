import 'package:flutter/material.dart';
import 'package:ppkd_b_3/Tugas10_ParsingData/TextForm.dart';
import 'package:ppkd_b_3/Tugas11_flutter/dbHelperl.dart';
import 'package:ppkd_b_3/Tugas11_flutter/model/model.dart';

class DataKomunitas extends StatefulWidget {
  const DataKomunitas({super.key});

  @override
  _DataKomunitasState createState() => _DataKomunitasState();
}

class _DataKomunitasState extends State<DataKomunitas> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController umurController = TextEditingController();
  final TextEditingController kotaController = TextEditingController();

  List<Anggota> anggota = [];

  @override
  void initState() {
    super.initState();
    getAnggota();
  }

  Future<void> getAnggota() async {
    final dataAnggota = await DbHelper.getAllAnggota();
    setState(() {
      anggota = dataAnggota;
    });
  }

  // Future<void> simpanData() async {
  //   final nama = namaController.text;
  //   final umur = int.tryParse(umurController.text) ?? 0;

  //   if (nama.isNotEmpty && umur > 0) {
  //     await insertUser(DataKomunitas(nama: nama, umur: umur));
  //     namaController.clear();
  //     umurController.clear();
  //     muatData();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormConst(hintText: "Nama", controller: namaController),
            TextFormConst(hintText: "Umur", controller: umurController),
            TextFormConst(hintText: "Kota", controller: kotaController),
            ElevatedButton(
              onPressed: () async {
                final nama = namaController.text.trim();
                final umur = umurController.text.trim();
                final kota = kotaController.text.trim();
                if (nama.isEmpty || umur.isEmpty || kota.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Email, Password, dan Nama tidak boleh kosong",
                      ),
                    ),
                  );

                  return;
                }
                final anggota = Anggota(nama: nama, umur: umur, kota: kota);
                await DbHelper.registerAnggota(anggota);
                Future.delayed(const Duration(seconds: 1)).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Pendaftaran berhasil")),
                  );
                });
                getAnggota();
                setState(() {});
              },
              child: Text("Simpan Data"),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,

              itemCount: anggota.length,
              itemBuilder: (BuildContext context, int index) {
                final dataUserLogin = anggota[index];
                // return ListTile(
                //   title: Text(dataUserLogin.name),
                //   subtitle: Text(dataUserLogin.phone,),

                // );
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.2),
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Color(0xff21BDCA),
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          // spacing: 12,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nama : ${dataUserLogin.nama}"),
                            Text("Umur : ${dataUserLogin.umur}"),

                            Text("Asal Kota : ${dataUserLogin.kota}"),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
