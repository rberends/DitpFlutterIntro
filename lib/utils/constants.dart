import 'package:flutter/material.dart';


const Color dPrimaryColor = Color.fromRGBO(147, 191, 25, 0.78);
const Color dSecondaryColor = Color.fromRGBO(2, 48, 71, 1);
const Color dBackgroundColor = Color.fromRGBO(255, 255, 255, 1);
const Color dSecondaryTextColor = Color.fromRGBO(255, 255, 255, 1);
const Color dDangerColor = Color.fromRGBO(249, 77, 30, 1);
const Color dCaptionColor = Color.fromRGBO(166, 177, 187, 1);

// Lets replace all static sizes
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;
