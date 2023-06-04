import 'dart:math';

import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class MainTitle extends StatelessWidget {
  const MainTitle(this.title, {this.titleColor = dSecondaryColor});

  final String title;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.transparent,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: SizeConfig.textScaleSize),
            child: Text(title,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.displayLarge?.apply(
                    color: titleColor,
                    fontSizeFactor: max(SizeConfig.textScaleSize / 11, 0.6)))));
  }
}
