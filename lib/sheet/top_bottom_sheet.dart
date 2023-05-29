import 'package:ditp_intro_flutter_slide/component/main_title_description.dart';
import 'package:ditp_intro_flutter_slide/sheet/base_sheet.dart';
import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';

class TopBottomSheet extends BaseSheet {
  const TopBottomSheet(this.title, this.description,  this.imageAsset, {super.key} );

  final String title;
  final String description;
  final String? imageAsset;

  @override
  @override
  Widget build(BuildContext context) {
    return   getDefaultPaddedContainer(Stack(
        children: [
          Positioned(
              width: 1300,
              height: 680,
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
              )
        ]));
  }
}