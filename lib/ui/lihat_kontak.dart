import 'package:flutter/material.dart';
import 'package:persist_data/db/database_instance.dart';
import 'package:persist_data/models/persist_model.dart';

class LihatKontak extends StatefulWidget {
  const LihatKontak({Key? key}) : super(key: key);

  @override
  State<LihatKontak> createState() => _LihatKontakState();
}

class _LihatKontakState extends State<LihatKontak> {
  DatabaseInstance? databaseInstance;

  Future _refresh() async {
    setState(() {});
  }

  @override
  void initState() {
    databaseInstance = DatabaseInstance();
    initDatabase();
    super.initState();
  }

  Future initDatabase() async {
    await databaseInstance!.database();
    setState(() {});
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
      appBar: AppBar(
        title: Text("Daftar Kontak"),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: heightDevice = 20,
            ),
            FutureBuilder<List<PersistModel>>(
                future: databaseInstance!.getAll(),
                builder: (context, snapshot) {
                  print('HASIL : ' + snapshot.data.toString());
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  } else {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: Text(snapshot.data![index].nama!),
                                  subtitle: Text(snapshot.data![index].no_hp!));
                            }),
                      );
                    } else {
                      return Text("Tidak ada data");
                    }
                  }
                })
          ],
        )),
      ),
    );
  }
}
