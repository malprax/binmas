// File: screens/report_screen.dart
import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String? selectedIssue;
  final issues = ["Sampah tidak diambil", "Jalan berlubang", "Keributan warga"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Laporan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (final issue in issues)
              RadioListTile(
                title: Text(issue),
                value: issue,
                groupValue: selectedIssue,
                onChanged: (value) => setState(() => selectedIssue = value as String?),
              ),
            ElevatedButton(
              onPressed: () {
                if (selectedIssue != null) {
                  // save to Firebase
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Laporan "$selectedIssue" terkirim!")),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text("KIRIM"),
            ),
          ],
        ),
      ),
    );
  }
}