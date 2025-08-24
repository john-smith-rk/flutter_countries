import 'dart:convert';
import 'dart:io';

import 'package:flutter_countries/utils/constants.dart';

import '../utils/log_utils.dart';
import 'countries_service.dart';

class CountriesServiceImpl extends CountriesService{

   @override
  Future<List<dynamic>?> getData() async {
      final httpClient = HttpClient();
      try {
        final uri = Uri.parse(Constants.url);
        final request = await httpClient.getUrl(uri);
        final response = await request.close();

        if (response.statusCode == 200) {
          final responseBody = await response.transform(utf8.decoder).join();
          final data = jsonDecode(responseBody);

          LogUtils.lodD("Countries data:");
          if (data is List) {
            LogUtils.lodD("Data : $data");
            return data; // ✅ Return JSON list
          } else {
            return null; // Unexpected format
          }
        } else {
          LogUtils.lodD("Error: ${response.statusCode}");
          return null;
        }
      } finally {
        httpClient.close();
      }

  }

}

// CountriesServiceIO