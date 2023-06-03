import 'dart:developer' as developer;
import 'dart:math';

import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class MainDescription extends StatelessWidget {
  const MainDescription(this.description,
      {this.descriptionColor = dSecondaryColor});

  final String description;
  final Color descriptionColor;

  @override
  Widget build(BuildContext context) {
    developer.log(
        ' fontSizeFactor:  ${max(SizeConfig.textScaleSize / 11, 0.6)}',
        name: 'my.app.category');

    // TODO: implement build
    return Padding(
        padding: EdgeInsets.symmetric(vertical: SizeConfig.textScaleSize * 2),
        child: Text(description,
            style: Theme.of(context).textTheme.displayMedium?.apply(
                color: descriptionColor,
                fontSizeFactor: max(SizeConfig.textScaleSize / 9, 0.6))));
  }
}
