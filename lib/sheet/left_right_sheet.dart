import 'dart:math';

import 'package:ditp_intro_flutter_slide/sheet/base_sheet.dart';
import 'package:ditp_intro_flutter_slide/utils/constants.dart';
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
    return getDefaultPaddedContainer(
         Stack(fit: StackFit.expand,
             children: [
          Positioned(
              width: min((MediaQuery.of(context).size.width - 200) / 2+10,800),
              height: MediaQuery.of(context).size.height*0.8,
              top: 100,
              left: 0,
              child: Container(color: dSecondaryColor)),
          Positioned(
            top: 100,
            left: 10,
            child: Image.asset(
              imageAsset != null ? imageAsset! : "",
              width:  min((MediaQuery.of(context).size.width - 200) / 2, 800),
              height: MediaQuery.of(context).size.height*0.8,
              fit: BoxFit.scaleDown,
            ),
          ),
          Positioned(
              width: 220,
              height: 500,
              top: 100,
              left:  min(MediaQuery.of(context).size.width/2, 800),
              child: MainTitleDescription(title, description))
        ]));
  }
}
