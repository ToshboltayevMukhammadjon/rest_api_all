import 'package:flutter/material.dart';
import 'package:rest_api_all/request/get_request.dart';
import 'package:rest_api_all/service/get_service.dart';


class GetPage extends StatelessWidget {
  static final String id = "GetPage";
  const GetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Data'),
      ),
      body: ListView(
        children: [
          FutureBuilder<List<Get>>(
            future: fetchAlbum(),
            builder: (context, dat) {
              if (dat.hasData && dat.data!.isNotEmpty) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: dat.data!.length,
                    itemBuilder: (context, index) {
                      return SizedBox( height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(dat.data![index].id.toString()),
                              Text(dat.data![index].firstName.toString()),
                              Text(dat.data![index].lastName.toString()),
                              Text(dat.data![index].username.toString()),
                              Text(dat.data![index].phone.toString()),
                              Text(dat.data![index].carID.toString()),
                            ],
                          ),
                        ),
                      );
                    });
              } else if (dat.hasError) {
                return Text("${dat.error}");
              } else if (dat.data != null) {
                return Center(
                  child: Text('Empty page'),
                );
              } else if (dat.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
