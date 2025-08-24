import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter_countries/utils/log_utils.dart';

import '../utils/constants.dart';
import 'countries_service.dart';

class CountriesServiceImpl extends CountriesService{

  @override
  Future<List<dynamic>?> getData() async {
    try {
      final response = await html.HttpRequest.getString(Constants.url);
      final data = jsonDecode(response);
      if (data is List) return data;
      return null;
    } catch (e) {
      LogUtils.lodD("Web error: $e");
      return null;
    }
  }
}

//CountriesServiceWeb