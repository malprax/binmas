// File: screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'add_profile_screen.dart';
import 'report_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(title: const Text('Binmas ORW')),
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text("Peta Rumah Warga", style: TextStyle(fontSize: 18)),
                const Expanded(child: Placeholder()),
                ...controller.houses.map(
                  (house) => ListTile(
                    leading: const Icon(Icons.location_pin),
                    title: Text(house['nama'] ?? ''),
                    onTap:
                        () => Get.snackbar("Info Rumah", house['nama'] ?? ''),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () => Get.to(() => const AddProfileScreen()),
              child: const Text("Tambah Profil"),
            ),
            TextButton(
              onPressed: () => Get.to(() => const ReportScreen()),
              child: const Text("Lapor"),
            ),
          ],
        ),
      ),
    );
  }
}
