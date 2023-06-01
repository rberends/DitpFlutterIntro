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
  @override
  Widget build(BuildContext context) {
    double subImageWidth = SizeConfig.blockSizeHorizontal*38;
    double subImageHeight = SizeConfig.blockSizeVertical*46;

    return getDefaultPaddedContainer(Stack(fit: StackFit.expand, children: [
      Positioned(
        top: SizeConfig.blockSizeVertical*10,
        left:  SizeConfig.blockSizeHorizontal*2,
        child: Image.asset(
          imageAsset != null ? imageAsset! : "",
          width: SizeConfig.blockSizeHorizontal*45,
          height: SizeConfig.blockSizeVertical*38,
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
          width: SizeConfig.blockSizeHorizontal*35,
          height: SizeConfig.blockSizeVertical*45,
          top: SizeConfig.blockSizeVertical*10,
          right: SizeConfig.blockSizeHorizontal*2,
          child: MainTitleDescription(title, description)),
      Positioned(
          width: SizeConfig.blockSizeHorizontal*99,
          height: SizeConfig.blockSizeVertical*49,
          top: SizeConfig.blockSizeVertical*49,
          left: 0,
          child: Container(color: dSecondaryColor)),
      Positioned(
          top: SizeConfig.blockSizeVertical*50,
          left: SizeConfig.blockSizeHorizontal*49- subImageWidth,
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
          top: SizeConfig.blockSizeVertical*50,
          left: SizeConfig.blockSizeHorizontal*50,
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
