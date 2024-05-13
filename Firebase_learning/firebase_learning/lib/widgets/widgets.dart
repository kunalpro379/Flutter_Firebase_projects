import 'package:firebase_learning/widgets/app_shadow.dart';
import 'package:firebase_learning/widgets/text_wid.dart';
import 'package:flutter/material.dart';

Widget appBoarding(PageController controller, Widget customButton,
    {String img = "",
    String Text = "",
    String Subtitle = "",
    Subtitle2 = "",
    int index = 0,
    required BuildContext context}) {
  return Column(children: [
    Image.asset(
      img,
      fit: BoxFit.fitWidth,
    ),
    Container(
      margin: EdgeInsets.only(top: 60),
      child: Column(
        children: [
          text22Normal(text: Text),
          SizedBox(
            height: 30,
          ),
          text19Normal(
            text: Subtitle,
          ),
          text14Normal(
            text: Subtitle2,
          ),
          customButton,
        ],
      ),
    ),
  ]);
}

Widget customButton(
    int index, PageController controller, String text, BuildContext context) {
  return GestureDetector(
    onTap: () {
      print('my index is : $index');
      if (index < 3) {
        controller.animateToPage(index,
            duration: Duration(milliseconds: 400), curve: Curves.easeIn);
        // } else {
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => const signIn()));
        //
      } else {
        Navigator.pushNamed(context, "signIn");
      }
    },
    child: Container(
      width: 300,
      height: 35,
      margin: EdgeInsets.only(top: 150, left: 130, right: 20),
      decoration: appBoxShadow(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
          ),
          text22Normal(
              text: text, color: Color.fromARGB(255, 255, 255, 255), SIZE: 20),
          Icon(
            Icons.arrow_circle_right_outlined,
            size: 35,
          )
        ],
      ),
    ),
  );
}
