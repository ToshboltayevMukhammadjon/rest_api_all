import 'dart:convert';
import 'package:http/http.dart';
import 'package:rest_api_all/request/get_request.dart';
Future<List<Get>> fetchAlbum() async {
  final response =
  await get(Uri.parse("https://cabinet-backend.herokuapp.com/api/Person/Get"));
  if (response.statusCode == 200) {
    Iterable l = json.decode(response.body);
    List<Get> posts = List<Get>.from(
        l.map((model) => Get.fromJson(model)));
    return posts;
  } else {
    return [];
  }
}