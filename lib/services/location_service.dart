import 'dart:convert';

import 'package:http/http.dart' as http;

class Locations {
  final String apiKey = '';

  Future<String> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$apiKey';
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    return json;
  }

  // Future<Map<String, dynamic>> getPlace() async {
  //   return 'Try next time';
  // }
}
