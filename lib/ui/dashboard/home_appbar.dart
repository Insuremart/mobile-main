import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insure_marts/util/styles.dart';
import 'package:insure_marts/widget/custom_icon.dart';
import 'package:insure_marts/ui/notification/notification_screen.dart';
import 'package:insure_marts/widget/custom_textspan_widget.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0.0,
      automaticallyImplyLeading: false,
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hello,  ',
                      style: GoogleFonts.raleway(
                        color: Colors.grey,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                        
                      )
                    ),
                    TextSpan(
                      text: 'Joshua',
                      style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                      )
                    ),
                  ],
                ),
              )),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationScreen()));
            },
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                CustomIcon(
                  icon: Icons.notifications,
                  color: Color(0xff222222),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
