class PlantModel {
  int? id;
  String? nama;
  String? famili;
  String? gambar;
  String? deskripsi;
  String? manfaat;

  PlantModel(
      {this.id,
      this.nama,
      this.famili,
      this.gambar,
      this.deskripsi,
      this.manfaat});

  PlantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    famili = json['famili'];
    gambar = json['gambar'];
    deskripsi = json['deskripsi'];
    manfaat = json['manfaat'];
  }
}
