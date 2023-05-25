import 'package:ditp_intro_flutter_slide/component/main_title_description.dart';
import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';

class LeftCornerSheet extends StatelessWidget {
  const LeftCornerSheet(this.title, this.description,  this.imageAsset, {super.key} );

  final String title;
  final String description;
  final String? imageAsset;

  @override
  @override
  Widget build(BuildContext context) {
    return   Padding( padding: EdgeInsets.symmetric(horizontal: 100),
        child:Center(child: Container(
        constraints: BoxConstraints( maxWidth: 1300),
    child:Stack(
        children: [
          Positioned(
              width: 700,
              height: 680,
              top: 90,
              left: 0,
              child: Container(color: dSecondaryColor)),
          Positioned(
              top: 90,
              left: 40,
              child: Image.asset(imageAsset!=null? imageAsset!: "", width: 600, height: 800, fit: BoxFit.scaleDown,),),
          Positioned(
              width: 320,
              height: 500,
              top: 100,
              right: 40,
              child:
                MainTitleDescription(title, description)
              )
        ]))));
  }
}