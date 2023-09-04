import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tunyce/homescreen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.redAccent,
      ),
      body: SignUpBody(
      ),
    );
  }
}

class SignUpBody extends StatefulWidget {
  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}


class _SignUpBodyState extends State<SignUpBody> {

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _signup(BuildContext context) async {
    print("Clicked Running");
    final String firstName = firstNameController.text;
    final String middleName = middleNameController.text;
    final String lastName = lastNameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;

    print("Clicked Running $email");



    final Map<String, dynamic> data = {
      'first_name': firstName,
      'middle_name': middleName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'hesquserrole': 8,
      'address': 'Nairobi',
    };

    print(data);

    final Uri url = Uri.parse('https://mighty-thicket-88919.herokuapp.com/api/authentication/registeruser/v1/');

    try {
      print("Clicked Running Here");
      final response = await http.post(
        url,
        body: jsonEncode(data),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        print("Clicked Running Suc");
        // Successful registration, handle the response as needed
        final jsonResponse = json.decode(response.body);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
        // Handle the response here, e.g., show a success message.
      } else {
        // Registration failed, handle the error
        throw Exception('Failed to sign up');
      }
    } catch (e) {
      // Handle any network or other errors that might occur
      print('Error Register: $e');

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.black,
      child:SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/logo.jpg', width: 220, height: 240),
            // Your logo here
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: TextField(
              controller: firstNameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.redAccent,
                ),
                hintText: 'First Name',
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
              controller: middleNameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.redAccent,
                ),
                hintText: 'Middle Name',
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
              controller: lastNameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.account_circle,
                  color: Colors.redAccent,
                ),
                hintText: 'Last Name',
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
              controller: emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
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
              controller: passwordController,
              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: InputDecoration(
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
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: TextField(
              controller: passwordController,
              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.password_outlined,
                  color: Colors.redAccent,
                ),
                hintText: 'Confirm Password',
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
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: ElevatedButton(
              onPressed: () {
                _signup(context);
                print("Clicked");
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Sign Up'),
            ),
          ),
        ],
      ),
    ));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
