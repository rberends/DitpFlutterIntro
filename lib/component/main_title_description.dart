import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(title,
              style: Theme
                  .of(context)
                  .textTheme
                  .displayLarge?.apply(color: titleColor))),
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
          description,
          style: Theme
                  .of(context)
                  .textTheme
                  .displayMedium?.apply(color: descriptionColor)))
    ]);
  }
}