import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import '../../dark_mode_provider.dart';

import '../analytics/analytics.dart';
import '../../homepage.dart';
import '../inventory/inventory.dart';
import '../orders/orders.dart';
import 'complaint_open.dart';
import 'complaint_processing.dart';
import 'complaint_closed.dart';

class SupportPage extends StatelessWidget {
  void _showProfileOverlay(BuildContext context) {
    final Completer<OverlayEntry> completer = Completer<OverlayEntry>();

    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) {
        return ProfileOverlay(
          onClose: () => completer.future.then((entry) => entry.remove()),
        );
      },
    );

    completer.complete(overlayEntry);
    Overlay.of(context).insert(overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(
        context); // <-- Access the DarkModeProvider

    // Conditional colors based on dark mode
    Color mainColor =
        darkModeProvider.isDarkMode ? Color(0xFFF6C90E) : Color(0xFFB79A20);
    Color backgroundColor =
        darkModeProvider.isDarkMode ? Color(0xFF252C33) : Color(0xFFEEEEEE);
    Color textColor =
        darkModeProvider.isDarkMode ? Color(0xFFEEEEEE) : Color(0xFF252C33);
    Color successColor =
        darkModeProvider.isDarkMode ? Color(0xFF00FF00) : Color(0xFF006600);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/wave.png',
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 20,
                      right: 15,
                      child: GestureDetector(
                        onTap: () => _showProfileOverlay(context),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/profile.jpg'),
                          radius: 30,
                        ),
                      )),
                  Positioned(
                    top: 20,
                    left: 15,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logo.png'),
                      radius: 30,
                    ),
                  ),
                ],
              ),
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Customer Support',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: mainColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true, // Added this line to reduce the height
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10), // Adjust padding
                          fillColor: Color(
                              0xFFEEEEEE), // Set the fill color of the TextField
                          filled: true,
                          suffixIcon:
                              Icon(Icons.search), // Moved the icon to the right
                          hintText: 'Search complaints',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize:
                                12, // Set the font family for the hint text
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OpenComplaintPage(), // Replace this with your Order Details page class name
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 15.0, right: 15.0, bottom: 15.0),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: textColor,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.badge, color: textColor),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Complaint ID',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: textColor),
                                        ),
                                        Text(
                                          '#A03233',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              color: textColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.date_range, color: textColor),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Complaint Date',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: textColor),
                                        ),
                                        Text(
                                          '13/10/2023',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              color: textColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.warning_amber_rounded,
                                        color: textColor),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Open',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Color(0XFFFF0000)),
                                        ),
                                        Text(
                                          'Defective Product: Order #123456',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: textColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(Icons.arrow_forward, color: textColor),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProcessingComplaintPage(), // Replace this with your Order Details page class name
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 15.0),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: textColor,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.badge, color: textColor),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Complaint ID',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: textColor),
                                          ),
                                          Text(
                                            '#A45192',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                color: textColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.date_range, color: textColor),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Complaint Date',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: textColor),
                                          ),
                                          Text(
                                            '10/10/2023',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                color: textColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.warning_amber_rounded,
                                          color: textColor),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Processing',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: mainColor),
                                          ),
                                          Text(
                                            'Defective Product: Order #123456',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: textColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.arrow_forward, color: textColor),
                                ],
                              ),
                            ],
                          ),
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ClosedComplaintPage(), // Replace this with your Order Details page class name
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 15.0, right: 15.0, bottom: 15.0),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: textColor,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.badge, color: textColor),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Complaint ID',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: textColor),
                                        ),
                                        Text(
                                          '#A21321',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              color: textColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.date_range, color: textColor),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Complaint Date',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: textColor),
                                        ),
                                        Text(
                                          '09/10/2023',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              color: textColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.warning_amber_rounded,
                                        color: textColor),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Closed',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: successColor),
                                        ),
                                        Text(
                                          'Defective Product: Order #123456',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: textColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(Icons.arrow_forward, color: textColor),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ClosedComplaintPage(), // Replace this with your Order Details page class name
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 15.0, right: 15.0, bottom: 15.0),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: textColor,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.badge, color: textColor),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Complaint ID',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: textColor),
                                        ),
                                        Text(
                                          '#A32003',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              color: textColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.date_range, color: textColor),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Complaint Date',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: textColor),
                                        ),
                                        Text(
                                          '07/10/2023',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              color: textColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.warning_amber_rounded,
                                        color: textColor),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Closed',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: successColor),
                                        ),
                                        Text(
                                          'Defective Product: Order #123456',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: textColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(Icons.arrow_forward, color: textColor),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ClosedComplaintPage(), // Replace this with your Order Details page class name
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 15.0, right: 15.0, bottom: 15.0),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: textColor,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.badge, color: textColor),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Complaint ID',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: textColor),
                                        ),
                                        Text(
                                          '#A62614',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              color: textColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.date_range, color: textColor),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Complaint Date',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: textColor),
                                        ),
                                        Text(
                                          '06/10/2023',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              color: textColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.warning_amber_rounded,
                                        color: textColor),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Closed',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: successColor),
                                        ),
                                        Text(
                                          'Defective Product: Order #123456',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: textColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(Icons.arrow_forward, color: textColor),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ClosedComplaintPage(), // Replace this with your Order Details page class name
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 15.0, right: 15.0, bottom: 15.0),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: textColor,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.badge, color: textColor),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Complaint ID',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: textColor),
                                        ),
                                        Text(
                                          '#A56165',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              color: textColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.date_range, color: textColor),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Complaint Date',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: textColor),
                                        ),
                                        Text(
                                          '01/10/2023',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              color: textColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.warning_amber_rounded,
                                        color: textColor),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Closed',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: successColor),
                                        ),
                                        Text(
                                          'Defective Product: Order #123456',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: textColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(Icons.arrow_forward, color: textColor),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      color: Color(0xFFF6C90E), // Background color
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home, color: Color(0xFF252C33)),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Color(0xFF252C33)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OrdersPage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.inventory, color: Color(0xFF252C33)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InventoryPage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.bar_chart, color: Color(0xFF252C33)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AnalyticsPage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.support_agent, color: Color(0xFF252C33)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SupportPage()));
            },
          ),
        ],
      ),
    );
  }
}

class ProfileOverlay extends StatelessWidget {
  final VoidCallback onClose;

  ProfileOverlay({required this.onClose});

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(
        context); // <-- Access the DarkModeProvider

    // Conditional colors based on dark mode
    Color mainColor =
        darkModeProvider.isDarkMode ? Color(0xFFF6C90E) : Color(0xFFB79A20);
    Color backgroundColor =
        darkModeProvider.isDarkMode ? Color(0xFF252C33) : Color(0xFFEEEEEE);
    Color textColor =
        darkModeProvider.isDarkMode ? Color(0xFFEEEEEE) : Color(0xFF252C33);
    Color switchColor =
        darkModeProvider.isDarkMode ? Colors.white : Colors.black;

    return Stack(
      children: [
        // Semi-transparent background
        Positioned.fill(
          child: GestureDetector(
            onTap: onClose,
            child: Container(
              color: Color(0x80252C33),
            ),
          ),
        ),
        // Overlay content
        Positioned(
          left: 20,
          right: 20,
          top: 100,
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor, // <-- Conditional color
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: textColor), // <-- Conditional color
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: Color(0xFFF6C90E),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Bruce Wayne',
                            style: TextStyle(
                                color: mainColor, // <-- Conditional color
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                fontSize: 16),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.edit,
                            color: mainColor, // <-- Conditional color
                          ),
                        ],
                      ),
                      _buildOption(
                          'Notifications',
                          Icons.notifications,
                          context,
                          switchColor), // <-- Added context and switchColor
                      _buildOption('Dark Mode', Icons.dark_mode, context,
                          switchColor), // <-- Added context and switchColor
                      ListTile(
                        leading: Icon(
                          Icons.language,
                          color: textColor, // <-- Conditional color
                        ),
                        title: Text(
                          'Language',
                          style: TextStyle(
                            color: textColor, // <-- Conditional color
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.help,
                          color: textColor, // <-- Conditional color
                        ),
                        title: Text(
                          'Help',
                          style: TextStyle(
                            color: textColor, // <-- Conditional color
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                            color: textColor, // <-- Conditional color
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 45,
                    left: 115,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                      radius: 45,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOption(
      String text, IconData icon, BuildContext context, Color switchColor) {
    final darkModeProvider =
        Provider.of<DarkModeProvider>(context, listen: false);

    return ListTile(
      leading: Icon(
        icon,
        color: switchColor, // <-- Conditional color
      ),
      title: Text(
        text,
        style: TextStyle(
          color: switchColor, // <-- Conditional color
          fontFamily: 'Poppins',
        ),
      ),
      trailing: Switch(
        value: text == 'Dark Mode' ? darkModeProvider.isDarkMode : true,
        onChanged: (bool value) {
          if (text == 'Dark Mode') {
            darkModeProvider.toggleDarkMode();
          }
        },
      ),
    );
  }
}
