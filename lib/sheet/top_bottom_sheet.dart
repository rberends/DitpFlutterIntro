import 'dart:math';

import 'package:ditp_intro_flutter_slide/component/main_title_description.dart';
import 'package:ditp_intro_flutter_slide/sheet/base_sheet.dart';
import 'package:ditp_intro_flutter_slide/utils/constants.dart';
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
        ? min(MediaQuery.of(context).size.width / 3 - 50, 500)
        : min(MediaQuery.of(context).size.width / 2 - 50, 800);
    double bottomImageWidth = showLargeBottomImage
        ? min(MediaQuery.of(context).size.width / 1.7 - 50, 800)
        : min(MediaQuery.of(context).size.width / 2 - 50, 500);
    double bottomImageHeight = showLargeBottomImage ? 600:500;
    return getDefaultPaddedContainer(Stack(children: [
      Positioned(
          width: 1300,
          height: 680,
          top: 260,
          left: 0,
          child: Container(color: dSecondaryColor)),
      Positioned(
        top: showLargeBottomImage? 24:54,
        right: 40,
        child: imageAsset != null
            ? Image.asset(
                imageAsset != null ? imageAsset! : "",
                width: topImageWidth,
                height: 800,
                fit: BoxFit.contain,
              )
            : Container(),
      ),
      Positioned(
          width: 340,
          height: 500,
          top: 110,
          left: 20,
          child: MainTitleDescription(title, description,
              descriptionColor: dSecondaryTextColor)),
      Positioned(
        top:   MediaQuery.of(context).size.height-bottomImageHeight,
        left: 60,
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
