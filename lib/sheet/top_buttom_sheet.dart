import 'package:ditp_intro_flutter_slide/utils/constants.dart';
import 'package:flutter/material.dart';

class TopBottomSheet extends StatelessWidget {
  const TopBottomSheet(this.title, this.description, this.imageAsset, {super.key});

  final String title;
  final String description;
  final String imageAsset;

  @override
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text("Flutter +\nDitp ==\nUseful?",
                        style: Theme.of(context).textTheme.displayLarge)),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                        "A short look into the practicality of introducing yet another framework into our tech stack",
                        style: Theme.of(context).textTheme.displayMedium)),
              ])),
        ]);
  }
}