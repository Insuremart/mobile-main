import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insure_marts/util/spacing.dart';
import 'package:insure_marts/util/styles.dart';
import 'package:insure_marts/widget/custom_button4.dart';

class InsuranceOptions extends StatelessWidget {
  const InsuranceOptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Styles.colorWhite,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.close,
                    color: Styles.colorBlack,
                    size: 20,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'Car Insurance',
                            style: GoogleFonts.raleway(
                              color: Styles.colorBlack,
                              fontSize: 22,

                              fontWeight: FontWeight.w600,
                              // height: 1.4,
                            )),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.close,
                    color: Colors.transparent,
                    size: 20,
                  ),
                ],
              ),
              verticalSpaceMedium,
              CustomButton(
                height: 50,
                title: 'NEW CAR INSURANCE',
                fontSize: 17,
                letterSpacing: 0.9,
                onPressed: () {},
              ),
              verticalSpaceMedium,

              CustomButton(
                height: 50,
                title: 'RENEW EXISTING INSURANCE',
                fontSize: 17,
                letterSpacing: 0.9,
                onPressed: () {},
              ),
              verticalSpaceMedium,

              CustomButton(
                height: 50,
                title: 'GET A PREMIUM QUOTATION',
                fontSize: 17,
                letterSpacing: 0.9,
                onPressed: () {},
              ),

              // HomePageBox()
            ],
          ),
        ),
      ),
    );
  }
}
