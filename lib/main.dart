import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rcm_app/controller/loginC.dart';
import 'package:rcm_app/page/home.dart';
import 'package:rcm_app/page/login.dart';
import 'package:rcm_app/route/pages.dart';
import 'package:rcm_app/themes/theme.dart';
import 'package:rcm_app/utils/circleLoading.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LoginController loginC = Get.put(LoginController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: loginC.authStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active)
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              // initialRoute:
              //     snapshot.data != null ? AppPages.Home : AppPages.Login,
              getPages: AppRoutes.pages,
              theme: appTheme(),
              home: snapshot.data != null ? HomePage() : LoginPage(),
              defaultTransition: Transition.cupertino,
            );

          return LoadingCircle();
        });
  }
}
