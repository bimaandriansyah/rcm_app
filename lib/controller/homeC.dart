import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final databaseReference = FirebaseDatabase.instance.reference();
  var latitude = 0.obs;
  var longitude = 0.obs;

  void readData() {
    print("PRINT A");
    databaseReference.child("GPS").get().then((DataSnapshot snapshot) {
      print(snapshot.value.toString().split(',')[1].split(':')[1]);
    });
  }

  @override
  void onInit() {
    readData();
    super.onInit();
  }
}
