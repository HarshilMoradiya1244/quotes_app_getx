import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app_getx/screen/liked_quotes/controller/liked_quotes_controller.dart';
import 'package:quotes_app_getx/utils/colorList.dart';
import 'package:quotes_app_getx/utils/db_helper.dart';

class LikedQuotesScreen extends StatefulWidget {
  const LikedQuotesScreen({super.key});

  @override
  State<LikedQuotesScreen> createState() => _LikedQuotesScreenState();
}

class _LikedQuotesScreenState extends State<LikedQuotesScreen> {
  LikedQuotesController controller = Get.put(LikedQuotesController());
  
  @override
  void initState() {
    super.initState();
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Liked Quotes"),
       
      ),
      body: Obx(
            () => ListView.builder(
              itemCount: controller.dataList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.18,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colors[index],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 300,
                            child: Text(
                              "${controller.dataList[index].quotes}",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold,color: Colors.black),
                              overflow: TextOverflow.clip,
                              maxLines: 2,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${controller.dataList[index].author}",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold,color: Colors.black),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () {
                                DBHelper dbHelper = DBHelper();
                                dbHelper.quotesDelete(id:"${controller.dataList[index].id}");
                                controller.getData();
                                Get.snackbar("Delete Successfully", "Delete");
                              },
                              icon: const Icon(Icons.favorite,color: Colors.black,),
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