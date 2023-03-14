import 'dart:convert';

import 'package:countryapi/const.dart';
import 'package:countryapi/model/country.dart';
import 'package:http/http.dart' as http;

class CountryService {
  static var shared = CountryService();

  Future<List<Country>> fetchCountry() async {
    List<Country> countries = [];
    //https://restcountries.com/v2/all
    try {
      final String url = API + "v2/all";
      Uri uri = Uri.parse(url);

      var response = await http.get(uri);
      if (response.statusCode == 200) {
        List<dynamic> arrayJson = jsonDecode(response.body);
        for (var json in arrayJson) {
          var country = Country.fromJSON(json);
          countries.add(country);
        }
        return countries;
      } else {
        return countries;
      }
    } catch (e) {
      return countries;
    }
  }
}
