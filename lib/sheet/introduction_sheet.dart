import 'package:ditp_intro_flutter_slide/component/main_title_description.dart';
import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IntroductionSheet extends StatelessWidget {
  IntroductionSheet({super.key, required this.onStart});

  final Function onStart;
  final String title = DateFormat("dd MM yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints( maxWidth: 1400),
    child:Stack(
        children: [
      Positioned(
          top: 74,
          right: 16,
          width: 800,
          height: 800,
          child: Container(child: Image.asset('assets/intro_bubbles.png'))),
      Positioned(
          width: 300,
          height: 500,
          top: 100,
          left: 180,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(title,
                    style: Theme.of(context).textTheme.displaySmall)),
            MainTitleDescription("Flutter +\nDitp ==\nUseful?", "A short look into the practicality of introducing yet another framework into our tech stack",
            )
           ,Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Material(
                  //Wrap with Material
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  elevation: 18.0,
                  clipBehavior: Clip.antiAlias, // Add This
                  child: MaterialButton(
                    color: dPrimaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      onStart.call();
                    },
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24),
                        child: Text("Start",
                            style: Theme.of(context).textTheme.displayMedium)),
                  ),
                ))
          ])),
    ]));
  }
}
