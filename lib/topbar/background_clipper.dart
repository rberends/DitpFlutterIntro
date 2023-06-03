import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    // We subtracted 80 from the height here
    path.lineTo(size.width, size.height - SizeConfig.blockSizeVertical * 2);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(BackgroundClipper oldClipper) => oldClipper != this;
}
