import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insure_marts/controllers/carinsurance_ctrl.dart/insurancecompanyctrl.dart';
import 'package:insure_marts/core/provider/all_toggle_provider.dart';
import 'package:insure_marts/ui/car_upload/car_appbar.dart';
// import 'package:insure_marts/ui/car_upload/car_upload_screen6.dart';
import 'package:insure_marts/ui/car_upload/car_upload_screen5.dart';

import 'package:insure_marts/util/spacing.dart';
import 'package:insure_marts/util/styles.dart';

import 'package:insure_marts/widget/car_upload_header.dart';

import 'package:insure_marts/widget/insurance_container.dart';
// import 'package:insure_marts/widget/size_calculator.dart';
import 'package:provider/provider.dart';

class CarUploadScreen4 extends StatelessWidget {
  @override
  final ctrl = Get.put(CompanyController());
  Widget build(BuildContext context) {
    Provider.of<ToggleData>(context, listen: false).initialdata();

    return
        // Obx(
        //   () =>
        Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CarAppBar(
          title: 'New Car Insurance',
        ),
      ),
      body: Consumer<ToggleData>(
          builder: (_, choose, child) => Container(
                child: Container(
                  color: Styles.colorWhite,
                  child: Column(children: [
                    // verticalSpaceMedium,
                    CarUploadHeader(
                      steps: 'step 4 of 6',
                      title: 'Choose Insurance',
                      indicatorwidth: 0.80,
                      forwardOntap: () {
                        if (ctrl.imgstr.value != '') {
                          Get.to(() => CarUploadScreen5());
                        }
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => CarUploadScreen5()));
                      },
                    ),
                    verticalSpaceSmall,
                    Expanded(
                      child: ListView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Obx(
                            () => InsuranceContainer(
                              borderColor: ctrl.selected.value == index
                                  ? Styles.colorLightgreen
                                  : Styles.colorBoxBorder,
                              backroundColor: ctrl.selected.value == index
                                  ? Styles.colorLightLemon
                                  : Styles.colorBoxBackground,
                              title: '${ctrl.mockcompany[index].name}',
                              iconColor: ctrl.selected.value == index
                                  ? Color(0xff2269B3)
                                  : Colors.transparent,
                              coverNumber:
                                  '${ctrl.mockcompany[index].cover_number}',
                              policyYear:
                                  '${ctrl.mockcompany[index].policy_year}',
                              price: '${ctrl.mockcompany[index].price}',
                              image: '${ctrl.mockcompany[index].image}',
                              onTap: () {
                                ctrl.selectCompany(
                                    value: index,
                                    imgvalue: ctrl.mockcompany[index].image);
                                // choose.toggleCustodianAlliedInsurance();
                                print('hello');
                              },
                            ),
                          );
                        },
                        itemCount: ctrl.mockcompany.length,
                      ),
                    ),
                  ]),
                ),
                // ),
              )),
    );
  }
}
