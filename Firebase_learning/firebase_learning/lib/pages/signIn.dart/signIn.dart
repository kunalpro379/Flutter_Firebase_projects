import 'package:firebase_learning/widgets/SignInWid.dart';
import 'package:flutter/material.dart';

class signIn extends StatelessWidget {
  const signIn({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: BuildAppBar(),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 175, 231, 255),
                Color.fromARGB(255, 180, 191, 255),
                Color.fromARGB(255, 223, 171, 255),
                Color.fromARGB(255, 234, 166, 255)
              ]),
            ),
            child: Column(
              children: [
                thirdPartyLogin(),
                appText(),
                appTextField(
                  "Email",
                  iconName: "lib/assets/icons/user.png",
                ),
                SizedBox(
                    height:
                        screenSize.height * 0.02), // Adjusted for screen height
                appTextField(
                  "Password",
                  iconName: "lib/assets/icons/lock.png",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
