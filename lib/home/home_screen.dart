import 'package:flutter/material.dart';
import 'package:login/login/login_screeen.dart';
import 'package:login/utils/color_constants.dart';
import 'package:login/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue

                  )
              ),
              onPressed: ()async{
            SharedPreferences prefs = await SharedPreferences.getInstance();
             prefs.setBool('isKeepLogin', false);
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
               }, child: Text("Logout"),
            ),

            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(red)
              ),
              onPressed: ()async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
               prefs.clear();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>WelcomeScreen()), (route) => false);
            }, child: Text("delete my account"),
            )
          ],
        ),
      ),
    );
  }
}
