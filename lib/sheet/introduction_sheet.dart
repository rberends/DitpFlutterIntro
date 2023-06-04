import 'package:ditp_intro_flutter_slide/component/main_title_description.dart';
import 'package:ditp_intro_flutter_slide/sheet/base_sheet.dart';
import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:ditp_intro_flutter_slide/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/strings.dart';

class IntroductionSheet extends BaseSheet {
  IntroductionSheet({super.key, required this.onStart});

  final Function onStart;
  final String title = DateFormat("dd MM yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    //init size config
    SizeConfig(context);
    return getDefaultPaddedContainer(Stack(children: [
      Positioned(
        top: SizeConfig.safeBlockVertical * 12,
        left: SizeConfig.safeBlockHorizontal * 25,
        child: Container(
          child: Image.asset(
            'assets/intro_bubbles.png',
            width: SizeConfig.safeBlockHorizontal * 65,
            height: SizeConfig.safeBlockVertical * 85,
            fit: BoxFit.contain,
          ),
        ),
      ),
      Positioned(
          width: SizeConfig.safeBlockHorizontal * 35,
          height: SizeConfig.safeBlockVertical * 100,
          top: SizeConfig.safeBlockVertical * 12,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical * 1),
                child: Text(title,
                    style: Theme.of(context).textTheme.displaySmall)),
            MainTitleDescription(Strings.introTitle, Strings.introDesc),
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical * 1),
                child: Material(
                  //Wrap with Material
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                  elevation: 1.0,
                  clipBehavior: Clip.antiAlias, // Add This
                  child: MaterialButton(
                    elevation: 0,
                    color: dPrimaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      onStart.call();
                    },
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        child: Text("Start",
                            style: Theme.of(context).textTheme.displayMedium)),
                  ),
                ))
          ])),
    ]));
  }
}
