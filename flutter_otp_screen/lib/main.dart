import 'package:flutter/material.dart';
import 'package:flutter_otp_screen/modules/otp/otp_controller.dart';
import 'package:flutter_otp_screen/modules/otp/otp_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const OtpView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      ),
      themeMode: ThemeMode.system,
      initialBinding: BindingsBuilder(() {
        Get.put<OtpController>(OtpController());
      }),
    );
  }
}
