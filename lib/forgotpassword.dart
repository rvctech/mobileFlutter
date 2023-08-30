import 'package:flutter/material.dart';

class ForgotPasswordScreen  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'), 
        backgroundColor: Colors.redAccent,
      ),
      body: ForgotPasswordBody(
      ),
    );
  }
}
class ForgotPasswordBody extends StatelessWidget {
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

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.redAccent,
                    ),
                    hintText: 'Enter your Email address',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Implement your sign-up logic here
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Reset Password'),

                ),
              ),
            ],
          ),
        ));

  }
}

