import 'package:color_thief_flutter/color_thief_flutter.dart';
import 'package:flutter/material.dart';
import 'package:insure_marts/controllers/carinsurance_ctrl.dart/insurancecompanyctrl.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:get/get.dart';

class Screen5Controller extends GetxController {
  var imgs = ''.obs;
  var color = Colors.transparent.obs;
  var newimg;

  // void getColor() {
  //   getColorFromImage(image).then((color) {
  //     print(color);
  //     // return color; // [R,G,B]
  //   });
  // }

  @override
  void onReady() async {
    // newimg = '';
    // newimg = Get.find<CompanyController>().imgstr.value;
    // debugPrint('New Image');
    // debugPrint(newimg.toString());
    color.value = await _updatePaletteGenerator(Get.find<CompanyController>().imgstr.value);
    debugPrint('Color from Pallete');
    debugPrint(color.value.toString());
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() async {
    // newimg = '';
    // newimg = Get.find<CompanyController>().imgstr.value;
    // debugPrint('New Image');
    // debugPrint(newimg.toString());
    color.value = await _updatePaletteGenerator(Get.find<CompanyController>().imgstr.value);
    debugPrint('Color from Pallete');
    debugPrint(color.value.toString());
    //debugPrint(MockData.mockExtension.toString());

    super.onInit();
  }

  Future<Color> _updatePaletteGenerator(String imgstr) async {
    imgs.value = '';
    imgs.value = imgstr;
    var paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.asset(imgstr).image,
    );
    return paletteGenerator.darkMutedColor != null
        ? paletteGenerator.darkMutedColor.color
        : paletteGenerator.darkVibrantColor != null
            ? paletteGenerator.darkVibrantColor.color
            : paletteGenerator.lightVibrantColor.color;
  }
}
