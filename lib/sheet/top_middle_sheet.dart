import 'dart:math';

import 'package:ditp_intro_flutter_slide/component/main_title_description.dart';
import 'package:ditp_intro_flutter_slide/sheet/base_sheet.dart';
import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';

class TopMiddleSheet extends BaseSheet {
  const TopMiddleSheet(this.title, this.description,  this.imageAsset,  {this.bottomImageAsset = null});
  final String title;
  final String description;
  final String? imageAsset;
  final String? bottomImageAsset;

  @override
  @override
  Widget build(BuildContext context) {
    return   getDefaultPaddedContainer(Stack(
        children: [
          Positioned(
              width: 1300,
              height: 480,
              top: 260,
              left: 0,
              child: Container(color: dSecondaryColor)),
          Positioned(
              top: 14,
              right: 40,
              child: Image.asset(imageAsset!=null? imageAsset!: "", width: 600, height: 800, fit: BoxFit.scaleDown,),),
          Positioned(
              width: 340,
              height: 500,
              top: 110,
              left: 20,
              child:
                MainTitleDescription(title, description, descriptionColor: dSecondaryTextColor)
              ),
          Positioned(
              bottom: 10,
              left: MediaQuery.of(context).size.width/9,
              child: Container( child:bottomImageAsset != null? Image.asset(
                bottomImageAsset != null ? bottomImageAsset! : "",
                width: min(MediaQuery.of(context).size.width/3*2, 1050),
                height: 300,
                fit: BoxFit.scaleDown,
              ):Container())),
        ]));
  }
}