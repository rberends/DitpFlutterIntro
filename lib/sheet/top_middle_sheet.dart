import 'dart:math';

import 'package:ditp_intro_flutter_slide/component/main_title_description.dart';
import 'package:ditp_intro_flutter_slide/sheet/base_sheet.dart';
import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class TopMiddleSheet extends BaseSheet {
  const TopMiddleSheet(this.title, this.description,  this.imageAsset,  {this.bottomImageAsset = null});
  final String title;
  final String description;
  final String? imageAsset;
  final String? bottomImageAsset;

  @override
  Widget build(BuildContext context) {

    //init size config
    SizeConfig(context);

    return   getDefaultPaddedContainer(Stack(
        children: [
          Positioned(
              width: SizeConfig.safeBlockHorizontal*94,
              height: SizeConfig.safeBlockVertical*50,
              top: SizeConfig.safeBlockVertical*28,
              left: 0,
              child: Container(color: dSecondaryColor)),
          Positioned(
              top:  SizeConfig.safeBlockVertical*14,
              right: SizeConfig.safeBlockHorizontal*2,
              child: Image.asset(imageAsset!=null? imageAsset!: "", width: SizeConfig.safeBlockHorizontal*40, height: SizeConfig.safeBlockVertical*60, fit: BoxFit.scaleDown,),),
          Positioned(
              width: SizeConfig.safeBlockHorizontal*44,
              height: SizeConfig.safeBlockVertical*90,
              top:  SizeConfig.safeBlockVertical*10,
              left:  SizeConfig.safeBlockHorizontal*2,
              child:
                MainTitleDescription(title, description, descriptionColor: dSecondaryTextColor)
              ),
          Positioned(
              bottom: SizeConfig.safeBlockVertical,
              left: SizeConfig.safeBlockHorizontal*10,
              child: Container( child:bottomImageAsset != null? Image.asset(
                bottomImageAsset != null ? bottomImageAsset! : "",
                width: min(MediaQuery.of(context).size.width/3*2, 1050),
                height: 300,
                fit: BoxFit.scaleDown,
              ):Container())),
        ]));
  }
}