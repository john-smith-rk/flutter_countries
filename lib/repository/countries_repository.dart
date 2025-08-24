import 'package:flutter_countries/model/country_data.dart';
import 'package:flutter_countries/service/countries_service_impl.dart';


import '../service/countries_service.dart';

class CountriesRepository{

  static Future<List<CountryData>?> getCountries() async {

    final CountriesService _service = CountriesServiceImpl();

    List<dynamic>? data;
    data = await _service.getData();

    if(data != null) {
      return data.map((e) => CountryData.fromJson(e)).toList();
    }

    return null;
  }

}