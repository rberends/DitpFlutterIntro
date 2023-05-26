import 'package:ditp_intro_flutter_slide/component/main_title_description.dart';
import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';

class TopMiddleSheet extends StatelessWidget {
  const TopMiddleSheet(this.title, this.description,  this.imageAsset, {super.key} );

  final String title;
  final String description;
  final String? imageAsset;

  @override
  @override
  Widget build(BuildContext context) {
    return   Padding( padding: EdgeInsets.symmetric(horizontal: 100),
        child:Center(child: Container(
        constraints: BoxConstraints( maxWidth: 1400),
    child:Stack(
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
              )
        ]))));
  }
}