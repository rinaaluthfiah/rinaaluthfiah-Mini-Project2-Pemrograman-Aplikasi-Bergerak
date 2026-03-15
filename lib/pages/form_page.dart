import 'package:flutter/material.dart';
import '../models/obat.dart';
import '../models/data_obat.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  final String golongan;
  final Obat? obat;

  const FormPage({super.key, required this.golongan, this.obat});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final namaController = TextEditingController();
  final dosisController = TextEditingController();
  final frekuensiController = TextEditingController();
  final golonganController = TextEditingController();
  final tanggalController = TextEditingController();
  final jamController = TextEditingController();

  String? selectedGolongan;

  Future<void> pilihJam(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    
    if (picked != null) {
      final jam = picked.format(context);

      setState(() {
        jamController.text = jam;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    selectedGolongan = widget.golongan;

    if (widget.obat != null) {
      namaController.text = widget.obat!.nama;
      dosisController.text = widget.obat!.dosis;
      frekuensiController.text = widget.obat!.frekuensi;
      tanggalController.text = widget.obat!.tanggal;
      jamController.text = widget.obat!.jam;
      selectedGolongan = widget.obat!.golongan;
    }
  }

  Future<void> pilihTanggal() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        tanggalController.text =
            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }

  Future<void> simpanData() async {
    if (_formKey.currentState!.validate()) {
      final obatBaru = Obat(
        nama: namaController.text,
        dosis: dosisController.text,
        frekuensi: frekuensiController.text,
        tanggal: tanggalController.text,
        golongan: selectedGolongan!,
        jam: jamController.text,
      );

      final dataObat = Provider.of<DataObat>(context, listen: false);

      if (widget.obat == null) {
        await dataObat.tambah(obatBaru);
      } else {
        await dataObat.edit(widget.obat!, obatBaru);
      }

      if (!mounted) return;

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 201, 136, 158),
        title: Text(widget.obat == null ? "Tambah Obat" : "Edit Obat"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: namaController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: const InputDecoration(
                  labelText: "Nama Obat",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: dosisController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: const InputDecoration(
                  labelText: "Dosis",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: frekuensiController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: const InputDecoration(
                  labelText: "Frekuensi",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: selectedGolongan,
                style: TextStyle(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface, 
                ),
                decoration: InputDecoration(
                  labelText: "Golongan Obat",
                  border: OutlineInputBorder(),
                ),
                dropdownColor: Theme.of(
                  context,
                ).colorScheme.surface, 
                items: const [
                  DropdownMenuItem(
                    value: "Obat Bebas",
                    child: Text("Obat Bebas"),
                  ),
                  DropdownMenuItem(
                    value: "Obat Bebas Terbatas",
                    child: Text("Obat Bebas Terbatas"),
                  ),
                  DropdownMenuItem(
                    value: "Obat Keras",
                    child: Text("Obat Keras"),
                  ),
                  DropdownMenuItem(
                    value: "Obat Herbal",
                    child: Text("Obat Herbal"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedGolongan = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Pilih golongan obat" : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: tanggalController,
                readOnly: true,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: const InputDecoration(
                  labelText: "Tanggal Konsumsi",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: pilihTanggal,
                validator: (value) => value == null || value.isEmpty
                    ? "Tanggal harus dipilih"
                    : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: jamController,
                readOnly: true,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: const InputDecoration(
                  labelText: "Jam Konsumsi",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.access_time),
                ),
                onTap: () => pilihJam(context),
                validator: (value) =>
                    value!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: simpanData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 253, 113, 157),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(widget.obat == null ? "Simpan" : "Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
