// login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:retailfusion/pages/register/register_page.dart';
import 'package:retailfusion/homepage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xFF252C33),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Wave Image at the top
                Image.asset(
                  'assets/images/wave.png',
                  fit: BoxFit.cover,
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                      children: [
                        // Group 1: Heading and Subtext with top padding
                        Column(
                          children: [
                            Text(
                              'Welcome Back!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Color(0xFFF6C90E),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16),
                        // Group 2: Input Boxes, Labels, and Button
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                color: Color(0xFFEEEEEE),
                                fontFamily: 'Poppins',
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: TextField(
                                style: TextStyle(
                                  height: 1.0,
                                  fontSize: 12,
                                ),
                                decoration: InputDecoration(
                                    fillColor: Color(0xFFEEEEEE),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), // Add this line for border radius
                                      borderSide: BorderSide.none,
                                    )),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Password',
                              style: TextStyle(
                                color: Color(0xFFEEEEEE),
                                fontFamily: 'Poppins',
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: TextField(
                                style: TextStyle(
                                  height: 1.0,
                                  fontSize: 12,
                                ),
                                decoration: InputDecoration(
                                    fillColor: Color(0xFFEEEEEE),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), // Add this line for border radius
                                      borderSide: BorderSide.none,
                                    )),
                                obscureText: true,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Color(0xFFF6C90E),
                                fontFamily: 'Poppins',
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {},
                              child: Builder(
                                builder: (BuildContext context) {
                                  return TextButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content:
                                              Text('Sign In button pressed!'),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                                  secondaryAnimation) =>
                                              HomePage(),
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            var begin = Offset(1.0, 0.0);
                                            var end = Offset.zero;
                                            var curve = Curves.ease;

                                            var tween = Tween(
                                                    begin: begin, end: end)
                                                .chain(
                                                    CurveTween(curve: curve));

                                            return SlideTransition(
                                              position: animation.drive(tween),
                                              child: child,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                        color: Color(0xFF252C33),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFF6C90E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                            SizedBox(height: 20), // Spacing
                            Text(
                              '--------------- or login with ---------------',
                              style: TextStyle(
                                color: Color(0x7FEEEEEE), // 50% opacity
                                fontFamily: 'Poppins',
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            ElevatedButton.icon(
                              onPressed: () {
                                // Google sign-in logic
                              },
                              icon: Image.asset(
                                'assets/images/google_logo.png', // Replace with your actual Google logo path
                                width: 24,
                                height: 24,
                              ),
                              label: Text(
                                'Google',
                                style: TextStyle(
                                  color: Color(0xFF252C33),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFEEEEEE),
                              ),
                            ),
                            SizedBox(height: 10), // Spacing between buttons
                            ElevatedButton.icon(
                              onPressed: () {
                                // Facebook sign-in logic
                              },
                              icon: Image.asset(
                                'assets/images/facebook_logo.png', // Replace with your actual Facebook logo path
                                width: 24,
                                height: 24,
                              ),
                              label: Text(
                                'Facebook',
                                style: TextStyle(
                                  color: Color(0xFF252C33),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFEEEEEE),
                              ),
                            ),
                            SizedBox(height: 20),
                            Builder(
                              builder: (BuildContext context) {
                                return RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Color(0xFFEEEEEE),
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(text: "Not yet registered? "),
                                      TextSpan(
                                        text: 'Sign up',
                                        style: TextStyle(
                                          color: Color(0xFFF6C90E),
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Code to execute when the "Register" text is clicked
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content:
                                                    Text('Sign up clicked!'),
                                                duration: Duration(seconds: 2),
                                              ),
                                            );
                                            Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (context,
                                                        animation,
                                                        secondaryAnimation) =>
                                                    RegisterPage(),
                                                transitionsBuilder: (context,
                                                    animation,
                                                    secondaryAnimation,
                                                    child) {
                                                  var begin = Offset(1.0, 0.0);
                                                  var end = Offset.zero;
                                                  var curve = Curves.ease;

                                                  var tween = Tween(
                                                          begin: begin,
                                                          end: end)
                                                      .chain(CurveTween(
                                                          curve: curve));

                                                  return SlideTransition(
                                                    position:
                                                        animation.drive(tween),
                                                    child: child,
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
