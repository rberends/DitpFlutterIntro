import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';

abstract class BaseSheet extends StatelessWidget {
  const BaseSheet({super.key});

  getDefaultPaddedContainer(Widget child) {
    return Container(
        child: Align(
            alignment: Alignment.center,
            widthFactor: 0.9,
            child: Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: kHorizontalPaddding),
                child: Container(child: child, constraints: BoxConstraints(maxWidth: 1400)),)));
  }
}
