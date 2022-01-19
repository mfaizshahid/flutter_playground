import 'package:flutter/material.dart';
import 'package:flutter_drawer/modules/home_screen/home_screen_controller.dart';
import 'package:flutter_drawer/modules/home_screen/home_screen_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const HomeScreenView(),
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
        Get.put<HomeScreenController>(HomeScreenController());
      }),
    );
  }
}
