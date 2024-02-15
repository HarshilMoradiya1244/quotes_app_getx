import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quotes_app_getx/utils/app_routes.dart';
import 'package:quotes_app_getx/utils/app_theme.dart';
import 'package:quotes_app_getx/utils/theme_controller.dart';

ThemeController controller = Get.put(ThemeController());
void main() {
  runApp(
    Obx(() {
      controller.changeThem();
      return  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: screen_routes,
        theme: controller.isLight.value?darkTheme:lightTheme,
      );
    },
    ),
  );
}
