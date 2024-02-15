import 'package:get/get.dart';
import 'package:quotes_app_getx/model/db_model.dart';
import 'package:quotes_app_getx/utils/db_helper.dart';

class LikedCategoryController extends GetxController{

  RxList<DbModel> dataList = <DbModel>[].obs;

  Future<void> getData() async {
    DBHelper helper = DBHelper();
    List<DbModel> data = await helper.readCategory();
    dataList.value = data;
  }
}