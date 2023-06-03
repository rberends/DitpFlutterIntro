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
    //init size config
    SizeConfig(context);
    return getDefaultPaddedContainer(Stack(fit: StackFit.expand, children: [
      Positioned(
          width: SizeConfig.safeBlockHorizontal * 50,
          height: SizeConfig.safeBlockVertical * 85,
          top: SizeConfig.safeBlockVertical * 12,
          left: 0,
          child: Container(color: dSecondaryColor)),
      Positioned(
        top: SizeConfig.safeBlockVertical * 13,
        left: SizeConfig.safeBlockHorizontal * 1,
        child: Image.asset(
          imageAsset != null ? imageAsset! : "",
          width: SizeConfig.safeBlockHorizontal * 49,
          height: SizeConfig.safeBlockVertical * 84,
          fit: BoxFit.scaleDown,
        ),
      ),
      Positioned(
          width: SizeConfig.safeBlockHorizontal * 30,
          height: SizeConfig.safeBlockVertical * 100,
          top: SizeConfig.safeBlockVertical * 10,
          left: SizeConfig.safeBlockHorizontal * 55,
          child: MainTitleDescription(title, description))
    ]));
  }
}
