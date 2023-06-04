import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';

import 'main_description.dart';
import 'main_title.dart';

class MainTitleDescription extends StatelessWidget {
  const MainTitleDescription(this.title, this.description,
      {this.titleColor = dSecondaryColor,
      this.descriptionColor = dSecondaryColor});

  final String title;
  final String description;
  final Color titleColor, descriptionColor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      MainTitle(title, titleColor: this.titleColor),
      MainDescription(description, descriptionColor: this.descriptionColor)
    ]);
  }
}
