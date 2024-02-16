import 'package:flutter/material.dart';
import 'package:quotes_app_getx/screen/detail/view/detail_screen.dart';
import 'package:quotes_app_getx/screen/home/view/home_screen.dart';
import 'package:quotes_app_getx/screen/likedCategory/view/liked_category_screen.dart';
import 'package:quotes_app_getx/screen/liked_quotes/view/liked_quotes_screen.dart';
import 'package:quotes_app_getx/screen/quotes/view/quotes_screen.dart';
import 'package:quotes_app_getx/screen/splash/view/splash_screen.dart';

Map<String,WidgetBuilder> screen_routes = {
  '/':(context) => const SplashScreen(),
  'home':(context) => const HomeScreen(),
  'quotes':(context) => const QuotesScreen(),
  'detail':(context) => const DetailScreen(),
  'likedQuotes':(context) => const LikedQuotesScreen(),
  'likedCategory':(context) => const LikedCategoryScreen(),
};