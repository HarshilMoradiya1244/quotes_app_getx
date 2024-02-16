import 'package:get/get.dart';
import 'package:quotes_app_getx/model/quotes_model.dart';
import 'package:quotes_app_getx/utils/json_helper.dart';

class HomeController extends GetxController{

  RxList<QuotesModel> quotesList = <QuotesModel>[].obs;

  Future<void> getData()
  async {
    JsonHelper jsonHelper=JsonHelper();
    List<QuotesModel> data = await jsonHelper.dataToList();
    quotesList.value = data;
  }
}