import 'dart:convert';

import 'package:blackrock_task/utils/app_constants.dart';
import 'package:flutter/services.dart';

abstract class DataSource {
  Future<dynamic> getTravelInspiration();
}

class DataSourceImpl implements DataSource {
  @override
  Future<dynamic> getTravelInspiration() async {
    final String jsonString = await rootBundle.loadString(AppConstants.dataPath);
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    return jsonData;
  }
}
