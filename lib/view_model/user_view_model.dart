import 'dart:convert';

import 'package:http/http.dart' as http;

import '../view/shared/constains.dart';

class UsersViewModel {
  static Future<List<dynamic>> getAllUsers() async {
    List<dynamic> allUsers = [];
    var users = "$baseUrl/users/getall";
    var respone = await http.get(Uri.parse(users));
    if (respone.statusCode == 200) {
      allUsers = jsonDecode(respone.body);
    }
    return allUsers;
  }

  static Future clearAllNotes() async {
    var clear = "$baseUrl/notes/clear";
    var respone = await http.post(Uri.parse(clear));
    return respone.body;
  }
}
