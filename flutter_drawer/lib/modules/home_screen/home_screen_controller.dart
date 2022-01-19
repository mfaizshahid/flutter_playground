import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController{
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // Function to open drawer
  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  // Function to close drawer
  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }


}