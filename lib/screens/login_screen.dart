import 'package:flutter/material.dart';
import 'package:bahatreen/widgets/custom_button.dart';  // Import CustomButton
import 'package:bahatreen/widgets/custom_text_field.dart';  // Import CustomTextField
import 'inventory_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              CustomTextField(label: 'Password', prefixIcon: Icons.lock, obscureText: true),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Forgot Password?", style: TextStyle(color: Colors.orange)),
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Log In',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => InventoryScreen()));
                },
                buttonColor: Colors.orange,  // Set button color to orange
                textColor: Colors.black,     // Set text color to black
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.facebook, color: Colors.blue),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.g_translate, color: Colors.red),
                    onPressed: () {},
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isSignUpPressed = !_isSignUpPressed;  // Toggle the pressed state
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen()));
                },
                child: Text(
                  "New User? Sign Up",
                  selectionColor:Colors.black,
                  style: TextStyle(
                    color: _isSignUpPressed ? Colors.orange: Colors.black, // Change color on press
                    fontWeight: _isSignUpPressed ? FontWeight.bold : FontWeight.normal, // Make it bold on press
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
