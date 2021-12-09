import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insure_marts/controllers/carinsurance_ctrl.dart/extensionctrl.dart';
import 'package:insure_marts/core/models/extension_model.dart';
import 'package:insure_marts/util/spacing.dart';
import 'package:insure_marts/util/styles.dart';
import 'package:insure_marts/widget/custom_icon.dart';
import 'package:insure_marts/widget/custom_text_widget.dart';
import 'package:insure_marts/widget/size_calculator.dart';

class ExtensionContainer extends StatefulWidget {
  final Widget widget;
  final double height;
  final width;
  final borderWidth;
  final padding;
  final margin;
  final borderRadius;
  final boxShadow;
  // final onSelected;
  final List<ExtensionModel> radioOptions;
  final Function onChanged;
  // final optionData;
  bool isSelected;
  bool isExpanded;
  final Color borderColor, checkColor, iconColor, containerColor, checkboxColor;
  final String text;
  ExtensionContainer(
      {this.onChanged,
      this.widget,
      this.text,
      this.borderColor,
      // this.optionData,
      this.radioOptions,
      this.checkColor,
      // this.onSelected = false,
      this.iconColor,
      this.isSelected = false,
      this.containerColor,
      this.height,
      this.isExpanded = false,
      this.margin,
      this.padding,
      this.width,
      this.borderWidth,
      this.boxShadow,
      this.checkboxColor,
      this.borderRadius});

  @override
  State<ExtensionContainer> createState() => _ExtensionContainerState();
}

class _ExtensionContainerState extends State<ExtensionContainer> {
  @override
  void initState() {
    print(widget.radioOptions);
    super.initState();
  }

  ExtensionModel _model;
  @override
  Widget build(BuildContext context) {
    List<Widget> createRadioListOptions() {
      List<Widget> widgets = [];
      for (ExtensionModel radioOption in widget.radioOptions) {
        widgets.add(
          RadioListTile(
            value: radioOption,
            groupValue: _model,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(2, 0, 0, 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${radioOption.name} "),
                  Text("${radioOption.price} "),
                ],
              ),
            ),
            // subtitle: Text(user.lastName),
            onChanged: (currentUser) {
              // print("Current User ${currentUser.firstName}");
              setState(() {
                _model = radioOption;
              });
            },
            selected: _model == radioOption,
            activeColor: Color(0xff023859),
            selectedTileColor: Color(0xff023859),
          ),
        );
      }
      return widgets;
    }

    return widget.isExpanded
        ? GestureDetector(
            onLongPress: () {
              setState(() {
                widget.isSelected = !widget.isSelected;
              });
            },
            child: Container(
                margin: widget.margin,
                height: widget.height * 4.5,
                // screenAwareSize(65, context),
                width: widget.width ?? double.infinity,
                padding: widget.padding ??
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(5),
                    boxShadow: widget.boxShadow,
                    border: Border.all(
                        color: widget.isSelected
                            ? widget.borderColor
                            : Styles.colorBoxBorder,
                        width: widget.borderWidth ?? 1),
                    color: widget.isSelected
                        ? widget.containerColor
                        : Styles.colorBoxBackground),
                child: widget.widget ??
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              '${widget.text}',
                              textAlign: TextAlign.left,
                              fontSize: 14,
                            ),
                            Spacer(),
                            Container(
                                height: widget.height * 0.8,
                                // width: screenAwareSize(25, context, width: true),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: widget.checkboxColor,
                                ),
                                child: Row(
                                  children: [
                                    CustomIcon(
                                      icon: Icons.check,
                                      color: widget.isSelected
                                          ? Color(0xff2269B3)
                                          : Colors.transparent,
                                      size: 23,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CustomIcon(
                                      onPressed: () {
                                        setState(() {
                                          widget.isExpanded =
                                              !widget.isExpanded;
                                        });
                                      },
                                      icon: Icons.info,
                                      color: widget.iconColor,
                                      size: 23,
                                    ),
                                  ],
                                ))
                          ],
                        ),
                        SizedBox(height: 3.0),
                        Divider(
                          height: 2.0,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 3.0),
                        Expanded(
                            child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          children: createRadioListOptions(),
                          shrinkWrap: true,
                        )
                            // ListView.builder(
                            //   // physics: NeverScrollableScrollPhysics(),
                            //   itemBuilder: (context, index) {
                            //     return RadioListTile(
                            //         // subtitle:
                            //         //     Text("${widget.radioOptions[index].name}"),
                            //         value: _model,
                            //         activeColor: Color(0xff023859),
                            //         // selectedTileColor: ,
                            //         // selected: _model.id ==
                            //         //     widget.radioOptions[index].id,
                            //         groupValue: widget.radioOptions[index],
                            //         onChanged: (model) {
                            //           setState(() {
                            //             // debugPrint(val.toString());
                            //             print(index);
                            //             // print(model.price);
                            //             model = widget.radioOptions[index];
                            //             _model = model;
                            //             // val = value;
                            //             debugPrint(index.toString());
                            //           });
                            //         },
                            //         title: Padding(
                            //           padding:
                            //               const EdgeInsets.fromLTRB(2, 0, 0, 2),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceBetween,
                            //             children: [
                            //               Text(
                            //                   "${widget.radioOptions[index].name} "),
                            //               Text(
                            //                   "${widget.radioOptions[index].price} "),
                            //             ],
                            //           ),
                            //         ));
                            //   },
                            //   itemCount: widget.radioOptions.length,
                            // ),
                            )
                      ],
                    )),
          )
        : GestureDetector(
            onLongPress: () {
              setState(() {
                widget.isSelected = !widget.isSelected;
              });
            },
            child: Container(
              // margin: widget.margin,
              // screenAwareSize(65, context),
              height: widget.height,
              width: widget.width ?? double.infinity,
              padding: widget.padding ??
                  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
                  boxShadow: widget.boxShadow,
                  border: Border.all(
                      color: widget.isSelected
                          ? widget.borderColor
                          : Styles.colorBoxBorder,
                      width: widget.borderWidth ?? 1),
                  color: widget.isSelected
                      ? widget.containerColor
                      : Styles.colorBoxBackground),
              child: widget.widget ??
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        '${widget.text}',
                        textAlign: TextAlign.left,
                        fontSize: 14,
                      ),
                      Spacer(),
                      Container(
                          height: widget.height * 0.8,
                          // width:
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: widget.checkboxColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomIcon(
                                icon: Icons.check,
                                color: widget.isSelected
                                    ? Color(0xff2269B3)
                                    : Colors.transparent,
                                size: 23,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CustomIcon(
                                onPressed: () {
                                  setState(() {
                                    widget.isExpanded = !widget.isExpanded;
                                  });
                                },
                                icon: Icons.info,
                                color: widget.iconColor,
                                size: 23,
                              ),
                            ],
                          ))
                    ],
                  ),
            ),
          );
  }
}
