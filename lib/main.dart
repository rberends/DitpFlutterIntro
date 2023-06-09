import 'package:ditp_intro_flutter_slide/sheet/introduction_sheet.dart';
import 'package:ditp_intro_flutter_slide/sheet/left_corner_sheet.dart';
import 'package:ditp_intro_flutter_slide/sheet/left_right_sheet.dart';
import 'package:ditp_intro_flutter_slide/sheet/middle_left_right_sheet.dart';
import 'package:ditp_intro_flutter_slide/sheet/top_left_right_sheet.dart';
import 'package:ditp_intro_flutter_slide/sheet/top_middle_sheet.dart';
import 'package:ditp_intro_flutter_slide/topbar/background_clipper.dart';
import 'package:ditp_intro_flutter_slide/utils/my_scroll_behavior.dart';
import 'package:ditp_intro_flutter_slide/utils/size_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'sheet/top_bottom_sheet.dart';
import 'utils/constants.dart';
import 'utils/strings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ditp Flutter Introduction',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                color: dSecondaryColor,
                fontSize: 50,
                fontWeight: FontWeight.bold),
            displayMedium: TextStyle(color: dSecondaryColor, fontSize: 20),
            displaySmall: TextStyle(color: dSecondaryColor, fontSize: 20),
            bodyMedium: TextStyle(color: dSecondaryColor, fontSize: 16),
            titleMedium: TextStyle(color: dSecondaryColor, fontSize: 20),
          ),
          fontFamily: "Playfair"),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController controller = PageController();
  final FocusNode _focusNode = FocusNode();

  void _handleKeyEvent(RawKeyEvent event) {
    var offset = controller.offset;
    if (event.logicalKey == LogicalKeyboardKey.arrowUp &&
        event is RawKeyUpEvent) {
      setState(() {
        if (kReleaseMode) {
          controller.animateToPage((controller.page! - 1).toInt(),
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        } else {
          controller.animateToPage((controller.page! - 1).toInt(),
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown &&
        event is RawKeyUpEvent) {
      setState(() {
        if (kReleaseMode) {
          controller.animateToPage((controller.page! + 1).toInt(),
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        } else {
          controller.animateToPage((controller.page! + 1).toInt(),
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        }
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //init size config
    SizeConfig(context);

    final FocusNode focusNode = FocusNode();

    return Scaffold(
        body: Stack(
      children: [
        TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            curve: Curves.easeInExpo,
            duration: const Duration(seconds: 1),
            builder: (BuildContext context, double opacity, Widget? child) {
              return Opacity(
                  opacity: opacity,
                  child: Flex(direction: Axis.vertical, children: [
                    Expanded(
                        child: RawKeyboardListener(
                            autofocus: true,
                            onKey: _handleKeyEvent,
                            focusNode: focusNode,
                            child: PageView(
                              clipBehavior: Clip.antiAlias,
                              allowImplicitScrolling: true,

                              /// [PageView.scrollDirection] defaults to [Axis.horizontal].
                              /// Use [Axis.vertical] to scroll vertically.
                              controller: controller,
                              scrollDirection: Axis.vertical,
                              scrollBehavior: MyCustomScrollBehavior(),
                              children: <Widget>[
                                Center(
                                    child: IntroductionSheet(
                                        onStart: () => {
                                              controller.animateToPage(
                                                  (controller.page! + 1)
                                                      .toInt(),
                                                  duration: const Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.ease)
                                            })),
                                const TopBottomSheet(
                                    Strings.secondTitle,
                                    Strings.secondDesc,
                                    "assets/second_bubbles.webp",
                                    bottomImageAsset:
                                        "assets/second_image.webp"),
                                const LeftCornerSheet(
                                    Strings.thirdTitle,
                                    Strings.thirdDesc,
                                    "assets/white_bubbles.webp",
                                    bottomImageAsset:
                                        "assets/third_image.webp"),
                                const TopBottomSheet(
                                    Strings.fourthTitle,
                                    Strings.fourthDesc,
                                    "assets/fourth_image.webp"),
                                const TopBottomSheet(
                                    Strings.fifthTitle,
                                    Strings.fifthDesc,
                                    "assets/second_bubbles.webp",
                                    bottomImageAsset: "assets/companies.webp",
                                    showLargeBottomImage: true),
                                const LeftCornerSheet(
                                    Strings.sixthTitle,
                                    Strings.sixthDesc,
                                    "assets/white_bubbles.webp",
                                    bottomImageAsset: "assets/light_apps.webp"),
                                const TopMiddleSheet(
                                    Strings.seventhTitle,
                                    Strings.seventhDesc,
                                    "assets/dart_bubbles.webp",
                                    bottomImageAsset:
                                        "assets/seventh_bottom_image.webp"),
                                const MiddleLeftRightSheet(
                                    Strings.eightTitle, Strings.eightDesc,
                                    imageAsset: "assets/eighth_image.webp",
                                    leftImageAsset:
                                        "assets/eight_image_sub_left.webp",
                                    rightImageAsset:
                                        "assets/eight_image_sub_right.webp"),
                                const LeftRightSheet(
                                    Strings.ninthTitle,
                                    Strings.ninthDesc,
                                    "assets/ninth_image.webp"),
                                const LeftCornerSheet(
                                    Strings.eleventhTitle,
                                    Strings.eleventhDesc,
                                    "assets/white_bubbles.webp",
                                    bottomImageAsset:
                                        "assets/eleventh_bottom_image.webp"),
                                const TopLeftRightSheet(
                                  Strings.twelfthTitle,
                                  rightImageAsset:
                                      "assets/twelth_secondary_image.webp",
                                  leftImageAsset: "assets/twelth_image.webp",
                                ),
                                //TODO - add twelth sheet. Needs new class.
                                const TopBottomSheet(
                                  Strings.thirteenthTitle,
                                  Strings.thirteenthDesc,
                                  "assets/thirteenth_image.webp",
                                  bottomImageAsset:
                                      "assets/thirteenth_bottom_image.webp",
                                  showLargeBottomImage: true,
                                ),
                                const TopMiddleSheet(
                                  Strings.fourteenthTitle,
                                  Strings.fourteenthDesc,
                                  "assets/dart_bubbles.webp",
                                  bottomImageAsset:
                                      "assets/fourteenth_image.webp",
                                ),
                                const LeftRightSheet(
                                  Strings.fifteenthTitle,
                                  Strings.fifteenthDesc,
                                  "assets/fifteenth_image.webp",
                                ),
                                const TopBottomSheet(
                                  Strings.sixteenthTitle,
                                  Strings.sixteenthDesc,
                                  "assets/windows_flutter.webp",
                                  bottomImageAsset:
                                      "assets/android_flutter.webp",
                                  showLargeBottomImage: true,
                                ),
                              ],
                            )))
                  ]));
            }),
        Positioned(
          top: 0,
          child: ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: defaultTargetPlatform == TargetPlatform.android
                    ? SizeConfig.blockSizeVertical * 7
                    : SizeConfig.blockSizeVertical * 9,
                decoration: const BoxDecoration(color: dSecondaryColor),
              )),
        ),
        Positioned(
            width: SizeConfig.blockSizeVertical * 6,
            height: SizeConfig.blockSizeVertical * 6,
            top: SizeConfig.blockSizeVertical * 2,
            left: defaultTargetPlatform == TargetPlatform.android
                ? SizeConfig.blockSizeHorizontal * 12
                : SizeConfig.blockSizeHorizontal,
            child: InkWell(
                child: Image.asset('assets/ditp.webp'),
                onTap: () => launchUrlString('https://www.ditp.nl'))),
      ],
    ));
  }
}
