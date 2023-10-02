import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import '../../dark_mode_provider.dart';

import '../analytics/analytics.dart';
import '../customersupport/customersupport.dart';
import '../../homepage.dart';
import '../inventory/inventory.dart';
import 'orders.dart';

class OrderDispatchedDetailsPage extends StatelessWidget {
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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor, // <-- Conditional color
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
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xFF252C33),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrdersPage()));
                          },
                        ),
                        Text(
                          'Order Details',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF252C33),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SafeArea(
                  child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //UI components go here
                    Container(
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Dispatched',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: Color(0xFF252C33),
                        ),
                      ),
                    ),
                    _buildHeading(textColor, 'Order Summary'),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: textColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color:
                                  textColor, // Replace with your own color (textColor)
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Order ID: ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: '#A45192\n'),
                              TextSpan(
                                  text: 'Order Date: ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: '09/10/2023\n'),
                              TextSpan(
                                  text: 'Estimated Delivery Date: ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: '13/10/2023\n'),
                              TextSpan(
                                  text: 'Delivery Address: ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      '123 Elm Street, Springfield, IL 62704, United States'),
                            ],
                          ),
                        )),
                    _buildHeading(textColor, 'Customer Information'),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: textColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color:
                                  textColor, // Replace with your own color (textColor)
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Name:  ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: 'Elena Bennett\n'),
                              TextSpan(
                                  text: 'Address: ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      '123 Elm Street, Springfield, IL 62704, United States\n'),
                              TextSpan(
                                  text: 'Phone: ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: '(555) 123-4567\n'),
                              TextSpan(
                                  text: 'Email: ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: 'elenabennett@gmail.com'),
                            ],
                          ),
                        )),
                    _buildHeading(textColor, 'Order Items'),
                    _buildOrderItemsBox(textColor),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Order Total',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            '\$334.00',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              color: textColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Update Order Status',
                              style: TextStyle(
                                color: Color(0xFF252C33),
                                fontFamily: 'Poppins',
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFF6C90E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }

  Widget _buildHeading(Color textColor, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Dummy function for building order items box
  // You can replace this with real data
  Widget _buildOrderItemsBox(Color borderColor) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Add your product image here
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/doughnut.png',
                  width: 50,
                  height: 50,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Two Fake Doughnuts',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: borderColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$77.00',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: borderColor,
                    ),
                  ),
                ],
              ),
              Text(
                'Qty:2',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: borderColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          // Add more rows as needed
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Add your product image here
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/watch.png',
                  width: 50,
                  height: 50,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cool Black Watch       ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: borderColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$180.00',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: borderColor,
                    ),
                  ),
                ],
              ),
              Text(
                'Qty:1',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: borderColor,
                ),
              ),
            ],
          ),
        ],
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
