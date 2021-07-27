import 'package:flutter/material.dart';
import 'package:rest_api_all/request/post_request.dart';
import 'package:rest_api_all/service/post_service.dart';
class Delete extends StatefulWidget {
  static final String id = "Delete";
  const Delete({Key? key}) : super(key: key);

  @override
  _DeleteState createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete Data"),
      ),
      body: FutureBuilder<List<PostRequest>>(
          future: PostService.getPerson(),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(snapshot.data![index].firstName!),
                        IconButton(
                          onPressed: () async {
                            final result = await PostService.delete(
                              snapshot.data![index].id!,
                            );
                            if (result) {
                              setState(() {});
                            }
                          },
                          icon: Icon(Icons.delete),
                        )
                      ],
                    ),
                  );
                },
              );
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return SizedBox();
          }),
    );
  }
}
