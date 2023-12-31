import 'package:flutter/material.dart';
import 'package:login/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../signup/signup_screen.dart';
import '../utils/color_constants.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  TextEditingController userController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                red,dark
              ]),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Text("  'Hello\nSign in!',", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),),
            ),
          ),
       Padding(
         padding: const EdgeInsets.only(top: 50),
         child: Container(
           padding: EdgeInsets.all(20),
           height:  450,
           width: double.infinity,
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(30)
           ),
           child: SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 TextFormField(
                   controller: userController,
                   decoration: InputDecoration(
                     label: Text("Username", style: TextStyle(fontWeight: FontWeight.bold, color: red),),
                     suffixIcon: Icon(Icons.check),
                   ),
                 ),
                 SizedBox(height: 20,),
                 TextFormField(
                   controller: passwordController,
                   decoration: InputDecoration(
                     label: Text("Password", style: TextStyle(fontWeight: FontWeight.bold, color: red),),
                     suffixIcon: Icon(Icons.visibility_off),
                   ),
                 ),
                 SizedBox(height: 20,),
                 Text("Forgot Password?", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),


                 SizedBox(height: 30,),
                 InkWell(
                   onTap: (){
                     checkLogin(userController.text, passwordController.text);
                   },
                   child: Container(
                     width: MediaQuery.of(context).size.width * 0.9,
                     height: 60,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30),
                     gradient: LinearGradient(
                       colors: [
                         red, dark
                       ]
                     )
                     ),
                     child: Center(
                         child: Text(
                           "SIGN IN",
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 20,
                             fontWeight: FontWeight.bold,
                           ),
                         )),
                   ),
                 ),
                 SizedBox(height: 80,),
                 Text("Don't have account?", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
                 SizedBox(height: 5,),
                 InkWell(
                     onTap: (){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUpScreen()));
                     },
                     child: Text("SIGN UP", style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold))),
               ],
             ),
           ),
         ),
       )
        ]
      ),
    );
  }

  Future<void> checkLogin(String name, String password)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.getString('username')==name && prefs.getString('password')==password){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Home()));
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
    }


  }

}
