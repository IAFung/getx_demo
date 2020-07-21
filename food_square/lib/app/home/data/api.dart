import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

const baseUrl = "https://jsonplaceholder.typicode.com/posts/";

class MyApiClient {
  final Dio httpClient;
  MyApiClient({@required this.httpClient});

  getAll() async {
    try {
      var response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.data);
        List listMyModel = jsonResponse['data'];
        return listMyModel;
      } else
        print('erro -get');
    } catch (_) {}
  }
}
