import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rcm_app/constant/constant.dart';
import 'package:rcm_app/controller/homeC.dart';
import 'package:rcm_app/controller/loginC.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeC = Get.put(HomeController());
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Text(
            'Welcome to RCM',
            style:
                GoogleFonts.poppins(color: kblack, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: GestureDetector(
                onTap: () {
                  bottomSheet();
                },
                child: Icon(
                  Feather.more_vertical,
                  color: kblack,
                ),
              ),
            )
          ],
          bottom: TabBar(
            unselectedLabelColor: kblack,
            indicatorColor: kPrimaryColor,
            labelColor: kPrimaryColor,
            isScrollable: false,
            // ignore: prefer_const_constructors
            labelPadding: EdgeInsets.symmetric(vertical: 10),
            tabs: [
              Text('Ultrasonik',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                  )),
              Text('Giroskop', style: GoogleFonts.poppins(fontSize: 13)),
              Text('GPS', style: GoogleFonts.poppins(fontSize: 13)),
            ],
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            Ultrasonik(),
            Giroskop(),
            GPS(),
          ],
        ),
      ),
    );
  }
}

class GPS extends StatelessWidget {
  const GPS({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeC = Get.find();
    return Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Monitoring Sensor GPS',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              )),
          SizedBox(height: 30),
          Center(
            child: Image.asset(
              'assets/icon/gps.png',
              fit: BoxFit.contain,
              height: 80,
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: Get.width,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kBackgroundColor,
            ),
            child: Column(
              children: [
                Text('Longitude',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                    )),
                SizedBox(
                  height: 10,
                ),
                Obx(() => Text(homeC.longitude.value,
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                    ))),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: Get.width,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kBackgroundColor,
            ),
            child: Column(
              children: [
                Text('Latitude',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                    )),
                SizedBox(
                  height: 10,
                ),
                Obx(() => Text(homeC.latitude.value,
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                    ))),
              ],
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              homeC.navigateTo(double.parse(homeC.latitude.string),
                  double.parse(homeC.longitude.string));
            },
            child: Container(
              width: Get.width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kBackgroundColor,
              ),
              child: Center(
                child: Text(
                  'Lihat Map',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: SizedBox()),
          ElevatedButton(
              onPressed: () {
                homeC.onChangeClick();
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(Get.width, 60),
                  elevation: 0,
                  primary: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: Obx(() => Text(homeC.onClickStart.value ? "STOP" : "START",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )))),
        ],
      ),
    );
  }
}

class Giroskop extends StatelessWidget {
  const Giroskop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeC = Get.find();
    return Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Monitoring Sensor Giroskop',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              )),
          SizedBox(height: 30),
          Center(
            child: Image.asset(
              'assets/icon/giroskop.png',
              fit: BoxFit.contain,
              height: 80,
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: Get.width,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kBackgroundColor,
            ),
            child: Column(
              children: [
                Text('Pitch',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                    )),
                SizedBox(
                  height: 10,
                ),
                Obx(() => Text(homeC.pitch.value,
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                    ))),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: Get.width,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kBackgroundColor,
            ),
            child: Column(
              children: [
                Text('Roll',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                    )),
                SizedBox(
                  height: 10,
                ),
                Obx(() => Text(homeC.roll.value,
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                    ))),
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          ElevatedButton(
              onPressed: () {
                homeC.onChangeClick();
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(Get.width, 60),
                  elevation: 0,
                  primary: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: Obx(() => Text(homeC.onClickStart.value ? "STOP" : "START",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )))),
        ],
      ),
    );
  }
}

class Ultrasonik extends StatelessWidget {
  const Ultrasonik({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeC = Get.find();

    return Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Monitoring Sensor Ultrasonik',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              )),
          SizedBox(height: 30),
          Center(
            child: Image.asset(
              'assets/icon/ultrasonik.png',
              fit: BoxFit.contain,
              height: 80,
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: Get.width,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kBackgroundColor,
            ),
            child: Column(
              children: [
                Text('Tebal Belakang',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                    )),
                SizedBox(
                  height: 10,
                ),
                Obx(() => Text(homeC.belakang.value,
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                    ))),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: Get.width,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kBackgroundColor,
            ),
            child: Column(
              children: [
                Text('Tebal Depan',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                    )),
                SizedBox(
                  height: 10,
                ),
                Obx(() => Text(homeC.depan.value,
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                    ))),
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          ElevatedButton(
              onPressed: () {
                homeC.onChangeClick();
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(Get.width, 60),
                  elevation: 0,
                  primary: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: Obx(() => Text(homeC.onClickStart.value ? "STOP" : "START",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )))),
        ],
      ),
    );
  }
}

Future<dynamic> bottomSheet() {
  final LoginController loginC = Get.find();
  return Get.bottomSheet(
    Container(
      height: Get.height * 0.30,
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 5,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadiusDirectional.circular(5)),
            ),
          ),
          SizedBox(
            height: kDefaultPadding + 10,
          ),
          Center(
            child: Text(
              "Railroad Condition Monitoring",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  color: kblack, fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 2,
            color: Colors.grey.withOpacity(0.2),
            thickness: 2,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Laporkan Masalah",
            style: GoogleFonts.poppins(color: kblack, fontSize: 14),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 2,
            color: Colors.grey.withOpacity(0.1),
            thickness: 2,
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Get.dialog(Center(
                child: Container(
                  height: 150,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Yakin ingin keluar?",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(10),
                                    elevation: 0,
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )),
                                child: Text("Cancel",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                    ))),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  loginC.signOut();
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(10),
                                    elevation: 0,
                                    primary: kPrimaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )),
                                child: Text("Keluar",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
            },
            child: Row(
              children: [
                Icon(Feather.log_out, color: Colors.red),
                SizedBox(width: 10),
                Text(
                  "Keluar",
                  style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          )
        ],
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
      topEnd: Radius.circular(25),
      topStart: Radius.circular(25),
    )),
  );
}
