import 'package:flutter/material.dart';
import 'package:rest_api_all/pages/delete.dart';
import 'package:rest_api_all/pages/get.dart';
import 'package:rest_api_all/pages/homescreen.dart';
import 'package:rest_api_all/pages/post.dart';
import 'package:rest_api_all/pages/update.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:HomeScreen(),
      routes: {
        HomeScreen.id:(context) => HomeScreen(),
        PostPage.id:(context) => PostPage(),
        Delete.id:(context) => Delete(),
        GetPage.id:(context) => GetPage(),
        UpdatePage.id:(context) =>UpdatePage(),
      }
    );
  }
}