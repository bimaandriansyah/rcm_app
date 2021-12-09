import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final databaseReference = FirebaseDatabase.instance.reference();
  var latitude = "0".obs;
  var longitude = "0".obs;
  var pitch = "0".obs;
  var roll = "0".obs;
  var belakang = "0".obs;
  var depan = "0".obs;
  var onClickStart = false.obs;

  void onChangeClick() {
    onClickStart.value = !onClickStart.value;
    if (onClickStart.value) {
      Timer.periodic(Duration(seconds: 1), (timer) {
        if (!onClickStart.value) {
          timer.cancel();
        }
        readData();
      });
    } else {
      latitude.value = "0";
      longitude.value = "0";
      pitch.value = "0";
      roll.value = "0";
      belakang.value = "0";
      depan.value = "0";
    }
  }

  void navigateTo(double lat, double lng) async {
    var uri =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$lat,$lng");
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }

  void readData() {
    databaseReference
        .child("GPS")
        .child("f_latitude")
        .get()
        .then((DataSnapshot snapshot) {
      latitude.value = snapshot.value.toString();
    });
    databaseReference
        .child("GPS")
        .child("f_longitude")
        .get()
        .then((DataSnapshot snapshot) {
      longitude.value = snapshot.value.toString();
    });
    databaseReference
        .child("Sensor Gyroscope")
        .child("Pitch")
        .get()
        .then((DataSnapshot snapshot) {
      pitch.value = snapshot.value.toString();
    });
    databaseReference
        .child("Sensor Gyroscope")
        .child("Roll")
        .get()
        .then((DataSnapshot snapshot) {
      roll.value = snapshot.value.toString();
    });
    databaseReference
        .child("Sensor Ultrasonik")
        .child("Sensor Belakang (Tebal)")
        .get()
        .then((DataSnapshot snapshot) {
      belakang.value = snapshot.value.toString();
    });
    databaseReference
        .child("Sensor Ultrasonik")
        .child("Sensor Depan (Tebal)")
        .get()
        .then((DataSnapshot snapshot) {
      depan.value = snapshot.value.toString();
    });
  }
}
