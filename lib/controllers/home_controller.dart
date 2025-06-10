// File: controllers/home_controller.dart
import 'package:get/get.dart';
import '../services/firebase_service.dart';

class HomeController extends GetxController {
  final houses = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadHouses();
  }

  void loadHouses() async {
    houses.value = await FirebaseService.getHouses();
  }

  void addHouse(Map<String, dynamic> house) async {
    await FirebaseService.addHouse(house);
    loadHouses();
  }
}
