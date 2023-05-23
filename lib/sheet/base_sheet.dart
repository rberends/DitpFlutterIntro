import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';

class BaseSheet extends StatelessWidget {
  const BaseSheet(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
       color: dPrimaryColor,
       child: Center(
          child: Text(title)
        )
    );
  }
}