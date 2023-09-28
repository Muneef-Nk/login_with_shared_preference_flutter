import 'package:flutter/material.dart';
import 'package:login/home/home_screen.dart';
import 'package:login/welcome_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 4)).then((value)async {
      SharedPreferences prefs =await SharedPreferences.getInstance();
      prefs.getString('username')!=null && prefs.getString('password')!=null?
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Home()))
      :          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>WelcomeScreen()));

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("shared preferences", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
            Lottie.asset("assets/lottie/animation_ln2xkajo.json"),
            Lottie.asset("assets/lottie/animation_ln2xqdfi.json", width: 200),
          ],
        )
      ),
    );
  }
}
