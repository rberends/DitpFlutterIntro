import 'dart:math';

import 'package:ditp_intro_flutter_slide/sheet/base_sheet.dart';
import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:ditp_intro_flutter_slide/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../component/main_title_description.dart';

class LeftRightSheet extends BaseSheet {
  const LeftRightSheet(this.title, this.description, this.imageAsset,
      {super.key});

  final String title;
  final String description;
  final String? imageAsset;

  @override
  Widget build(BuildContext context) {
    return getDefaultPaddedContainer(
         Stack(fit: StackFit.expand,
             children: [
          Positioned(
              width: SizeConfig.blockSizeHorizontal*50,
              height: SizeConfig.blockSizeVertical*85,
              top: SizeConfig.blockSizeVertical*12,
              left: 0,
              child: Container(color: dSecondaryColor)),
          Positioned(
            top: SizeConfig.blockSizeVertical*13,
            left: SizeConfig.blockSizeHorizontal*1,
            child: Image.asset(
              imageAsset != null ? imageAsset! : "",
              width:  SizeConfig.blockSizeHorizontal*49,
              height:  SizeConfig.blockSizeVertical*84,
              fit: BoxFit.scaleDown,
            ),
          ),
          Positioned(
              width:  SizeConfig.blockSizeHorizontal*30,
              height: SizeConfig.blockSizeVertical*100,
              top: SizeConfig.blockSizeVertical*10,
              left:  SizeConfig.blockSizeHorizontal*55,
              child: MainTitleDescription(title, description))
        ]));
  }
}
