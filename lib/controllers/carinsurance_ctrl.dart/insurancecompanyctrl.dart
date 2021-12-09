import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insure_marts/core/models/companymodel.dart';
import 'package:insure_marts/util/mock/mockdata.dart';

class CompanyController extends GetxController {
  List<Company> mockcompany;
  var selected = (-1).obs;
  var imgstr = ''.obs;

  @override
  void onInit() {
    debugPrint(MockData.insuranceCompanies.toString());
    mockcompany = MockData.insuranceCompanies
        .map<Company>((json) => Company.fromJson(json))
        .toList();

    super.onInit();
  }

  void selectCompany({int value, String imgvalue}) {
    selected.value = value;
    imgstr.value = '';
    imgstr.value = imgvalue;
    debugPrint('New Image from 4 ');
    debugPrint(imgstr.value);
  }

  void removeCompany(int value, String imgvalue) {
    selected.value = (-1);
    // imgstr.value = '';
  }
}
