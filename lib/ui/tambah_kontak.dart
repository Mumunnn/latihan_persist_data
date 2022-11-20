import 'package:flutter/material.dart';
import 'package:persist_data/db/database_instance.dart';

class TambahKontak extends StatefulWidget {
  const TambahKontak({Key? key}) : super(key: key);

  @override
  State<TambahKontak> createState() => _TambahKontakState();
}

class _TambahKontakState extends State<TambahKontak> {
  DatabaseInstance databaseInstance = DatabaseInstance();
  TextEditingController namaController = TextEditingController();
  TextEditingController noHpController = TextEditingController();

  @override
  void initState() {
    databaseInstance.database();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double heightDevice = MediaQuery.of(context).size.height;
    double paddingTop = MediaQuery.of(context).padding.top;
    double paddingBottom = MediaQuery.of(context).padding.bottom;
    double paddingLeft = MediaQuery.of(context).padding.left;
    double paddingRight = MediaQuery.of(context).padding.right;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(
            top: paddingTop = 50,
            left: paddingLeft = 40,
            right: paddingRight = 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama"),
            TextField(
              controller: namaController,
            ),
            SizedBox(
              height: heightDevice = 40,
            ),
            Text("No HP"),
            TextField(
              controller: noHpController,
            ),
            SizedBox(
              height: heightDevice = 60,
            ),
            Center(
              child: Container(
                width: widthDevice = 200,
                height: heightDevice = 45,
                child: ElevatedButton(
                    onPressed: () async {
                      int idInsert = await databaseInstance.insert({
                        'nama': namaController.text,
                        'no_hp': noHpController.text,
                      });
                      print("sudah masuk : " + idInsert.toString());
                      Navigator.pop(context);
                    },
                    child: Text("Simpan")),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
