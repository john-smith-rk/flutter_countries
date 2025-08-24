import 'package:flutter_countries/repository/countries_repository.dart';

import 'model/country_data.dart';

class FlutterCountriesUtilities{

  static Future<List<CountryData>?> getCountries() async {
    return await CountriesRepository.getCountries();
  }

}