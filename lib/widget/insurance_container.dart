import 'package:flutter/material.dart';
import 'package:insure_marts/util/spacing.dart';
import 'package:insure_marts/util/styles.dart';
import 'package:insure_marts/widget/custom_icon.dart';
import 'package:insure_marts/widget/custom_text_widget.dart';
import 'package:insure_marts/widget/custom_textspan_widget.dart';
import 'package:insure_marts/widget/dot_circle.dart';

class InsuranceContainer extends StatelessWidget {
  final String title, coverNumber, policyYear, image, price;
  final Color backroundColor, borderColor;
  final Function onTap;
  final  iconColor;

  const InsuranceContainer(
      {Key key,
      this.title,
      this.coverNumber,
      this.onTap,
      this.policyYear,
      this.image,
      this.iconColor,
      this.price,
      this.backroundColor,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: backroundColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: borderColor,
                width: 2,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DotCircle(
                  padding: EdgeInsets.all(8),
                  width: 50.0,
                  height: 50.0,
                  widget: Image.asset(
                    '$image',
                    width: 5,
                  ),
                  backgroundColor: Styles.colorWhite),
              horizontalSpaceSmall,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      '$title',
                      textAlign: TextAlign.start,
                      fontSize: 14,
                      color: Styles.colorBlack,
                      fontWeight: FontWeight.bold,
                    ),
                    // verticalSpaceSmall,
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         CustomText(
                    //           'Cover',
                    //           bottomMargin: 2,
                    //           fontSize: 14,
                    //           color: Styles.colorDeepGrey,
                    //         ),
                    //         CustomText(
                    //           '$coverNumber car',
                    //           fontSize: 14,
                    //           color: Styles.colorBlack,
                    //           fontWeight: FontWeight.bold,
                    //         )
                    //       ],
                    //     ),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         CustomText(
                    //           'Policy Term',
                    //           bottomMargin: 2,
                    //           fontSize: 14,
                    //           color: Styles.colorDeepGrey,
                    //         ),
                    //         CustomText(
                    //           '$policyYear year',
                    //           fontSize: 14,
                    //           color: Styles.colorBlack,
                    //           fontWeight: FontWeight.bold,
                    //         )
                    //       ],
                    //     ),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         CustomText(
                    //           'Price',
                    //           bottomMargin: 2,
                    //           fontSize: 14,
                    //           color: Styles.colorDeepGrey,
                    //         ),
                    //         RichText(
                    //           textAlign: TextAlign.center,
                    //           text: customTextSpan(
                    //             text: '$price',
                    //             context: context,
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.bold,
                    //             color: Styles.colorDeepGreen,
                    //             children: <TextSpan>[
                    //               customTextSpan(
                    //                   text: '/year',
                    //                   context: context,
                    //                   fontSize: 14,
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Styles.colorDeepGrey,
                    //                   onTap: () {
                    //                     print('null');
                    //                   }
                    //                   // locator<NavigationService>()
                    //                   //     .navigateToReplacing(OnboardView),
                    //                   ),
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              CustomIcon(
                icon: Icons.check,
                color: iconColor,
               
                size: 23,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
