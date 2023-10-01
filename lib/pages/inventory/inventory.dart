import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import '../../dark_mode_provider.dart'; // <-- Import your DarkModeProvider

import '../analytics/analytics.dart';
import '../customersupport/customersupport.dart';
import '../../homepage.dart';
import '../orders/orders.dart';

class InventoryPage extends StatelessWidget {
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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF252C33),
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
                      'Inventory',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFFF6C90E),
                      ),
                    ),
                    // Search Bar
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
                          hintText: 'Search Inventory',
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
                    _buildQuickActionsSection(),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFEEEEEE)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/doughnut.png',
                              width: 100,
                              height: 100,
                            ),
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Two Fake Doughnuts',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Color(0xFFEEEEEE),
                                ),
                              ),
                              Row(
                                children: List.generate(5, (index) {
                                  if (index < 4) {
                                    return Icon(Icons.star,
                                        color: Color(0xFFF6C90E));
                                  } else if (index == 4) {
                                    return Icon(Icons.star_half,
                                        color: Color(0xFFF6C90E));
                                  }
                                  return Icon(Icons.star_border,
                                      color: Color(0xFFF6C90E));
                                }),
                              ),
                              Text(
                                '\$77.00',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Color(0xFFEEEEEE),
                                ),
                              ),
                              Text(
                                'In Stock',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFEEEEEE)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/watch.png',
                              width: 100,
                              height: 100,
                            ),
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cool Black Watch',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Color(0xFFEEEEEE),
                                ),
                              ),
                              Row(
                                  children: List.generate(
                                5,
                                (index) =>
                                    Icon(Icons.star, color: Color(0xFFF6C90E)),
                              )),
                              Text(
                                '\$180.00',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Color(0xFFEEEEEE),
                                ),
                              ),
                              Text(
                                'In Stock',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFEEEEEE)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/shoe.png',
                              width: 100,
                              height: 100,
                            ),
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'One Right Shoe',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Color(0xFFEEEEEE),
                                ),
                              ),
                              Row(
                                children: List.generate(5, (index) {
                                  if (index < 4) {
                                    return Icon(Icons.star,
                                        color: Color(0xFFF6C90E));
                                  }
                                  return Icon(Icons.star_border,
                                      color: Color(0xFFF6C90E));
                                }),
                              ),
                              Text(
                                '\$35.00',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Color(0xFFEEEEEE),
                                ),
                              ),
                              Text(
                                'In Stock',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFEEEEEE)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/sunglasses.png',
                              width: 100,
                              height: 100,
                            ),
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Random Sunglasses',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Color(0xFFEEEEEE),
                                ),
                              ),
                              Row(
                                children: List.generate(5, (index) {
                                  if (index < 4) {
                                    return Icon(Icons.star,
                                        color: Color(0xFFF6C90E));
                                  } else if (index == 4) {
                                    return Icon(Icons.star_half,
                                        color: Color(0xFFF6C90E));
                                  }
                                  return Icon(Icons.star_border,
                                      color: Color(0xFFF6C90E));
                                }),
                              ),
                              Text(
                                '\$20.00',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Color(0xFFEEEEEE),
                                ),
                              ),
                              Text(
                                'Out of Stock',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFEEEEEE)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/ring.png',
                              width: 100,
                              height: 100,
                            ),
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pretty Pink-ish Ring',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Color(0xFFEEEEEE),
                                ),
                              ),
                              Row(
                                  children: List.generate(
                                5,
                                (index) =>
                                    Icon(Icons.star, color: Color(0xFFF6C90E)),
                              )),
                              Text(
                                '\$120.00',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Color(0xFFEEEEEE),
                                ),
                              ),
                              Text(
                                'In Stock',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFEEEEEE)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/knife.png',
                              width: 100,
                              height: 100,
                            ),
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dope Pocket Knife',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Color(0xFFEEEEEE),
                                ),
                              ),
                              Row(
                                children: List.generate(5, (index) {
                                  if (index < 4) {
                                    return Icon(Icons.star,
                                        color: Color(0xFFF6C90E));
                                  } else if (index == 4) {
                                    return Icon(Icons.star_half,
                                        color: Color(0xFFF6C90E));
                                  }
                                  return Icon(Icons.star_border,
                                      color: Color(0xFFF6C90E));
                                }),
                              ),
                              Text(
                                '\$63.00',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Color(0xFFEEEEEE),
                                ),
                              ),
                              Text(
                                'Out of Stock',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
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

  Widget _buildQuickActionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildActionButton('Add Product'),
              _buildActionButton('Reorder Stock'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          title,
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
                          color: mainColor,
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
