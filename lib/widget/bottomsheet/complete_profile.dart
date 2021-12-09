import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insure_marts/util/spacing.dart';
import 'package:insure_marts/util/styles.dart';

import '../custom_button4.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height * 0.27,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Styles.colorWhite,
      child: SafeArea(
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
                          text: 'Complete Profile',
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Kindly first go to your profile to update your settings and security requirements',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      // maxLines: 3,
                      // overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.raleway(
                        color: Styles.appBackground,
                        fontSize: 16,
                        // fontWeight: FontWeight.w500,
                        // height: 1.4,
                      ),
                    ),
                  )
                ],
              ),
            ),
            verticalSpaceSmall,
            CustomButton(
              height: 40,
              title: 'GO TO PROFILE',
              fontSize: 17,
              letterSpacing: 0.9,
              
              onPressed: () {},
            )

            // HomePageBox()
          ],
        ),
      ),
    );
  }
}
