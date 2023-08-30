import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tunyce/signup.dart';
import 'forgotpassword.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'sidemenu.dart';

void main() => runApp(LoginScreen());

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LoginBody(),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(),
        color: Colors.black,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.transparent), // Remove border
                    ),
                    child: Image.asset('assets/images/logo.jpg',
                        width: 270, height: 240),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_box_outlined,
                          color: Colors.redAccent,
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent))),
                  ),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password_outlined,
                            color: Colors.redAccent),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent))),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    onPressed: () async {
                      // final email = emailController.text;
                      //  final password = passwordController.text;
                      const email =
                          "matatu@gmail.com"; // Replace with user's input
                      const password = "Hope2022*"; // Replace with user's input

                      // print(email);
                      // print(password);
                      print("Tryyyyyyyyyyyyyy");

                      final response = await http.post(
                        Uri.parse(
                            'https://mighty-thicket-88919.herokuapp.com/api/authentication/login/v1/'),
                        // Replace with your API endpoint
                        headers: {'Content-Type': 'application/json'},
                        body:
                            // jsonEncode({'email': email, 'password': password}),
                            jsonEncode({
                          'email': 'matatu@gmail.com',
                          'password': 'Hope2022*'
                        }),
                      );

                      if (response.statusCode == 200) {
                        print('Test');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SideMenuPage()),
                        );
                      } else {
                        Fluttertoast.showToast(
                            msg: "Incorrect User or Password",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the SignUpScreen when "Sign Up" is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    child: const Text('Sign Up'),
                  ),
                ),
                SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()));
                  },
                  child: Text('Forgot Password?',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                      textScaleFactor: 1.3),
                ),
              ],
            ),
          ),
        ));
  }
}
