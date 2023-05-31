import 'dart:math';

import 'package:ditp_intro_flutter_slide/component/main_title_description.dart';
import 'package:ditp_intro_flutter_slide/sheet/base_sheet.dart';
import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';

class MiddleLeftRightSheet extends BaseSheet {
  const MiddleLeftRightSheet(this.title, this.description, this.imageAsset,
      {this.leftImageAsset = null, this.rightImageAsset = null});

  final String title;
  final String description;
  final String? imageAsset;
  final String? leftImageAsset, rightImageAsset;

  @override
  @override
  Widget build(BuildContext context) {
     int maxWidth=  min(MediaQuery.of(context).size.width, 1400).toInt();
     double subImageWidth= min(MediaQuery.of(context).size.width / 2-50, 500);

    return getDefaultPaddedContainer(Stack(fit: StackFit.expand, children: [
      Positioned(
        top: 100,
        left: 40,
        child: Image.asset(
          imageAsset != null ? imageAsset! : "",
          width: min(MediaQuery.of(context).size.width / 2 - 50, 400),
          height: MediaQuery.of(context).size.height/2-150,
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
          width: 320,
          height: 500,
          top: 100,
          right: 40,
          child: MainTitleDescription(title, description)),
      Positioned(
          width: min(MediaQuery.of(context).size.width, 1400),
          height: MediaQuery.of(context).size.height/2-20,
          top: MediaQuery.of(context).size.height/2,
          left: 0,
          child: Container(color: dSecondaryColor)),
      Positioned(
          top: MediaQuery.of(context).size.height- (MediaQuery.of(context).size.height / 2)+10,
          left: (maxWidth/2-subImageWidth)-50,
          child: Container(
              child: leftImageAsset != null
                  ? Image.asset(
                      leftImageAsset != null ? leftImageAsset! : "",
                      width: subImageWidth,
                      height: MediaQuery.of(context).size.height / 2-50,
                      fit: BoxFit.scaleDown,
                    )
                  : Container())),
      Positioned(
          top:  MediaQuery.of(context).size.height- (MediaQuery.of(context).size.height / 2)+10,
          left:   maxWidth/2-50,
          child: Container(
              child: rightImageAsset != null
                  ? Image.asset(
                      rightImageAsset != null ? rightImageAsset! : "",
                      width: subImageWidth,
                      height: MediaQuery.of(context).size.height / 2-50,
                      fit: BoxFit.scaleDown,
                    )
                  : Container())),
    ]));
  }
}
