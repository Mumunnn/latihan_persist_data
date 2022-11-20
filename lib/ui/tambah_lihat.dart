import 'package:flutter/material.dart';
import 'package:persist_data/ui/lihat_kontak.dart';
import 'package:persist_data/ui/tambah_kontak.dart';

class TambahLihat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double heightDevice = MediaQuery.of(context).size.height;
    double paddingTop = MediaQuery.of(context).padding.top;
    double paddingBottom = MediaQuery.of(context).padding.bottom;
    double paddingLeft = MediaQuery.of(context).padding.left;
    double paddingRight = MediaQuery.of(context).padding.right;
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: paddingTop = 80),
          child: Column(
            children: [
              Container(
                width: widthDevice = 200,
                height: heightDevice = 45,
                child: ElevatedButton(
                  child: Text("Tambah Kontak"),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return TambahKontak();
                    }));
                  },
                ),
              ),
              SizedBox(
                height: heightDevice = 20,
              ),
              Container(
                width: widthDevice = 200,
                height: heightDevice = 45,
                child: ElevatedButton(
                  child: Text("Lihat Kontak"),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return LihatKontak();
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
