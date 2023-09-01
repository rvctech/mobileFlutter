import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tunyce/sidemenu.dart';
import 'package:tunyce/signup.dart';
import 'constants.dart';
import 'forgotpassword.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
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
                    border:
                        Border.all(color: Colors.transparent), // Remove border
                  ),
                  child: Image.asset('assets/images/logo.jpg',
                      width: 270, height: 240),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: TextField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_box_outlined,
                      color: Colors.redAccent,
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: TextField(
                  controller: _passwordController,
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.password_outlined,
                      color: Colors.redAccent,
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    final response = await http.post(
                      Uri.parse(
                          '${Constants.baseURL}/authentication/login/v1/'),
                      headers: {'Content-Type': 'application/json'},
                      body: jsonEncode({'email': email, 'password': password}),
                    );

                    if (response.statusCode == 200) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SideMenuPage()),
                      );

                      print('Test');
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
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()));
                },
                child: const Text('Forgot Password?',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                    textScaleFactor: 1.3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
