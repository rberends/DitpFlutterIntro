import 'package:ditp_intro_flutter_slide/component/main_title_description.dart';
import 'package:ditp_intro_flutter_slide/sheet/base_sheet.dart';
import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class LeftCornerSheet extends BaseSheet {
  const LeftCornerSheet(this.title, this.description, this.imageAsset,
      {this.bottomImageAsset = null});

  final String title;
  final String description;
  final String? imageAsset;
  final String? bottomImageAsset;

  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    return getDefaultPaddedContainer(Stack(fit: StackFit.expand, children: [
      Positioned(
          width: SizeConfig.safeBlockHorizontal * 50,
          height: SizeConfig.safeBlockVertical * 60,
          top: SizeConfig.safeBlockVertical * 10,
          left: 0,
          child: Container(color: dSecondaryColor)),
      Positioned(
        top: SizeConfig.safeBlockVertical * 11,
        left: SizeConfig.safeBlockHorizontal * 1.5,
        child: Image.asset(
          imageAsset != null ? imageAsset! : "",
          width: SizeConfig.safeBlockHorizontal * 48,
          height: SizeConfig.safeBlockVertical * 58,
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
          width: SizeConfig.safeBlockHorizontal * 30,
          height: SizeConfig.safeBlockVertical * 100,
          top: SizeConfig.safeBlockVertical * 10,
          left: SizeConfig.safeBlockHorizontal * 56,
          child: MainTitleDescription(title, description)),
      Positioned(
          bottom: 10,
          left: SizeConfig.safeBlockHorizontal * 10,
          child: Container(
              child: bottomImageAsset != null
                  ? Image.asset(
                      bottomImageAsset != null ? bottomImageAsset! : "",
                      width: SizeConfig.safeBlockHorizontal * 70,
                      height: SizeConfig.safeBlockVertical * 30,
                      fit: BoxFit.scaleDown,
                    )
                  : Container())),
    ]));
  }
}
