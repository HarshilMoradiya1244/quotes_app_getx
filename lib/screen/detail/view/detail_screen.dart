import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app_getx/model/quotes_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List model = Get.arguments as List;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("${model[1]}"),
        ),
        body: Stack(
          children: [

            Image.asset("${model[0]}",height: MediaQuery.sizeOf(context).height,width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),

          ],
        ),
      ),
    );
  }
}
