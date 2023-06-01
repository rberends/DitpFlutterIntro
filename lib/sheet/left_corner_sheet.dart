import 'dart:math';

import 'package:ditp_intro_flutter_slide/component/main_title_description.dart';
import 'package:ditp_intro_flutter_slide/sheet/base_sheet.dart';
import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class LeftCornerSheet extends BaseSheet {
  const LeftCornerSheet(this.title, this.description,  this.imageAsset,  {this.bottomImageAsset = null});

  final String title;
  final String description;
  final String? imageAsset;
  final String? bottomImageAsset;

  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    return getDefaultPaddedContainer(
    Stack(
        fit: StackFit.expand,
    children: [
          Positioned(
              width: SizeConfig.blockSizeHorizontal*50,
              height: SizeConfig.blockSizeVertical*60,
              top: SizeConfig.blockSizeVertical*10,
              left: 0,
              child: Container(color: dSecondaryColor)),
          Positioned(
            top: SizeConfig.blockSizeVertical*10,
              left: 40,
              child:
              Image.asset(imageAsset!=null? imageAsset!: "",
                width: SizeConfig.blockSizeHorizontal*48, height: SizeConfig.blockSizeVertical*58,fit: BoxFit.contain,),),
          Positioned(
              width: SizeConfig.blockSizeHorizontal*30,
              height: SizeConfig.blockSizeVertical*100,
              top: SizeConfig.blockSizeVertical*10,
              left: SizeConfig.blockSizeHorizontal*56,
              child:
                MainTitleDescription(title, description)
              ),
          Positioned(
            bottom: 10,
            left: MediaQuery.of(context).size.width/9,
            child: Container( child:bottomImageAsset != null? Image.asset(
              bottomImageAsset != null ? bottomImageAsset! : "",
              width: SizeConfig.blockSizeHorizontal*70,
              height: SizeConfig.blockSizeVertical*30,
              fit: BoxFit.scaleDown,
            ):Container())),
            ]));
  }
}