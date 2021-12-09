import 'package:flutter/material.dart';
import 'package:insure_marts/util/spacing.dart';
import 'package:insure_marts/util/styles.dart';
import 'package:insure_marts/widget/custom_text_widget.dart';

class CustomUploader extends StatelessWidget {
  const CustomUploader({
    Key key,
    this.focusNode,
    this.labelText,
    this.titleColor,
    this.height,
    this.imageAsset,
    this.onPressed,
    this.title,
  })  : assert(imageAsset != null),
        super(key: key);

  final FocusNode focusNode;
  final Color titleColor;
  final double height;
  final Function() onPressed;
  final String imageAsset;
  final String labelText, title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomText(
              title,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: titleColor ?? Styles.colorBlack.withOpacity(0.8),
            ),
          ],
        ),
        verticalSpaceTiny,
        verticalSpaceTiny,
        GestureDetector(
          onTap: onPressed,
          child: Container(
              height: height != null ? height * 0.12 : 90,
              decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xffCCCCCC))
                  // boxShadow: WidgetsBinding.instance.window.viewInsets.bottom != 0
                  //     ? null
                  //     : const <BoxShadow>[
                  //   BoxShadow(
                  //     blurRadius: 5.0,
                  //     color: Color(0x10000000),
                  //     spreadRadius: 5.0,
                  //     offset: Offset(3.5, 5.0),
                  //   ),
                  // ]
                  ),
              child: Stack(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          imageAsset,
                          height: 30,
                          width: 30,
                        ),
                        horizontalSpaceTiny,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              'Upload File',
                              fontSize: 14,
                              color: Color(0xffCCCCCC),
                            ),
                            verticalSpaceTiny,
                            CustomText(
                              'png-jpg-mp4',
                              fontSize: 13,
                              color: Color(0xffCCCCCC),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
