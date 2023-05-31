import 'dart:math';

import 'package:ditp_intro_flutter_slide/component/main_title_description.dart';
import 'package:ditp_intro_flutter_slide/sheet/base_sheet.dart';
import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';

class LeftCornerSheet extends BaseSheet {
  const LeftCornerSheet(this.title, this.description,  this.imageAsset,  {this.bottomImageAsset = null});

  final String title;
  final String description;
  final String? imageAsset;
  final String? bottomImageAsset;

  @override
  @override
  Widget build(BuildContext context) {
    return   getDefaultPaddedContainer(
    Stack(
        fit: StackFit.expand,
    children: [
          Positioned(
              width: min(MediaQuery.of(context).size.width/2, 700),
              height: 680,
              top: 90,
              left: 0,
              child: Container(color: dSecondaryColor)),
          Positioned(
              top: 100,
              left: 40,
              child:
              Image.asset(imageAsset!=null? imageAsset!: "",
                width: min(MediaQuery.of(context).size.width/2-50,600), height: 600,fit: BoxFit.contain,),),
          Positioned(
              width: 320,
              height: 500,
              top: 100,
              right: 40,
              child:
                MainTitleDescription(title, description)
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