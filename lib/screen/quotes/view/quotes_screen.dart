import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app_getx/model/db_model.dart';
import 'package:quotes_app_getx/model/quotes_model.dart';
import 'package:quotes_app_getx/screen/home/controller/home_controller.dart';
import 'package:quotes_app_getx/utils/colorList.dart';
import 'package:quotes_app_getx/utils/db_helper.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  QuotesModel model = Get.arguments;
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("${model.category}"),
          actions: [
            IconButton(
                onPressed: () {
                  // DbModel dbModel = DbModel();
                  // DBHelper dbHelper = DBHelper();
                  // dbHelper.insertCategory();
                },
                icon: const Icon(Icons.favorite_border))
          ],
        ),
        body: ListView.builder(
          itemCount: model.qoutesList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Get.toNamed("detail", arguments: [
                    model.bgImageList[index],
                    model.category,
                    model.qoutesList[index],
                    model.authorList[index],
                    model.id
                  ]);
                },
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.18,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colors[index],
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        "${model.bgImageList[index]}",
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 300,
                              child: Text(
                                "${model.qoutesList[index]}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${model.authorList[index]}",
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                onPressed: () {
                                  DbModel dbModel = DbModel(
                                      author: model.authorList[index],
                                      quotes: model.qoutesList[index],
                                      category: model.category);
                                  DBHelper dbHelper = DBHelper();
                                  dbHelper.insertData(dbModel);
                                  Get.snackbar(
                                      "Add Successfully", "Check In Favorite");
                                },
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
