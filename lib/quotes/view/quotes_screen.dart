import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app_getx/model/quotes_model.dart';
import 'package:quotes_app_getx/utils/colorList.dart';
import 'package:quotes_app_getx/utils/db_helper.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  QuotesModel model = Get.arguments;
  TextEditingController txtQoutes = TextEditingController();
  TextEditingController txtAuthor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Qoutes"),
        ),
        body: ListView.builder(
          itemCount: model.qoutesList.length,
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
                            "${model.qoutesList[index]}",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                          )),
                      SizedBox(height: 10,),
                      Text("${model.authorList[index]}",style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              onPressed: () {
                                QuotesModel model1 = QuotesModel(qoutesList: [txtQoutes.text], authorList: [txtAuthor.text]);
                                DBHelper dbHelper = DBHelper();
                                dbHelper.insertData(model1);
                              },
                              icon: const Icon(Icons.favorite_border)))
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
