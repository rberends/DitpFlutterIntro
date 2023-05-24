import 'package:ditp_intro_flutter_slide/sheet/base_sheet.dart';
import 'package:ditp_intro_flutter_slide/sheet/introduction_sheet.dart';
import 'package:ditp_intro_flutter_slide/topbar/background_clipper.dart';
import 'package:ditp_intro_flutter_slide/utils/my_scroll_behavior.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'utils/constants.dart';

void main() {
  runApp(const MyApp());
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
        textTheme:     TextTheme(
          displayLarge: TextStyle(color: dSecondaryColor, fontSize: 50, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(color: dSecondaryColor,fontSize: 20),
          displaySmall: TextStyle(color: dSecondaryColor,fontSize: 20),

          bodyMedium: TextStyle(color: dSecondaryColor, fontSize: 16),
    titleMedium: TextStyle(color: dSecondaryColor, fontSize: 20),
        ),
        fontFamily: "Playfair"
      ),
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
          controller.animateToPage((controller.page! - 1) as int,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        } else {
          controller.animateToPage((controller.page! - 1) as int,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown &&
        event is RawKeyUpEvent) {
      setState(() {
        if (kReleaseMode) {
          controller.animateToPage((controller.page! + 1) as int,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        } else {
          controller.animateToPage((controller.page! + 1) as int,
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
    final FocusNode focusNode = FocusNode();

    return Scaffold(
        body: Stack(
      children: [
          Flex(
          direction: Axis.vertical,
          children: [
        Expanded(
            child: RawKeyboardListener(
                autofocus: true,
                onKey: _handleKeyEvent,
                focusNode: focusNode,
                child: PageView(
                  /// [PageView.scrollDirection] defaults to [Axis.horizontal].
                  /// Use [Axis.vertical] to scroll vertically.
                  controller: controller,
                  scrollDirection: Axis.vertical,
                  scrollBehavior: MyCustomScrollBehavior(),
                  children:  <Widget>[
                    Center(
                      child: IntroductionSheet(onStart: () =>
            {
            controller.animateToPage((controller.page! + 1) as int,
            duration: const Duration(milliseconds: 300), curve: Curves.ease)
            }
            )
    ),
                    const Center(
                      child: BaseSheet('Second Page'),
                    ),
                    const Center(
                      child: BaseSheet('Third Page'),
                    ),
                  ],
                )))]),
         Positioned(
           top: 0,
           child:ClipPath(
            clipper: BackgroundClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              decoration: const BoxDecoration(color: dSecondaryColor),
            )),)
        , Positioned(
          width: 50,
          height:50, top: 14, left: 16,
          child:
           InkWell(
             child: Image.asset('assets/ditp.png'),
              onTap: () => launchUrlString('https://www.ditp.nl'))
          ),
      ],
    ));
  }
}
