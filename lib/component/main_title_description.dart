import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class MainTitleDescription extends StatelessWidget {
  const MainTitleDescription(this.title, this.description, {this.titleColor = dSecondaryColor, this.descriptionColor = dSecondaryColor});

  final String title;
  final String description;
  final Color titleColor, descriptionColor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.symmetric(vertical:24),
          child: Text(title,
              style: Theme
                  .of(context)
                  .textTheme
                  .displayLarge?.apply(color: titleColor,  fontSizeFactor:  SizeConfig.blockSizeVertical/11))
        ),
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Text(
          description,
          style: Theme
                  .of(context)
                  .textTheme
                  .displayMedium?.apply(color: descriptionColor,  fontSizeFactor: SizeConfig.blockSizeVertical/9)))
    ]);
  }
}