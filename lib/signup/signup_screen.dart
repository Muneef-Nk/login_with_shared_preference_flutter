import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/home_screen.dart';
import '../login/login_screeen.dart';
import '../utils/color_constants.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});

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
                child: Text('Create Your\nAccount', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(
                padding: EdgeInsets.all(20),
                height:  610,
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
                        decoration: InputDecoration(
                          label: Text("Full Name", style: TextStyle(fontWeight: FontWeight.bold, color: red),),
                          suffixIcon: Icon(Icons.check),
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text("Phone or Gmail", style: TextStyle(fontWeight: FontWeight.bold, color: red),),
                          suffixIcon: Icon(Icons.check),
                        ),
                      ),
                      SizedBox(height: 20,),
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
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Text("Conform Password", style: TextStyle(fontWeight: FontWeight.bold, color: red),),
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Forgot Password?", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                      SizedBox(height: 30,),
                      InkWell(
                        onTap: (){
                          print("clicked");
                          setdata();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
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
                                "SIGN UP",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Already have an account?", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
                      SizedBox(height: 5,),
                      InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginScreen()));
                          },
                          child: Text("SIGN IN", style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
              ),
            )
          ]
      ),
    );
  }
  Future<void> setdata()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', userController.text.toString());
    await prefs.setString('password', passwordController.text.toString());

  }

}
