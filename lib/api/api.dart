import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tempalteflutter/models/mymatchmodel.dart';

class Apiclass {
  Future<MatchModel> fetchData() async {
    String baseUrl = 'https://score-line.wecc.in/api/matchs/';
    String apikey =
        'd14e5fe6050fda6693e8f658a80879f236e36da3173b4009d56b8100e3782646';
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'auth': '$apikey',
        },
      );

      var responsedata = jsonDecode(response.body);
      var userdata = MatchModel.fromJson(responsedata);
      return userdata; // Return MatchModel object here
    } catch (error) {
      print("Error: $error");
      throw error; // Rethrow the error
    }
  }
}
