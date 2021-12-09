import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insure_marts/controllers/carinsurance_ctrl.dart/extensionctrl.dart';
import 'package:insure_marts/core/models/extension_model.dart';
import 'package:insure_marts/core/provider/all_toggle_provider.dart';
import 'package:insure_marts/ui/car_upload/car_appbar.dart';
import 'package:insure_marts/ui/car_upload/car_upload_screen4.dart';
import 'package:insure_marts/util/mock/mockdata.dart';
import 'package:insure_marts/util/spacing.dart';
import 'package:insure_marts/util/styles.dart';
import 'package:insure_marts/widget/car_upload_header.dart';
import 'package:insure_marts/widget/custom_button2.dart';
import 'package:insure_marts/widget/custom_container.dart';
import 'package:insure_marts/widget/custom_extension_container/custom_extnsion_container.dart';
import 'package:insure_marts/widget/custom_icon.dart';
import 'package:insure_marts/widget/custom_text_widget.dart';
import 'package:insure_marts/widget/size_calculator.dart';
import 'package:provider/provider.dart';

class CarUploadScreen3 extends StatelessWidget {
  final extensnCtrl = Get.put(ExtensionCtrl());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Provider.of<ToggleData>(context, listen: false).initialdata();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CarAppBar(
          title: 'New Car Insurance',
        ),
      ),
      body:
          // Consumer<ToggleData>(
          //     builder: (_, choose, child) =>
          Container(
        color: Styles.colorWhite,
        child: Column(
          children: [
            CarUploadHeader(
              steps: 'step 3 of 6',
              title: 'Choose Extensions',
              indicatorwidth: 0.60,
              forwardOntap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => CarUploadScreen4()));
                Get.to(() => CarUploadScreen4());
              },
            ),
            !extensnCtrl.excessfilter.isBlank &&
                    extensnCtrl.excessfilter.option != null
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: ExtensionContainer(
                      text: '${extensnCtrl.excessfilter.name}',
                      borderColor: Color(0xff03A688),
                      iconColor: Colors.grey,
                      containerColor: Color(0xffB3E4DB),
                      radioOptions: extensnCtrl
                          .getOptions(extensnCtrl.excessfilter.option),
                      height: 60,
                      margin: EdgeInsets.fromLTRB(8, 2, 8, 2),
                      // onChanged: extensnCtrl.toggleExcess,
                      // onPressed: () {
                      // choose.togglecheck2();
                      // },
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          semanticsLabel: 'Please Wait...',
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
            verticalSpaceMedium,
            // Expanded(
            //     child: ListView.builder(
            //       itemCount: MockData.mockExtension.length,
            //       itemBuilder: (__, index) {
            //         return Padding(
            //           padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            //           child:ExtensionContainer(
            //             text: '${MockData.mockExtension['extension_names'][index]}',
            //             onPressed: () {
            //               // choose.togglecheck2();
            //             },

            //           ),
            //         );
            //       }),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                title: 'CONTINUE',
                fontSize: 12,
                height: 50,
                buttonColor: Styles.appBackground2,
                onPressed: () {
                  // print(choose.ischecked4);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CarUploadScreen4()));
                },
              ),
            ),
            verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                title: 'SAVE & CONTINUE LATER',
                fontSize: 12,
                height: 50,
                textColor: Styles.appBackground2,
                buttonColor: Styles.colorWhite,
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => CarUploadScreen2()));
                },
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Expanded(
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      // CustomContainer(
                      //     text: 'Personal Effects',
                      //     onPressed: () {
                      //       choose.togglecheck5();
                      //     },
                      //     borderColor: choose.ischecked5
                      //         ? Styles.colorLightgreen
                      //         : Styles.colorBoxBorder,
                      //     containerColor: choose.ischecked5
                      //         ? Styles.colorLightLemon
                      //         : Styles.colorBoxBackground,
                      //     checkboxColor: choose.ischecked5
                      //         ? Styles.colorLightLemon
                      //         : Styles.colorBlack.withOpacity(0.1),
                      //     iconColor: choose.ischecked5
                      //         ? Styles.appBackground2
                      //         : Colors.transparent),
                      // verticalSpaceMedium,
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
        // )
        // ),
      ),
    );
  }
}
