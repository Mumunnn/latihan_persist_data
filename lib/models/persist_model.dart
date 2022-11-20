class PersistModel {
  int? id;
  String? nama, no_hp;

  PersistModel({this.id, this.nama, this.no_hp});

  factory PersistModel.fromJson(Map<String, dynamic> json) {
    return PersistModel(
        id: json['id'], nama: json['nama'], no_hp: json['no_hp']);
  }
}
