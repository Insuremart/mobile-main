import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insure_marts/ui/car_upload/car_appbar.dart';
import 'package:insure_marts/ui/car_upload/car_upload_screen3.dart';
import 'package:insure_marts/util/spacing.dart';
import 'package:insure_marts/util/styles.dart';
import 'package:insure_marts/widget/car_upload_header.dart';
import 'package:insure_marts/widget/custom_button2.dart';
import 'package:insure_marts/widget/custom_file_uploader/custom_uploader.dart';
import 'package:insure_marts/widget/custom_icon.dart';
import 'package:insure_marts/widget/custom_text_widget.dart';
import 'package:insure_marts/widget/size_calculator.dart';

class CarUploadScreen2 extends StatelessWidget {
  final size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CarAppBar(
          title: 'New Car Insurance',
        ),
      ),
      body: Column(
        children: [
          CarUploadHeader(
            steps: 'step 2 of 6',
            title: 'Upload Car Images',
            indicatorwidth: 0.40,
            forwardOntap: () {
              Get.to(() => CarUploadScreen3());
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => CarUploadScreen3()));
            },
          ),
          verticalSpaceMedium,
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CarUploadScreen3()));
                          },
                          child: CustomText(
                            'Skip',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Styles.colorBlack.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    CustomUploader(
                      imageAsset: 'images/upload.png',
                      title: 'Car Front (optional)',
                      height: size.height,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CarUploadScreen3()));
                      },
                    ),
                    verticalSpaceSmall,
                    CustomUploader(
                      imageAsset: 'images/upload.png',
                      title: 'Car Back (optional)',
                      height: size.height,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CarUploadScreen3()));
                      },
                    ),
                    verticalSpaceSmall,
                    CustomUploader(
                      imageAsset: 'images/upload.png',
                      title: 'Car Right-Side (optional)',
                      height: size.height,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CarUploadScreen3()));
                      },
                    ),
                    verticalSpaceSmall,
                    CustomUploader(
                      imageAsset: 'images/upload.png',
                      title: 'Car Left-Side (optional)',
                      height: size.height,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CarUploadScreen3()));
                      },
                    ),
                    verticalSpaceSmall,
                    CustomUploader(
                      imageAsset: 'images/upload.png',
                      title: 'Car Interior-1 (optional)',
                      height: size.height,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CarUploadScreen3()));
                      },
                    ),
                    verticalSpaceSmall,
                    CustomUploader(
                      imageAsset: 'images/upload.png',
                      title: 'Car Interior-2 (optional)',
                      height: size.height,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CarUploadScreen3()));
                      },
                    ),
                    verticalSpaceSmall,
                    CustomUploader(
                      imageAsset: 'images/upload.png',
                      title: 'Car Interior-3(optional)',
                      height: size.height,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CarUploadScreen3()));
                      },
                    ),
                    verticalSpaceSmall,
                    CustomButton(
                      title: 'CONTINUE',
                      fontSize: 12,
                      height: 50,
                      buttonColor: Styles.appBackground2,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CarUploadScreen3()));
                      },
                    ),
                    verticalSpaceSmall,
                    CustomButton(
                      title: 'SAVE & CONTINUE LATER',
                      fontSize: 12,
                      height: 50,
                      textColor: Styles.appBackground2,
                      buttonColor: Styles.colorWhite,
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => CarUploadScreen2()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
