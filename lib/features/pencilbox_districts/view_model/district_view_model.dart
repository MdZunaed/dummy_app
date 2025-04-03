import 'package:dio/dio.dart';
import 'package:dummy_app/common/constants/urls.dart';
import 'package:dummy_app/features/pencilbox_districts/model/district_model.dart';
import 'package:flutter/material.dart';

class DistrictViewModel with ChangeNotifier {
  List<District> districts = [];
  bool loading = false;

  void getDistricts() async {
    loading = true;
    notifyListeners();
    final response = await Dio().get(Urls.districts);
    if (response.statusCode == 200) {
      districts = (response.data as List).map((d) => District.fromJson(d)).toList();
    }
    loading = false;
    notifyListeners();
  }
}
