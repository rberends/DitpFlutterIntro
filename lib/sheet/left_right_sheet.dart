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
        Padding(
        padding: EdgeInsetsDirectional.symmetric(vertical: 100),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center
                , children: [
                Flexible(child: Padding(padding: EdgeInsetsDirectional.symmetric(horizontal: 10), child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Stack(children: [
                    Positioned(
                        left: 0,
                        child: Container(color: dSecondaryColor)),
                    Positioned(
                        left: 40,
                        child: Expanded( child:Image.asset(
                          imageAsset != null ? imageAsset! : "",
                          fit: BoxFit.scaleDown,
                        )))
                  ])))),
          Flexible(
              child: FractionallySizedBox(
                  widthFactor: 0.6,
                  child: Positioned(
                      width: 320,
                      height: 500,
                      right: 40,
                      child: MainTitleDescription(title, description))))
        ])));
  }
}
