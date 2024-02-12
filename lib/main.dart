import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quotes_app_getx/utils/app_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: screen_routes,
    ),
  );
}
