import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import '../../dark_mode_provider.dart'; // <-- Import your DarkModeProvider
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../analytics/analytics.dart';
import '../customersupport/customersupport.dart';
import '../../homepage.dart';
import '../orders/orders.dart';
import 'inventory.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  File? _image; // <-- Declare a variable to hold the image
  final picker = ImagePicker(); // <-- Declare this

  Future<void> _getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

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
    Color backgroundColor =
        darkModeProvider.isDarkMode ? Color(0xFF252C33) : Color(0xFFEEEEEE);
    Color textColor =
        darkModeProvider.isDarkMode ? Color(0xFFEEEEEE) : Color(0xFF252C33);

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
                                    builder: (context) => InventoryPage()));
                          },
                        ),
                        Text(
                          'Add Product',
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
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Choose an option'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading: Icon(Icons.camera_alt),
                                      title: Text('Camera'),
                                      onTap: () {
                                        _getImageFromCamera();
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.photo_album),
                                      title: Text('Gallery'),
                                      onTap: () {
                                        _getImageFromGallery();
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: _image == null
                                ? EdgeInsets.all(50)
                                : EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              border: Border.all(color: textColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: _image == null
                                ? Icon(Icons.camera_alt,
                                    color: textColor, size: 40)
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      _image!,
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Name',
                      style: TextStyle(
                        color: textColor,
                        fontFamily: 'Poppins',
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 5),
                    TextField(
                      style: TextStyle(
                        height: 1.0,
                        fontSize: 12,
                      ),
                      decoration: InputDecoration(
                        fillColor: Color(0xFFEEEEEE),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10), // For border radius
                          borderSide: BorderSide(
                              color: textColor,
                              width: 1), // Add this line for border color
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10), // For border radius
                          borderSide: BorderSide(
                              color: textColor,
                              width: 1), // Add this line for border color
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Description',
                      style: TextStyle(
                        color: textColor,
                        fontFamily: 'Poppins',
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 5),
                    TextField(
                      style: TextStyle(
                        height: 1.0,
                        fontSize: 12,
                      ),
                      decoration: InputDecoration(
                        fillColor: Color(0xFFEEEEEE),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10), // For border radius
                          borderSide: BorderSide(
                              color: textColor,
                              width: 1), // Add this line for border color
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10), // For border radius
                          borderSide: BorderSide(
                              color: textColor,
                              width: 1), // Add this line for border color
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Price',
                      style: TextStyle(
                        color: textColor,
                        fontFamily: 'Poppins',
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 5),
                    TextField(
                      style: TextStyle(
                        height: 1.0,
                        fontSize: 12,
                      ),
                      decoration: InputDecoration(
                        fillColor: Color(0xFFEEEEEE),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10), // For border radius
                          borderSide: BorderSide(
                              color: textColor,
                              width: 1), // Add this line for border color
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10), // For border radius
                          borderSide: BorderSide(
                              color: textColor,
                              width: 1), // Add this line for border color
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Availability',
                      style: TextStyle(
                        color: textColor,
                        fontFamily: 'Poppins',
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 5),
                    TextField(
                      style: TextStyle(
                        height: 1.0,
                        fontSize: 12,
                      ),
                      decoration: InputDecoration(
                        fillColor: Color(0xFFEEEEEE),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10), // For border radius
                          borderSide: BorderSide(
                              color: textColor,
                              width: 1), // Add this line for border color
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10), // For border radius
                          borderSide: BorderSide(
                              color: textColor,
                              width: 1), // Add this line for border color
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InventoryPage()));
                            },
                            child: Text(
                              'Add Product',
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
                        ),
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
