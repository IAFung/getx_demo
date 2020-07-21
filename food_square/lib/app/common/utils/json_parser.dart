import 'dart:convert';

import 'package:flutter/services.dart';

class JSONParser {
  static Future<dynamic> getJsonData(String fileName) async {
    final string = await rootBundle.loadString("assets/json/$fileName.json");
    return json.decode(string);
  }
}
