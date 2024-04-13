import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HomeViewModel with ChangeNotifier {
  Future<String> _fetchIpInfo() async {
    final response = await http.get(Uri.parse('http://ip-api.com/json'));
    if (response.statusCode == 200) {
      print(response.body);
      var result = jsonDecode(response.body);
      return result;
    } else {
      throw Exception('Failed to load IP info');
    }
  }
}
