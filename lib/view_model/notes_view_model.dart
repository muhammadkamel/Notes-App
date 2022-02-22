import 'dart:convert';
import 'package:http/http.dart' as http;

import '../view/shared/constains.dart';

class NotesViewModel {
  static Future<List<dynamic>> getAllNotes() async {
    List<dynamic> allNotes = [];
    var notes = "$baseUrl/notes/getall";
    var respone = await http.get(Uri.parse(notes));
    if (respone.statusCode == 200) {
      allNotes = jsonDecode(respone.body);
    }
    return allNotes;
  }

  static Future<http.Response> updateNote(String text, String userId) async {
    var update = "$baseUrl/notes/update";

    var respone = await http.post(
      Uri.parse(update),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(
        <String, dynamic>{
          "Id": "0",
          "Text": text,
          "UserId": "1",
          "PlaceDateTime": "2021-11-18T09:39:44",
        },
      ),
    );
    return respone;
  }

  static Future clearAllNotes() async {
    var clear = "$baseUrl/notes/clear";
    var respone = await http.post(Uri.parse(clear));
    return respone;
  }
}
