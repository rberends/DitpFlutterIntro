import 'package:ditp_intro_flutter_slide/component/main_description.dart';
import 'package:ditp_intro_flutter_slide/sheet/base_sheet.dart';
import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:ditp_intro_flutter_slide/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../component/main_title.dart';

class TopBottomSheet extends BaseSheet {
  const TopBottomSheet(this.title, this.description, this.imageAsset,
      {this.bottomImageAsset = null, this.showLargeBottomImage = false});

  final String title;
  final String description;
  final String? imageAsset;
  final String? bottomImageAsset;
  final bool showLargeBottomImage;

  @override
  Widget build(BuildContext context) {
    //init size config
    SizeConfig(context);

    double topImageWidth = showLargeBottomImage
        ? SizeConfig.safeBlockHorizontal * 22
        : SizeConfig.safeBlockHorizontal * 38;
    double bottomImageWidth = showLargeBottomImage
        ? SizeConfig.safeBlockHorizontal * 70
        : SizeConfig.safeBlockHorizontal * 36;
    double bottomImageHeight = showLargeBottomImage
        ? SizeConfig.safeBlockVertical * 44
        : SizeConfig.safeBlockVertical * 36;
    return getDefaultPaddedContainer(Stack(children: [
      Positioned(
          width: SizeConfig.safeBlockHorizontal * 90,
          height: SizeConfig.safeBlockVertical * 72,
          top: SizeConfig.safeBlockVertical * 26,
          left: 0,
          child: Container(color: dSecondaryColor)),
      Positioned(
        top: showLargeBottomImage
            ? SizeConfig.safeBlockVertical * 22
            : SizeConfig.safeBlockVertical * 24,
        right: SizeConfig.safeBlockHorizontal * 6,
        child: Container(
            child:imageAsset != null
            ? Image.asset(
                imageAsset != null ? imageAsset! : "",
                width: topImageWidth,
                fit: BoxFit.contain,
              )
            : Container()),
      ),
      Positioned(
          bottom: SizeConfig.safeBlockVertical * 74,
          left: SizeConfig.safeBlockHorizontal * 2,
          child: MainTitle(title)),
      Positioned(
          width: SizeConfig.safeBlockHorizontal * 40,
          top: SizeConfig.safeBlockVertical * 26,
          left: SizeConfig.safeBlockHorizontal * 2,
          child: MainDescription(description,
              descriptionColor: dSecondaryTextColor)),
      Positioned(
        top: SizeConfig.screenHeight -
            bottomImageHeight -
            SizeConfig.safeBlockVertical * 2,
        left: SizeConfig.safeBlockHorizontal,
        child: bottomImageAsset != null
            ? Image.asset(
                bottomImageAsset != null ? bottomImageAsset! : "",
                height: bottomImageHeight,
                width: bottomImageWidth,
                fit: BoxFit.contain,
              )
            : Container(),
      ),
    ]));
  }
}
