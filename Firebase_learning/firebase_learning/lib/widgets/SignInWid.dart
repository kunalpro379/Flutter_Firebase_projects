import 'package:firebase_learning/widgets/appImage.dart';
import 'package:firebase_learning/widgets/app_shadow.dart';
import 'package:firebase_learning/widgets/text_wid.dart';
import 'package:flutter/material.dart';

AppBar BuildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      child: Container(
        color: Color.fromARGB(255, 255, 0, 119),
        height: 1.0,
      ),
      preferredSize: Size.fromHeight(1),
    ),
    title: text22Normal(
      text: "Login",
      color: Colors.black,
    ),
  );
}

Widget thirdPartyLogin() {
  return Container(
    margin: EdgeInsets.only(left: 80, right: 80, top: 80, bottom: 80),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginBut("lib/assets/icons/google.png"),
        _loginBut("lib/assets/icons/apple.png"),
        _loginBut("lib/assets/icons/facebook.png")
      ],
    ),
  );
}

Widget _loginBut(String imagePath) {
  return GestureDetector(
    child: Container(
      width: 60,
      height: 60,
      child: Image.asset(imagePath),
    ),
  );
}

Widget appText() {
  return Container(
    margin: EdgeInsets.only(top: 20),
    child: Column(
      children: [
        text17Normal(
            text: "Or use your email account to login", color: Colors.white
            //color: Colors.black,
            ),
        // text14Normal(
        //   text: "Terms of Service and Privacy Policy",
        //   color: Colors.black,
        // ),
      ],
    ),
  );
}

Widget appTextField(String text, {required String iconName}) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text17Normal(
          text: text,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: 325,
          height: 50,
          decoration: appBoxDecorationTextField(),
          child: Row(
            children: [
              Container(
                height: 24,
                width: 24,
                margin: EdgeInsets.only(left: 17),
                child: appImage(imagePath: iconName),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  width: 200,
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal),
                    ),
                  ))
            ],
          ),
        )
      ],
    ),
  );
}
