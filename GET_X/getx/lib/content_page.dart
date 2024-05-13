import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_detail_page.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  List list = [];
  List info = [];

  Future<void> readData() async {
    try {
      String jsonString = await DefaultAssetBundle.of(context)
          .loadString("assets/json/recent.json");
      setState(() {
        list = json.decode(jsonString);
        info = json.decode(jsonString);
      });
    } catch (error) {
      print("Error reading data: $error");
    }
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int _currentIndex = 0;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70),
        color: Color(0xFFc5e5f3),
        child: Column(
          children: [
            //james smith
            Container(
              width: width,
              height: 100,
              margin: const EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFebf8fd),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage("lib/imgasset/background.jpg"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "James Smith",
                          style: TextStyle(
                              color: Color(0xFF3b3f42),
                              fontSize: 18,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Top Level",
                          style: TextStyle(
                              color: Color(0xFFfdebb2),
                              fontSize: 12,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFf3fafc)),
                      child: Center(
                        child: Icon(
                          Icons.notifications,
                          color: Color(0xFF69c5df),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //popular contest
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Popular Contest",
                      style: TextStyle(
                        color: Color(0xFF1f2326),
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "Show all",
                    style: TextStyle(
                        color: Color(0xFFcfd5b3),
                        fontSize: 15,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFfdc33c)),
                    child: GestureDetector(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //list
            Container(
              height: 220,
              child: PageView.builder(
                  controller: PageController(viewportFraction: 0.88),
                  itemCount: 4,
                  itemBuilder: (_, i) {
                    return GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        height: 220,
                        width: MediaQuery.of(context).size.width - 20,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: i.isEven
                                ? Color(0xFF69c5df)
                                : Color(0xFF9294cc)),
                        child: Column(
                          children: [
                            Container(
                                child: Row(
                              children: [
                                Text(
                                  "info[i]['title']",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                Expanded(child: Container())
                              ],
                            )),
                            SizedBox(height: 10),
                            Container(
                              width: width,
                              child: Text(
                                " info[i]['text']",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xFFb8eefc)),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              thickness: 1.0,
                            ),
                            Row(children: [
                              for (int i = 0; i < 4; i++)
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "lib/imgasset/background.jpg"),
                                            fit: BoxFit.cover)),
                                  ),
                                )
                            ]),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            //recent contests
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  Text(
                    "Recent Contests",
                    style: TextStyle(
                        color: Color(0xFF1f2326),
                        fontSize: 20,
                        decoration: TextDecoration.none),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "Show all",
                    style: TextStyle(
                        color: Color(0xFFcfd5b3),
                        fontSize: 15,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFfdc33c)),
                    child: GestureDetector(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: 4,
                        itemBuilder: (_, i) {
                          return Container(
                            width: width,
                            height: 100,
                            margin: const EdgeInsets.only(
                                left: 25, right: 25, bottom: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFFebf8fd),
                            ),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage(
                                        "lib/imgasset/background.jpg"),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Status",
                                        style: TextStyle(
                                            color: Color(0xFFfdebb2),
                                            fontSize: 12,
                                            decoration: TextDecoration.none),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        width: 170,
                                        child: Text(
                                          "Text",
                                          style: TextStyle(
                                              color: Color(0xFF3b3f42),
                                              fontSize: 18,
                                              decoration: TextDecoration.none),
                                        ),
                                      )
                                    ],
                                  ),
                                  Expanded(child: Container()),
                                  Container(
                                    width: 70,
                                    height: 70,
                                    child: Text(
                                      "Time",
                                      style: TextStyle(
                                          fontSize: 10,
                                          decoration: TextDecoration.none,
                                          color: Color(0xFFb2b8bb)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }))),
          ],
        ),
      ),
    );
  }
}

/*
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  //loading json file
  List list = [];
  List info = [];
  ReadData() async {
    //savinfg in variable s
    await DefaultAssetBundle.of(context)
        .loadString("json/recent.json")
        .then((s) {
      //for notifying ui,wraping with some state function
      setState(() {
        list = json.decode(s);
      });
    });
    await DefaultAssetBundle.of(context)
        .loadString("json/recent.json")
        .then((s) {
      //for notifying ui,wraping with some state function
      setState(() {
        info = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    ReadData();
    super.initState();
  }

  PageController _pageController = PageController(viewportFraction: 0.88);
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 45, 15, 15),
      body: Container(
        padding: const EdgeInsets.only(top: 70, right: 5, left: 5),
        color: Color.fromARGB(255, 40, 9, 9),
        child: Column(
          children: [
            Container(
              width: width,
              height: 80,
              margin: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(255, 255, 179, 179)),
              child: Container(
                //color: Color.fromARGB(255, 56, 12, 12),
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage("lib/imgasset/background.jpg"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kunal Patil",
                          style:
                              TextStyle(color: Color.fromARGB(255, 0, 22, 87)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Top Level",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 242, 0),
                                fontSize: 15,
                                decoration: TextDecoration.none))
                      ],
                    ),
                    Expanded(child: Container()),
                    Container(
                      // color: Color.fromARGB(255, 77, 16, 16),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 255, 179, 179)),
                      child: Center(
                        child: Icon(
                          Icons.notifications,
                          color: Color.fromARGB(255, 255, 0, 0),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              // color: Color.fromARGB(255, 93, 19, 19),
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  Text(
                    "Popular Contexts",
                    style: TextStyle(
                        color: Color.fromARGB(255, 168, 252, 255),
                        fontSize: 22,
                        decoration: TextDecoration.none),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "Show all",
                    style: TextStyle(
                        color: Color(0xFFcfd5b3),
                        fontSize: 15,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFfdc33c)),
                    child: GestureDetector(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 220,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.88),
                itemCount: info.length,
                itemBuilder: (_, i) {
                  return GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      height: 220,
                      width: MediaQuery.of(context).size.width - 20,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: i.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            info[i]['title'],
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: width, // Assuming width is defined somewhere
                            child: Text(
                              "Text",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xFFb8eefc)),
                            ),
                          ),
                          SizedBox(height: 5),
                          Divider(
                            thickness: 2,
                          ),
                          Row(
                            children: [
                              for (int i = 0; i < 5; i++)
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "lib/imgasset/background.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              height: 20,
            ),
            //RECENT CONTESTS
            Container(
              color: Color.fromARGB(255, 51, 0, 0),
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  Text(
                    "Recent Contests",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 177, 177),
                        fontSize: 20,
                        decoration: TextDecoration.none),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "Show all",
                    style: TextStyle(
                        color: Color.fromARGB(255, 151, 250, 255),
                        fontSize: 15,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 113, 79, 0)),
                    child: GestureDetector(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 10,
                      itemBuilder: (_, i) {
                        return Container(
                          //color: Colors.black,
                          height: 100,
                          width: width,
                          margin: const EdgeInsets.only(
                              left: 25, right: 25, bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFebf8fd),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage("lib/imgasset/background.jpg"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                        color: Color(0xFFfdebb2),
                                        fontSize: 12,
                                        decoration: TextDecoration.none),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 170,
                                    child: Text(
                                      "Text",
                                      style: TextStyle(
                                          color: Color(0xFF3b3f42),
                                          fontSize: 18,
                                          decoration: TextDecoration.none),
                                    ),
                                  )
                                ],
                              ),
                              Expanded(child: Container()),
                              Container(
                                width: 70,
                                height: 70,
                                child: Text(
                                  "Time",
                                  style: TextStyle(
                                      fontSize: 10,
                                      decoration: TextDecoration.none,
                                      color: Color(0xFFb2b8bb)),
                                ),
                              )
                            ]),
                          ),
                        );
                      })),
            )
          ],
        ),
      ),
    );
  }
}
*/