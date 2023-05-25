import 'package:flutter/material.dart';

class MainTitleDescription extends StatelessWidget {
  const MainTitleDescription(this.title, this.description, {super.key});

  final String title;
  final String description;


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
                  .displayLarge)),
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
          description,
          style: Theme
                  .of(context)
                  .textTheme
                  .displayMedium))
    ]);
  }
}