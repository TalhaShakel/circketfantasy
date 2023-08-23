import 'package:http/http.dart' as http;

class Apiclass {
  Future<void> fetchData() async {
    String baseUrl = 'https://score-line.wecc.in/api/matchs/';
    String apikey = 'd14e5fe6050fda6693e8f658a80879f236e36da3173b4009d56b8100e3782646';
    try {
      final response = await http.get(Uri.parse(baseUrl), headers: {
          'Authorization': 'auth $apikey',
        },);
      

      if (response.statusCode == 200) {
        print("Response: ${response.body}");
      } else {
        print("Request failed with status: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}


