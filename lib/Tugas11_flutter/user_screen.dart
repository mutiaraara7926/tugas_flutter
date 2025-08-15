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
                      content: Text("Nama, Umur, dan Kota tidak boleh kosong"),
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

                return ListTile(
                  title: Text(dataUserLogin.nama),
                  subtitle: Text(dataUserLogin.kota),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Edit data'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormConst(
                                    controller: namaController
                                      ..text = dataUserLogin.nama,
                                    hintText: 'nama',
                                  ),
                                  SizedBox(height: 12),
                                  TextFormConst(
                                    controller: umurController
                                      ..text = dataUserLogin.umur,
                                    hintText: 'umur',
                                  ),
                                  SizedBox(height: 12),
                                  TextFormConst(
                                    controller: kotaController
                                      ..text = dataUserLogin.kota,
                                    hintText: 'kota',
                                  ),
                                ],
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    final DataKomunitas = Anggota(
                                      id: dataUserLogin.id!,
                                      nama: namaController.text,
                                      umur: umurController.text,
                                      kota: kotaController.text.trim(),
                                    );
                                    DbHelper.updateAnggota(DataKomunitas);
                                    getAnggota();
                                    Navigator.pop(context);
                                  },
                                  child: Text('Simpan'),
                                ),
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Batal'),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          DbHelper.deleteUser(dataUserLogin.id!);
                          getAnggota();
                        },
                        icon: Icon(Icons.delete),
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
