// register_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:retailfusion/pages/login/login_page.dart';

class RegisterPage extends StatelessWidget {
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

                // Wrap SafeArea with a Container to add a red border
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Group 1: Heading and Subtext with top padding
                        Column(
                          children: [
                            Text(
                              'Create Your Account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Color(0xFFF6C90E),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Let's get started with your RetailFusion account.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Color(0x7FEEEEEE),
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
                              'Name',
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
                              'Phone',
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
                            // Add top padding to the button
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Builder(
                                      builder: (BuildContext context) {
                                        return TextButton(
                                          onPressed: () {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'Sign Up button pressed!'),
                                                duration: Duration(seconds: 2),
                                              ),
                                            );
                                            Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (context,
                                                        animation,
                                                        secondaryAnimation) =>
                                                    LoginPage(),
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
                                          child: Text(
                                            'Sign Up',
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
                                ),
                                SizedBox(height: 8),
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
                                          TextSpan(
                                              text:
                                                  "Already have an account? "),
                                          TextSpan(
                                            text: 'Sign in',
                                            style: TextStyle(
                                              color: Color(0xFFF6C90E),
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                // Code to execute when the "Register" text is clicked
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        'Sign in clicked!'),
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ),
                                                );
                                                Navigator.push(
                                                  context,
                                                  PageRouteBuilder(
                                                    pageBuilder: (context,
                                                            animation,
                                                            secondaryAnimation) =>
                                                        LoginPage(),
                                                    transitionsBuilder:
                                                        (context,
                                                            animation,
                                                            secondaryAnimation,
                                                            child) {
                                                      var begin =
                                                          Offset(1.0, 0.0);
                                                      var end = Offset.zero;
                                                      var curve = Curves.ease;

                                                      var tween = Tween(
                                                              begin: begin,
                                                              end: end)
                                                          .chain(CurveTween(
                                                              curve: curve));

                                                      return SlideTransition(
                                                        position: animation
                                                            .drive(tween),
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
                            )
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
