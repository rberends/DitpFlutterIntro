import 'dart:math';

import 'package:ditp_intro_flutter_slide/component/main_title_description.dart';
import 'package:ditp_intro_flutter_slide/sheet/base_sheet.dart';
import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:ditp_intro_flutter_slide/utils/size_config.dart';
import 'package:flutter/material.dart';

class MiddleLeftRightSheet extends BaseSheet {
  const MiddleLeftRightSheet(this.title, this.description, this.imageAsset,
      {this.leftImageAsset = null, this.rightImageAsset = null});

  final String title;
  final String description;
  final String? imageAsset;
  final String? leftImageAsset, rightImageAsset;

  @override
  Widget build(BuildContext context) {
    //init size config
    SizeConfig(context);

    double subImageWidth = SizeConfig.safeBlockHorizontal*38;
    double subImageHeight = SizeConfig.safeBlockVertical*46;

    return getDefaultPaddedContainer(Stack(fit: StackFit.expand, children: [
      Positioned(
        top: SizeConfig.safeBlockVertical*9,
        left:  SizeConfig.safeBlockHorizontal*1.5,
        child: Image.asset(
          imageAsset != null ? imageAsset! : "",
          width: SizeConfig.safeBlockHorizontal*45,
          height: SizeConfig.safeBlockVertical*38,
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
          width: SizeConfig.safeBlockHorizontal*35,
          height: SizeConfig.safeBlockVertical*45,
          top: SizeConfig.safeBlockVertical*10,
          left: SizeConfig.safeBlockHorizontal*52,
          child: MainTitleDescription(title, description)),
      Positioned(
          width: SizeConfig.safeBlockHorizontal*99,
          height: SizeConfig.safeBlockVertical*49,
          top: SizeConfig.safeBlockVertical*49,
          left: 0,
          child: Container(color: dSecondaryColor)),
      Positioned(
          top: SizeConfig.safeBlockVertical*50,
          left: SizeConfig.safeBlockHorizontal*49- subImageWidth,
          child: Container(
              child: leftImageAsset != null
                  ? Image.asset(
                      leftImageAsset != null ? leftImageAsset! : "",
                      width: subImageWidth,
                      height: subImageHeight,
                      fit: BoxFit.scaleDown,
                    )
                  : Container())),
      Positioned(
          top: SizeConfig.safeBlockVertical*50,
          left: SizeConfig.safeBlockHorizontal*50,
          child: Container(
              child: rightImageAsset != null
                  ? Image.asset(
                      rightImageAsset != null ? rightImageAsset! : "",
                      width: subImageWidth,
                      height: subImageHeight,
                      fit: BoxFit.scaleDown,
                    )
                  : Container())),
    ]));
  }
}
