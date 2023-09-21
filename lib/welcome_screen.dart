import 'package:flutter/material.dart';
import 'package:login/signup/signup_screen.dart';
import 'package:login/utils/color_constants.dart';
import 'package:login/utils/image_constant.dart';
import 'package:lottie/lottie.dart';

import 'login/login_screeen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
         red,dark
        ])),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Lottie.asset("assets/lottie/welcome.json", height: 200),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white, width: 2)),
                child: Center(
                    child: Text(
                  "SIGN IN",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUpScreen()));
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Center(
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        ),
            SizedBox(
              height: 200,
            ),
            Text(
              "Login with Social Media",
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Socialcontainer(
                  image: fb,
                ),
                Socialcontainer(
                  image: google,
                ),
                Socialcontainer(
                  image: apple,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Socialcontainer extends StatelessWidget {
  const Socialcontainer({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      width: 50,
      height: 50,
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Center(child: Image.asset(image)),
    );
  }
}
