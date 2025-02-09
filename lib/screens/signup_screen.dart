import 'package:flutter/material.dart';
import 'package:bahatreen/widgets/custom_button.dart';  // Import CustomButton
import 'package:bahatreen/widgets/custom_text_field.dart';  // Import CustomTextField
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isSignUpPressed = false;  // To track whether "Sign Up" button is pressed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', height: 100),
              SizedBox(height: 50),
              CustomTextField(label: 'Username', prefixIcon: Icons.person),
              SizedBox(height: 20),
              CustomTextField(label: 'Email', prefixIcon: Icons.email),
              SizedBox(height: 20),
              CustomTextField(label: 'Password', prefixIcon: Icons.lock, obscureText: true),
              SizedBox(height: 20),
              CustomTextField(label: 'Confirm Password', prefixIcon: Icons.lock, obscureText: true),
              SizedBox(height: 20),
              CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                },
                buttonColor: Colors.orange,  // Set button color to orange
                textColor: Colors.black,     // Set text color to black
              ),
            ],
          ),
        ),
      ),
    );
  }
}
