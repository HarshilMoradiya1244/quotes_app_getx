import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app_getx/home/controller/home_controller.dart';
import 'package:quotes_app_getx/utils/colorList.dart';
import 'package:quotes_app_getx/utils/db_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.getData();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Welcome To Quotes"),
          actions: [
            IconButton(
                onPressed: () {

                }, icon: const Icon(Icons.favorite_border))
          ],
        ),
        body: Column(
          children: [
            const Text("Choose Your Category",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Expanded(
              child: ListView.builder(
                itemCount: controller.quotesList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: (){
                        Get.toNamed("quotes",arguments: controller.quotesList[index]);
                      },
                      child: Container(
                        height: MediaQuery.sizeOf(context).height*0.1,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:colors[index],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("${controller.quotesList[index].category}",style: const TextStyle(fontSize: 15,fontWeight:FontWeight.bold),),
                              const Spacer(),
                              Image.asset("${controller.quotesList[index].image}",height: 50,width: 50,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
