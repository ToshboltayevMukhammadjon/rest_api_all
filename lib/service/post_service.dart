import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api_all/request/post_request.dart';

class PostService {
  Future<bool> login(PostRequest request,int id) async {
    final response = await http.post(
      Uri.parse("https://cabinet-backend.herokuapp.com/api/Person/Post"),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
      body: jsonEncode(request.toJson()),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<PostRequest>> getPerson() async {
    final response = await http.get(
      Uri.parse("https://cabinet-backend.herokuapp.com/api/Person/Get"),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<PostRequest> posts = List<PostRequest>.from(
          l.map((model) => PostRequest.fromJson(model)));
      return posts;
    } else {
      return [];
    }
  }

  static Future<bool> delete(int id) async {
    final response = await http.delete(
      Uri.parse("https://cabinet-backend.herokuapp.com/api/Person/Delete/$id"),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
