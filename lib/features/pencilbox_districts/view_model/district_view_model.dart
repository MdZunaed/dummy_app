import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dummy_app/common/constants/urls.dart';
import 'package:dummy_app/features/pencilbox_districts/model/district_model.dart';
import 'package:flutter/material.dart';

class DistrictViewModel with ChangeNotifier {
  List<District> districts = [];
  bool loading = false;

  void getDistricts() async {
    try {
      loading = true;
      notifyListeners();
      final response = await Dio().get(Urls.districts);
      if (response.statusCode == 200) {
        log("message========> ${response.data}");
        districts = (jsonDecode(response.data) as List).map((d) => District.fromJson(d)).toList();
      }
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
