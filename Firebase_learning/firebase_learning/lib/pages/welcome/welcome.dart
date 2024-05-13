import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_learning/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///REVERPOD WAY
final indexPRovider = StateProvider<int>(
    (ref) => 0); // we created shared memory retured index provider
int dotsindex = 0;

class Welcome extends ConsumerWidget //-> changed to consumerWidget
{
  const Welcome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //--> change here

    final index = ref.watch(indexPRovider); //LISTEN TO THE CHANGES
    PageController _controller =
        PageController(); //controller is non constant value
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 47, 0, 0),
      body: SafeArea(
        child: Stack(children: [
          //showing our three wlcome pages
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 49, 0, 0),
              Color.fromARGB(255, 38, 0, 49),

              //Color.fromARGB(255, 62, 44, 0),
            ])),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.03,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.02,
                ),
                child: SizedBox.expand(
                  child: PageView(
                    onPageChanged: (value) {
                      //on page changes here
                      print('my dots vbalue is $dotsindex');
                      ref.read(indexPRovider.notifier).state = value;
                      dotsindex = value;
                    },

                    controller: _controller,
                    //occupies whole screeen
                    //scrollBehavior: AxisDirection.up,R
                    scrollDirection: Axis.vertical,
                    children: [
                      //Image.asset("lib/assets/images/boy.png"),
                      appBoarding(
                          _controller,
                          context: context,
                          customButton(1, _controller, "Next", context),
                          index: 1,
                          img: "lib/assets/images/reading.png",
                          Text: "Welcome to Mindcraft",
                          Subtitle: "Unleash your potential with Mindcraft",
                          Subtitle2:
                              "Learn from the best teachers in the world"),
                      appBoarding(
                          _controller,
                          context: context,
                          customButton(2, _controller, "Next", context),
                          index: 2,
                          img: "lib/assets/images/boy.png",
                          Text: "Connect, collaborate, conquer",
                          Subtitle: "Explore, Click, Learn – Mindcraft,",
                          Subtitle2: "turning curiosity into expertise."),
                      // Container(
                      //   // width: 3,
                      //   // height: 3,
                      //   child: Image.asset("lib/assets/images/reading.png"),
                      // ),
                      appBoarding(
                          context: context,
                          _controller,
                          index: 3,
                          customButton(3, _controller, "Get Started", context),
                          img: "lib/assets/images/man.png",
                          Text: "Craft your mind, shape your future",
                          Subtitle: "Join the Mindcraft community",
                          Subtitle2: " where learners become leaders"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            child: Row(
              children: [
                SizedBox(
                  width: 160,
                ),
                DotsIndicator(
                  position: index,
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                    size: const Size.square(13),
                    activeColor: Colors.yellow,
                    activeSize: const Size(40, 8),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ],
            ),
            bottom: 5,
          )
        ]),
      ),
    );
  }
}
