import 'package:flutter/material.dart';
import 'package:persist_data/ui/tambah_lihat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Daftar Kontak",
      home: TambahLihat(),
    );
  }
}
