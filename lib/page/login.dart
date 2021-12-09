import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rcm_app/constant/constant.dart';
import 'package:rcm_app/controller/loginC.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginC = Get.find();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Form(
              key: loginC.formKey,
              child: Column(
                children: [
                  Image.asset(
                    'assets/image/logo2.png',
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "Aplikasi yang digunakan untuk memantau kerja sensor inspeksi rel kereta api. Aplikasi ini menampilkan pembacaan sensor Ultrasonik, Giroskop dan GPS.",
                    style: GoogleFonts.poppins(
                      color: kSecondColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Divider(
                    height: 2,
                    color: kSecondColor,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: loginC.emailFC,
                    keyboardType: TextInputType.emailAddress,
                    style: GoogleFonts.poppins(
                        color: Colors.grey.withOpacity(0.5), fontSize: 14),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.grey.withOpacity(0.5)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey.withOpacity(0.2))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 1, color: kPrimaryColor)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 1, color: Colors.grey.withOpacity(0.2)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                    cursorColor: kPrimaryColor,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim() == '') {
                        return 'Email masih kosong';
                      }
                      if (!GetUtils.isEmail(value)) {
                        return 'Masukkan email dengan benar';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Obx(() => TextFormField(
                        controller: loginC.passwordFC,
                        keyboardType: TextInputType.text,
                        obscureText: loginC.onShow.value,
                        style: GoogleFonts.poppins(
                            color: Colors.grey.withOpacity(0.5), fontSize: 14),
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: GestureDetector(
                              onTap: () {
                                loginC.showPassword();
                              },
                              child: Icon(
                                loginC.onShow.value
                                    ? Feather.eye
                                    : Feather.eye_off,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ),
                          hintText: "Password",
                          hintStyle: GoogleFonts.poppins(
                              color: Colors.grey.withOpacity(0.5)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 1, color: Colors.grey.withOpacity(0.2)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(width: 1, color: kPrimaryColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 1, color: Colors.grey.withOpacity(0.2)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                        ),
                        cursorColor: kPrimaryColor,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim() == '') {
                            return 'Password masih kosong';
                          }
                          return null;
                        },
                      )),
                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          loginC.pressLogin();
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 80, vertical: 20),
                            elevation: 0,
                            primary: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        child: Text("LOGIN",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
