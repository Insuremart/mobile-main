import 'package:flutter/material.dart';
import 'package:insure_marts/ui/car_upload/car_appbar.dart';
import 'package:insure_marts/ui/car_upload/car_upload_screen2.dart';
import 'package:insure_marts/ui/dashboard/home_appbar.dart';
import 'package:insure_marts/util/spacing.dart';
import 'package:insure_marts/util/styles.dart';
import 'package:insure_marts/widget/car_upload_header.dart';
import 'package:insure_marts/widget/custom_button2.dart';
import 'package:insure_marts/widget/custom_container.dart';
import 'package:insure_marts/widget/custom_icon.dart';
import 'package:insure_marts/widget/custom_text_widget.dart';
import 'package:insure_marts/widget/custom_textfield.dart';
import 'package:insure_marts/widget/dropdown/cover_type_dropdown.dart';
import 'package:insure_marts/widget/size_calculator.dart';

class CarUploadScreen1 extends StatefulWidget {
  @override
  State<CarUploadScreen1> createState() => _CarUploadScreen1State();
}

class _CarUploadScreen1State extends State<CarUploadScreen1> {
  final _fullName = TextEditingController();

  final _carBrand = TextEditingController();

  final _carModel = TextEditingController();

  final _carType = TextEditingController();

  final _carColour = TextEditingController();

  final _carValue = TextEditingController();

  final _mYear = TextEditingController();

  final _rNumber = TextEditingController();

  final _cNumber = TextEditingController();

  final _eNumber = TextEditingController();

  final _pInsurance = TextEditingController();

  String selectedBrand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CarAppBar(
          // color: Colors.white,
          title: 'New plan',
        ),
      ),
      body: Container(
        color: Styles.colorWhite,
        child: Column(
          children: [
            CarUploadHeader(
              steps: 'step 1 of 6',
              title: 'Insurance Details',
              indicatorwidth: 0.20,
              forwardOntap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CarUploadScreen2()));
              },
            ),
            verticalSpaceMedium,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    CustomTextField(
                      title: 'Full Name Of User',
                      controller: _fullName,
                      hintText: 'e.g Jane Doe',
                      validator: (val) =>
                          val.isEmpty ? 'Enter car brand' : null,
                    ),
                    verticalSpaceSmall,
                    verticalSpaceMedium,
                       Row(
                      children: [
                        CustomText(
                          'Model of Car',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: 
                              Styles.colorBlack.withOpacity(0.8),
                        ),
                      ],
                    ),
                    verticalSpaceTiny,
                    CustomContainer(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      widget: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          hint: CustomText(
                            'Brand of Car',
                            fontSize: 12,
                          ),
                          value:
                              selectedBrand, // A global variable used to keep track of the selection
                          items: ['Car Brand 1', 'Car Brand 2', 'Car Brand 3']
                              .map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (selectedItem) => setState(
                            () => selectedBrand = selectedItem,
                          ),
                        ),
                      ),
                    ),

                    verticalSpaceSmall,
                    verticalSpaceMedium,
                      Row(
                      children: [
                        CustomText(
                          'Model of Car',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: 
                              Styles.colorBlack.withOpacity(0.8),
                        ),
                      ],
                    ),
                    verticalSpaceTiny,
                    CustomContainer(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      widget: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          hint: CustomText(
                            'Model of Car',
                            fontSize: 12,
                          ),
                          value:
                              selectedBrand, // A global variable used to keep track of the selection
                          items: ['Car Model 1', 'Car Model 2', 'Car Model 3']
                              .map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (selectedItem) => setState(
                            () => selectedBrand = selectedItem,
                          ),
                        ),
                      ),
                    ),

                    verticalSpaceSmall,
                    verticalSpaceMedium,
                    Row(
                      children: [
                        CustomText(
                          'Type of Cover',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: 
                              Styles.colorBlack.withOpacity(0.8),
                        ),
                      ],
                    ),
                    verticalSpaceTiny,
                    CustomContainer(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      widget: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          hint: CustomText(
                            'Type of Cover',
                            fontSize: 12,
                          ),
                          value:
                              selectedBrand, // A global variable used to keep track of the selection
                          items: ['Cover 1', 'Cover 2', 'Cover 3'].map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (selectedItem) => setState(
                            () => selectedBrand = selectedItem,
                          ),
                        ),
                      ),
                    ),
                    // CustomTextField(
                    //   title: 'Type Of Cover',
                    //   controller: _carModel,
                    //   hintText: 'e.g Comprehensive',
                    //   validator: (val) =>
                    //       val.isEmpty ? 'Enter car brand' : null,
                    // ),
                    verticalSpaceSmall,
                    verticalSpaceMedium,

                    CustomTextField(
                      title: 'Colour of Vehicle',
                      controller: _carColour,
                      hintText: 'e.g black',
                      validator: (val) => val.isEmpty
                          ? 'Please enter the colour of the car'
                          : null,
                    ),
                    verticalSpaceSmall,
                    verticalSpaceMedium,
                    CustomTextField(
                      title: 'Value of Car',
                      controller: _carValue,
                      hintText: 'e.g black',
                      validator: (val) =>
                          val.isEmpty ? 'Please enter value of car' : null,
                    ),
                    verticalSpaceSmall,
                    verticalSpaceMedium,
                    // CustomTextField(
                    //   title: 'Manufacture Year',
                    //   controller: _mYear,
                    //   hintText: 'e.g 2014',
                    //   validator: (val) =>
                    //       val.isEmpty ? 'Enter car brand' : null,
                    // ),
                    // verticalSpaceSmall,
                    // verticalSpaceMedium,
                    CustomTextField(
                      title: 'Registration Number',
                      controller: _rNumber,
                      hintText: 'Enter reg number',
                      validator: (val) =>
                          val.isEmpty ? 'Enter car brand' : null,
                    ),
                    verticalSpaceSmall,
                    verticalSpaceMedium,
                    CustomTextField(
                      title: 'Chasis Number',
                      controller: _cNumber,
                      hintText: 'Enter chasis number',
                      validator: (val) =>
                          val.isEmpty ? 'Enter car brand' : null,
                    ),
                    verticalSpaceSmall,
                    verticalSpaceMedium,
                    CustomTextField(
                      title: 'Engine Number',
                      controller: _eNumber,
                      hintText: 'Enter engine number',
                      validator: (val) =>
                          val.isEmpty ? 'Enter car brand' : null,
                    ),
                    verticalSpaceSmall,
                    verticalSpaceMedium,
                    // CustomTextField(
                    //   title: 'Peroid of Insurance',
                    //   controller: _pInsurance,
                    //   hintText: 'eg 1 year',
                    //   validator: (val) =>
                    //   val.isEmpty ? 'Enter car brand' : null,
                    // ),
                    CoverTypeDropdown(),
                    verticalSpaceSmall,
                    verticalSpaceMedium,
                    CustomButton(
                      title: 'CONTINUE',
                      fontSize: 12,
                      height: 50,
                      buttonColor: Styles.appBackground2,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CarUploadScreen2()));
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CarUploadScreen2()));
                      },
                    ),
                    verticalSpaceMedium,
                    verticalSpaceSmall
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
