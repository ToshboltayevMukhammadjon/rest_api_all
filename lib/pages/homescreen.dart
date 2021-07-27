import 'package:flutter/material.dart';
import 'package:rest_api_all/pages/delete.dart';
import 'package:rest_api_all/pages/get.dart';
import 'package:rest_api_all/pages/post.dart';
import 'package:rest_api_all/pages/update.dart';
class HomeScreen extends StatelessWidget {
  static final String id = "HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Select any Button "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, PostPage.id);
                },
                child: Text("Post"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Delete.id);
                },
                child: Text("Delete"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, UpdatePage.id);
                },
                child: Text("Update"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, GetPage.id);
                },
                child: Text("Get"),
              ),
            ),
            SizedBox(
              height: 15,
            ),

          ],
        ),
      ),
    );
  }
}
