import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_registration/modules/profile_registration/profile_registration_controller.dart';
import 'package:profile_registration/modules/profile_registration/profile_registration_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const ProfileRegistrationScreen(),
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
        Get.put<ProfileRegistrationScreenController>(
            ProfileRegistrationScreenController());
      }),
    );
  }
}
