import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IntroductionSheet extends StatelessWidget {
  IntroductionSheet({super.key});


  final String title = DateFormat("dd MM yyyy").format(DateTime.now());

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