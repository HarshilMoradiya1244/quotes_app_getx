import 'package:get/get.dart';
import 'package:quotes_app_getx/utils/share_helper.dart';

class ThemeController extends GetxController{

  bool isLight = true;
  bool changeUI=false;

  void changeThem() async {
    ShareHelper shr = ShareHelper();
    bool? isTheme = await shr.getTheme();
    isLight = isTheme ?? false;
  }

}