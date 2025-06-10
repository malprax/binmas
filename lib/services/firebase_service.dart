// File: services/firebase_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  static Future<List<Map<String, dynamic>>> getHouses() async {
    final snapshot = await _db.collection('houses').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  static Future<void> addHouse(Map<String, dynamic> data) async {
    await _db.collection('houses').add(data);
  }
}
