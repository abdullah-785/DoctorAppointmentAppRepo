import 'package:http/http.dart' as http;

class ApiServices {
  String baseUrl = "http://ip-api.com/";
  // Future<void> fetchCountry() async{
  //   var response = await http.get(Uri.parse(baseUrl + "json"));

  //   if(response.statusCode = 200){

  //   }
  // }
  Future<String> _fetchIpInfo() async {
    final response = await http.get(Uri.parse('http://ip-api.com/json'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load IP info');
    }
  }
}
