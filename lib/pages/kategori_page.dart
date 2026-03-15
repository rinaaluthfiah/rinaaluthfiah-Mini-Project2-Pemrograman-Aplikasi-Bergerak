import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/data_obat.dart';
import '../models/obat.dart';
import 'home_page.dart';
import '../main.dart';

class KategoriPage extends StatelessWidget {
  const KategoriPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataObat = Provider.of<DataObat>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: Theme.of(context).brightness == Brightness.dark
                ? [const Color(0xFF1E1E1E), const Color(0xFF2C2C2C)]
                : [
                    const Color.fromARGB(255, 241, 218, 231),
                    const Color.fromARGB(255, 243, 216, 238),
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: ListView(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(254, 199, 223, 1),
                    Color.fromARGB(255, 237, 153, 200),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "HealthTracker 💊",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 216, 114, 160),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Catatan Konsumsi Obatmu",
                        style: TextStyle(
                          color: Color.fromARGB(255, 250, 248, 249),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Theme.of(context).brightness == Brightness.dark
                            ? Icons.light_mode
                            : Icons.dark_mode,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (Theme.of(context).brightness == Brightness.dark) {
                          MyApp.setTheme(context, ThemeMode.light);
                        } else {
                          MyApp.setTheme(context, ThemeMode.dark);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _infoBox(
                          "Total Obat",
                          dataObat.totalObat().toString(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _infoBox(
                          "Kategori",
                          dataObat.totalKategori().toString(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  pengingatObat(dataObat),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Riwayat Terakhir",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  const SizedBox(height: 10),
                  ...dataObat.terbaru().map((e) => _riwayat(e)),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
                children: [
                  _kategoriBox(
                    context,
                    "Obat Bebas",
                    const Color(0xFF5FA77B),
                    Icons.medication,
                  ),

                  _kategoriBox(
                    context,
                    "Obat Bebas Terbatas",
                    const Color(0xFFE58E3A),
                    Icons.warning_amber_rounded,
                  ),

                  _kategoriBox(
                    context,
                    "Obat Keras",
                    const Color(0xFFE05C65),
                    Icons.local_hospital,
                  ),

                  _kategoriBox(
                    context,
                    "Obat Herbal",
                    const Color(0xFF6BBF7B),
                    Icons.spa,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget pengingatObat(DataObat dataObat) {
  final belum = dataObat.semuaObat
      .where((o) => o.sudahDiminum == false)
      .toList();

  if (belum.isEmpty) return const SizedBox();
  final obat = belum.first;
  return Container(
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 233, 188, 213),
          Color.fromARGB(255, 240, 186, 230),
        ],
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        const Icon(Icons.notifications_active, color: Colors.white, size: 40),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pengingat Obat",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "${obat.nama} - Jam ${obat.jam}",
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _infoBox(String title, String value) {
  return Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
    ),
    child: Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(title),
      ],
    ),
  );
}

Widget _riwayat(Obat obat) {
  return Container(
    margin: const EdgeInsets.only(bottom: 8),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(obat.nama), Text(obat.tanggal)],
    ),
  );
}

Widget _kategoriBox(
  BuildContext context,
  String title,
  Color warnaIcon,
  IconData icon,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => HomePage(golongan: title)),
      );
    },
    child: Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD6EC),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: warnaIcon.withOpacity(0.15),
              ),
              child: Icon(icon, size: 30, color: warnaIcon),
            ),

            const SizedBox(height: 10),

            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: warnaIcon,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
