import 'dart:math';

import 'package:ditp_intro_flutter_slide/component/main_title_description.dart';
import 'package:ditp_intro_flutter_slide/sheet/base_sheet.dart';
import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:ditp_intro_flutter_slide/utils/size_config.dart';
import 'package:flutter/material.dart';

class TopBottomSheet extends BaseSheet {
  const TopBottomSheet(this.title, this.description, this.imageAsset,
      {this.bottomImageAsset = null, this.showLargeBottomImage = false});

  final String title;
  final String description;
  final String? imageAsset;
  final String? bottomImageAsset;
  final bool showLargeBottomImage;

  @override
  @override
  Widget build(BuildContext context) {
    double topImageWidth = showLargeBottomImage
        ? SizeConfig.blockSizeHorizontal*26
        : SizeConfig.blockSizeHorizontal*50;
    double bottomImageWidth = showLargeBottomImage
        ? SizeConfig.blockSizeHorizontal*36
        : SizeConfig.blockSizeHorizontal*70;
    double bottomImageHeight = showLargeBottomImage ?  SizeConfig.blockSizeVertical*36
        : SizeConfig.blockSizeVertical*46;
    return getDefaultPaddedContainer(Stack(children: [
      Positioned(
          width: SizeConfig.blockSizeHorizontal*90,
          height: SizeConfig.blockSizeVertical*70,
          top: SizeConfig.blockSizeVertical*26,
          left: 0,
          child: Container(color: dSecondaryColor)),
      Positioned(
        top: showLargeBottomImage?
        SizeConfig.blockSizeVertical*12:  SizeConfig.blockSizeVertical*14,
        right: SizeConfig.blockSizeHorizontal*3,
        child: imageAsset != null
            ? Image.asset(
                imageAsset != null ? imageAsset! : "",
                width: topImageWidth,
                height: SizeConfig.blockSizeVertical*70,
                fit: BoxFit.contain,
              )
            : Container(),
      ),
      Positioned(
          width: SizeConfig.blockSizeHorizontal*30,
          height: SizeConfig.blockSizeVertical*100,
          top: SizeConfig.blockSizeVertical*10,
          left: SizeConfig.blockSizeHorizontal*2,
          child: MainTitleDescription(title, description,
              descriptionColor: dSecondaryTextColor)),
      Positioned(
        top:   SizeConfig.screenHeight-bottomImageHeight,
        left: SizeConfig.blockSizeHorizontal*3,
        child: bottomImageAsset != null
            ? Image.asset(
                bottomImageAsset != null ? bottomImageAsset! : "",
                height:bottomImageHeight,
                width: bottomImageWidth,
                fit: BoxFit.contain,
              )
            : Container(),
      ),
    ]));
  }
}
