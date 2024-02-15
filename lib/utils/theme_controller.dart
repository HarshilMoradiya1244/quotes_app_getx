import 'package:get/get.dart';
import 'package:quotes_app_getx/utils/share_helper.dart';

class ThemeController extends GetxController{

  RxBool isLight = true.obs;

  void changeThem() async {
    ShareHelper shr = ShareHelper();
    bool? isTheme = await shr.getTheme();
    isLight.value = isTheme ?? false;
  }

}