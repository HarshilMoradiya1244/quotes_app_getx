import 'package:flutter/material.dart';
import 'package:quotes_app_getx/home/view/home_screen.dart';
import 'package:quotes_app_getx/quotes/view/quotes_screen.dart';

Map<String,WidgetBuilder> screen_routes = {
  '/':(context) => const HomeScreen(),
  'quotes':(context) => const QuotesScreen(),
};