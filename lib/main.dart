import 'package:flutter/material.dart';
import 'pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF252C33),
        body: Stack(
          children: [
            // Wave Image at the top
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/wave.png',
                fit: BoxFit.cover,
              ),
            ),
            // The rest of your UI elements go here
            SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Image.asset('assets/images/logo.png',
                            height: 225.0),
                      ),
                      // Text Description
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Unleash the power of integration with RetailFusion, the ultimate CRM mobile app designed for online retailers. RetailFusion offers an all-in-one platform to optimize sales, streamline operations, and improve customer relationships.',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFFEEEEEE),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, bottom: 10.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.75,
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
                                                  'Get Started button pressed!'),
                                              duration: Duration(seconds: 2),
                                            ),
                                          );
                                          Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (context, animation,
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
                                                        begin: begin, end: end)
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
                                          'Get Started',
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
                            ),
                            // Terms and Conditions
                            Text(
                              'By clicking Get Started you agree to our Terms and Conditions',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0x7FEEEEEE),
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
