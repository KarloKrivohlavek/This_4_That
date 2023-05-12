import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/add_item_pages/add_item_page_2.dart';
import 'package:this_4_that/scratch_files/ex_homepage.dart';
import 'package:im_stepper/stepper.dart';

import 'add_item_pages/add_item_page_1.dart';
import 'package:this_4_that/main.dart';
import 'add_item_pages/add_item_page_3.dart';
import 'add_item_pages/add_item_page_4.dart';
import 'add_item_pages/add_item_page_5.dart';

class MessagesPage extends StatefulWidget {
  VoidCallback? onReturn;

  MessagesPage({
    this.onReturn,
  });

  static const String routeName = '/add_item_page.dart';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => MessagesPage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  int activeStep = 0; // Initial step set to 0.
  final _pageController = PageController(
    initialPage: 0,
  );

  // OPTIONAL: can be set directly.
  int dotCount = 5;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DotStepper(
                    // direction: Axis.vertical,
                    dotCount: dotCount,

                    /// THIS MUST BE SET. SEE HOW IT IS CHANGED IN NEXT/PREVIOUS BUTTONS AND JUMP BUTTONS.
                    activeStep: activeStep,
                    shape: Shape.pipe,
                    spacing: 10,
                    indicator: Indicator.shift,

                    /// TAPPING WILL NOT FUNCTION PROPERLY WITHOUT THIS PIECE OF CODE.
                    onDotTapped: (tappedDotIndex) {
                      setState(() {
                        activeStep = tappedDotIndex;
                      });
                    },

                    // DOT-STEPPER DECORATIONS
                    fixedDotDecoration: FixedDotDecoration(
                      color: Colors.black,
                    ),

                    indicatorDecoration: IndicatorDecoration(
                      // style: PaintingStyle.stroke,
                      strokeWidth: 0,
                      color: Colors.orange,
                    ),
                    lineConnectorDecoration: LineConnectorDecoration(
                      color: Colors.blue,
                      strokeWidth: 0,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      children: [
                        AddItemPage1(),
                        AddItemPage2(),
                        AddItemPage3(),
                        AddItemPage4(),
                        AddItemPage5(),
                      ],
                    ),
                  ),

                  /// Jump buttons.
                  // Padding(padding: const EdgeInsets.all(18.0), child: steps()),

                  // Next and Previous buttons.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // previousButton(),
                      nextButton()
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Generates jump steps for dotCount number of steps, and returns them in a row.
  // Row steps() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: List.generate(dotCount, (index) {
  //       return ElevatedButton(
  //         child: Text('${index + 1}'),
  //         onPressed: () {
  //           setState(() {
  //             activeStep = index;
  //             _pageController.jumpToPage(activeStep);
  //           });
  //         },
  //       );
  //     }),
  //   );
  // }

  /// Returns the next button widget.
  Widget nextButton() {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Dalje',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
        onPressed: () {
          if (activeStep == 4) {
            widget.onReturn?.call();
          }

          /// ACTIVE STEP MUST BE CHECKED FOR (dotCount - 1) AND NOT FOR dotCount To PREVENT Overflow ERROR.
          if (activeStep < dotCount - 1) {
            print(activeStep);

            setState(() {
              activeStep++;
              _pageController.jumpToPage(activeStep);
            });
          }
        },
      ),
    );
  }

  /// Returns the previous button widget.
  Widget previousButton() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        child: Text(
          'Prev',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        onPressed: () {
          // activeStep MUST BE GREATER THAN 0 TO PREVENT OVERFLOW.
          if (activeStep > 0) {
            setState(() {
              activeStep--;
              _pageController.jumpToPage(activeStep);
            });
          }
        },
      ),
    );
  }
}
