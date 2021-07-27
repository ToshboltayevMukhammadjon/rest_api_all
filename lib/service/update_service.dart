import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api_all/request/update_request.dart';

class UpdateService {
  Future<bool> login(Update request, int id ) async {
    final response = await http.put(
      Uri.parse("https://cabinet-backend.herokuapp.com/api/Person/Update/$id"),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
      body: jsonEncode(request.toJson()),
    ); print(response.statusCode);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<Update>> getPerson() async {
    final response = await http.get(
      Uri.parse("https://cabinet-backend.herokuapp.com/api/Person/Get"),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<Update> posts = List<Update>.from(
          l.map((model) => Update.fromJson(model)));
      return posts;
    } else {
      return [];
    }
  }

  static Future<bool> update(int id) async {
    final response = await http.put(
      Uri.parse("https://cabinet-backend.herokuapp.com//api/Person/Update/$id"),
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

