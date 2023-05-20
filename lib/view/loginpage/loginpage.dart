import 'package:apitmtpproject/view/navbar/pageview_widgets/home.dart';
import 'package:flutter/material.dart';

import '../../constants/size.dart';
import '../navbar/nav_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            SizedBox(
              width: maxWidth,
              height: maxHeight,
              child: Image.asset(
                "assets/images/thor.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              child: Container(
                width: maxWidth,
                height: maxHeight,
                color: Colors.red.withOpacity(0.5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: maxHeight * (100 / Sizex.currentHeight),
                      ),
                      SizedBox(
                          width: maxWidth * (250 / Sizex.currentWidth),
                          height: maxHeight * (150 / Sizex.currentHeight),
                          child: Image.asset(
                            "assets/images/logo.png",
                            fit: BoxFit.fill,
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: maxWidth * (30 / Sizex.currentWidth),
                            vertical: maxHeight * (20 / Sizex.currentHeight)),
                        child: TextField(
                          controller: TextEditingController(),
                          style: const TextStyle(color: Colors.white),
                          cursorHeight: 30,
                          decoration: InputDecoration(
                            hintText: "kabeer",
                            hintStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            focusColor: Colors.white,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width:
                                        maxWidth * (2 / Sizex.currentWidth))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: maxWidth * (2 / Sizex.currentWidth),
                                    color: Colors.white)),
                            prefixIcon: Icon(
                              Icons.person,
                              size: maxWidth * (30 / Sizex.currentWidth),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: maxWidth * (30 / Sizex.currentWidth),
                            vertical: maxHeight * (20 / Sizex.currentHeight)),
                        child: TextField(
                          controller: TextEditingController(),
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "kabeer@gmail.com",
                            hintStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            focusColor: Colors.white,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width:
                                        maxWidth * (2 / Sizex.currentWidth))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: maxWidth * (2 / Sizex.currentWidth),
                                    color: Colors.white)),
                            prefixIcon: Icon(
                              Icons.email,
                              size: maxWidth * (30 / Sizex.currentWidth),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: maxWidth * (30 / Sizex.currentWidth),
                            vertical: maxHeight * (20 / Sizex.currentHeight)),
                        child: TextField(
                          controller: TextEditingController(),
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: " . . . . . .",
                            hintStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            focusColor: Colors.white,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width:
                                        maxWidth * (2 / Sizex.currentWidth))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: maxWidth * (2 / Sizex.currentWidth),
                                    color: Colors.white)),
                            prefixIcon: Icon(
                              Icons.lock,
                              size: maxWidth * (30 / Sizex.currentWidth),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: maxHeight * (40 / Sizex.currentHeight),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => const HomePage(),
                            //   ),
                            // );
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                              (route) => false,
                            );
                            TextEditingController().clear();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    maxWidth * (50 / Sizex.currentWidth),
                                vertical:
                                    maxHeight * (15 / Sizex.currentHeight)),
                            child: const Text(
                              "Continue",
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                          )),
                      SizedBox(
                        height: maxHeight * (60 / Sizex.currentHeight),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: maxWidth * (70 / Sizex.currentWidth),
                            height: maxHeight * (70 / Sizex.currentHeight),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: maxWidth * (3 / Sizex.currentWidth),
                                ),
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  maxWidth * (10 / Sizex.currentWidth)),
                              child: Icon(
                                Icons.facebook,
                                color: Colors.white,
                                size: maxWidth * (40 / Sizex.currentWidth),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    maxWidth * (15 / Sizex.currentWidth)),
                            child: Container(
                                width: maxWidth * (70 / Sizex.currentWidth),
                                height: maxHeight * (70 / Sizex.currentHeight),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width:
                                          maxWidth * (3 / Sizex.currentWidth),
                                    ),
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      maxWidth * (15 / Sizex.currentWidth)),
                                  child: Image.asset(
                                    "assets/images/Untitled-removebg-preview.png",
                                    color: Colors.white,
                                    // width: maxWidth * (30 / Sizex.currentWidth),
                                  ),
                                )),
                          ),
                          Container(
                            width: maxWidth * (70 / Sizex.currentWidth),
                            height: maxHeight * (70 / Sizex.currentHeight),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: maxWidth * (3 / Sizex.currentWidth),
                                ),
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  maxWidth * (15 / Sizex.currentWidth)),
                              child: Image.asset(
                                "assets/images/google.png",
                                // width: maxWidth * (10 / Sizex.currentWidth),
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: maxHeight * (50 / Sizex.currentHeight),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Do you have already an account?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: maxWidth * (15 / Sizex.currentWidth)),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
