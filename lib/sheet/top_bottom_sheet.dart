import 'dart:math';

import 'package:ditp_intro_flutter_slide/component/main_title_description.dart';
import 'package:ditp_intro_flutter_slide/sheet/base_sheet.dart';
import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';

class TopBottomSheet extends BaseSheet {
  const TopBottomSheet(this.title, this.description, this.imageAsset,
      {this.bottomImageAsset = null});

  final String title;
  final String description;
  final String? imageAsset;
  final String? bottomImageAsset;

  @override
  @override
  Widget build(BuildContext context) {
    return getDefaultPaddedContainer(Stack(children: [
      Positioned(
          width: 1300,
          height: 680,
          top: 260,
          left: 0,
          child: Container(color: dSecondaryColor)),
      Positioned(
        top: 64,
        right: 40,
        child:  imageAsset != null ? Image.asset(
          imageAsset != null ? imageAsset! : "",
          width: min(MediaQuery.of(context).size.width/2-50,800), height: 800,fit: BoxFit.contain,
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
        bottom: 44,
        left: 100,
        child:bottomImageAsset != null ?  Image.asset(
          bottomImageAsset != null ? bottomImageAsset! : "",
          height: 500,
          width:min(MediaQuery.of(context).size.width/2-50,500),fit: BoxFit.contain,
        ): Container(),
      ),
    ]));
  }
}
