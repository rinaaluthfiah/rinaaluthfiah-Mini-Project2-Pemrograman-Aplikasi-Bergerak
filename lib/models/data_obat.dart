import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'obat.dart';

class DataObat extends ChangeNotifier {
  final supabase = Supabase.instance.client;

  List<Obat> semuaObat = [];

  Future<void> ambilData() async {
    final response = await supabase.from('obat').select();

    semuaObat = (response as List).map((data) {
      return Obat(
        id: data['id'],
        nama: data['nama'],
        dosis: data['dosis'],
        frekuensi: data['frekuensi'],
        golongan: data['golongan'],
        tanggal: data['tanggal'],
        jam: data['jam'],
        sudahDiminum: data['sudah_diminum'] ?? false,
      );
    }).toList();

    notifyListeners();
  }


  Future<void> tambah(Obat obat) async {
    try {
      await supabase.from('obat').insert({
        'nama': obat.nama,
        'dosis': obat.dosis,
        'frekuensi': obat.frekuensi,
        'tanggal': obat.tanggal,
        'golongan': obat.golongan,
        'jam': obat.jam,
        'sudah_diminum': obat.sudahDiminum,
      });
      await ambilData();
    } catch (e) {
      debugPrint('ERROR SIMPAN DATA: $e');
    }
  }


  Future<void> hapus(Obat obat) async {
    if (obat.id == null) return;
    await supabase.from('obat').delete().eq('id', obat.id!);

    await ambilData();
  }


  Future<void> toggleMinum(Obat obat) async {
    if (obat.id == null) return;

    await supabase
        .from('obat')
        .update({'sudah_diminum': !obat.sudahDiminum})
        .eq('id', obat.id!);

    await ambilData();
  }


  Future<void> edit(Obat lama, Obat baru) async {
    if (lama.id == null) return;

    await supabase
        .from('obat')
        .update({
          'nama': baru.nama,
          'dosis': baru.dosis,
          'frekuensi': baru.frekuensi,
          'golongan': baru.golongan,
          'tanggal': baru.tanggal,
          'jam': baru.jam,
        })
        .eq('id', lama.id!);

    await ambilData();
  }


  List<Obat> byKategori(String kategori) {
    return semuaObat.where((o) => o.golongan == kategori).toList();
  }

  int totalObat() => semuaObat.length;

  int totalKategori() {
    return semuaObat.map((e) => e.golongan).toSet().length;
  }

  int sudahDiminum() {
    return semuaObat.where((o) => o.sudahDiminum).length;
  }

  int belumDiminum() {
    return semuaObat.where((o) => !o.sudahDiminum).length;
  }


  List<Obat> terbaru() {
    return semuaObat.reversed.take(2).toList();
  }
}
