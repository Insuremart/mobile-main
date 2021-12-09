import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insure_marts/core/models/extension_model.dart';
import 'package:insure_marts/util/mock/mockdata.dart';

class ExtensionCtrl extends GetxController {

  // final newdata;
  List<ExtensionName> mockexten;
  var filteredexten;
  ExtensionName excessfilter;

  // var val = ''.obs;

  // @override
  // void onReady() {
  //   // TODO: implement onReady
  //   debugPrint(MockData.mockExtension.toString());
  //   mockexten = MockData.mockExtension
  //       .map<ExtensionName>((json) => ExtensionName.fromJson(json))
  //       .toList();
  //   getExcessFiltered();
  //   debugPrint(excessfilter.toString());
  //   super.onReady();
  // }

  @override
  void onInit() {
    debugPrint(MockData.mockExtension.toString());
    mockexten = MockData.mockExtension
        .map<ExtensionName>((json) => ExtensionName.fromJson(json))
        .toList();
    getExcessFiltered();
    debugPrint(excessfilter.toString());
    debugPrint(excessfilter.option.toString());
    super.onReady();
    // TODO: implement onInit
    super.onInit();
  }

  void getExcessFiltered() {
    excessfilter =
        mockexten.where((i) => i.name == 'Excess Buy Back (EBB)').single;
    // return mockexten.where((i) => i.name == value).single;
  }

  List<ExtensionModel> getOptions(var json) {
    print(json
        .map<ExtensionModel>((json) => ExtensionModel.fromJson(json))
        .toList());
    return json
        .map<ExtensionModel>((json) => ExtensionModel.fromJson(json))
        .toList();
  }

  // void toggleExcess() {
  //   excessbool.value = !excessbool.value;
  // }


}
