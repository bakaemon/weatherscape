import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:weatherscape/config.dart';
import 'package:weatherscape/constraints/constraints.dart';

// Future<List<List<String>>> fetchSuggestions(String query) async {
//   var headers = {
//     'X-CSCAPI-KEY': 'RXN4TXQ0NlM3ZEFMeFBMcWt3WTNBOGFrUzc3aVJxNHkwVXV6b1Bxbg=='
//   };
//   // var request = http.Request('GET',
//   //     Uri.parse('https://api.countrystatecity.in/v1/countries/VN/states'));
//   var request = http.Request('GET',
//       Uri.parse('https://api.countrystatecity.in/v1/states'));

//   request.headers.addAll(headers);

//   http.StreamedResponse response = await request.send();
//   if (response.statusCode != 200) {
//     throw Exception('Failed to load suggestions');
//   }
//   log("Got response: ${response.statusCode} as ${response.reasonPhrase}");
//   return response.stream
//       .transform(utf8.decoder)
//       .transform(json.decoder)
//       .expand((body) => (body as List<dynamic>))
//       .map((dynamic item) => [item['name'] as String, item['country_code'] as String])
//       .toList();
// }

// Future<List<List<String>>> fetchSuggestions(String query) {
//   // read the json file current.city.list.json
//   // and return a list of suggestions
//   return rootBundle
//       .loadString('assets/json/current.city.list.json')
//       .then((jsonStr) {
//     final List<dynamic> jsonList = json.decode(jsonStr);
//     return jsonList
//         .map((dynamic item) => [
//               item['name'] as String,
//               item['country'] as String,
//             ])
//         .toList();
//   });
// }


Future<List<List<String>>> fetchSuggestions(String query) {
  // read the json file current.city.list.json
  // and return a list of suggestions
  return rootBundle
      .loadString('assets/json/owm_city_list.json')
      .then((jsonStr) {
    final List<dynamic> jsonList = json.decode(jsonStr)['RECORDS'];
    return jsonList
        .map((dynamic item) => [
              item['owm_city_name'] as String,
              item['country_long'] as String,
            ])
        .toList();
  });
}
