class Obat {
  int? id;
  String nama;
  String dosis;
  String frekuensi;
  String golongan;
  String tanggal;
  String jam;
  bool sudahDiminum;

  Obat({
    this.id,
    required this.nama,
    required this.dosis,
    required this.frekuensi,
    required this.golongan,
    required this.tanggal,
    required this.jam,
    this.sudahDiminum = false,
  });
}
