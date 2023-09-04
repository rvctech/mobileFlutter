import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success'),
        backgroundColor: Colors.green, // You can customize the color
      ),
      body: Center(
        child: Text('Signup Successful!'),
      ),
    );
  }
}