import 'dart:convert';

import 'package:http/http.dart';

class AppServices {
  String endpoint = "https://reqres.in/api/users?page=2";
  getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
