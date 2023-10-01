import 'package:flutter/material.dart';

import '../analytics/analytics.dart';
import '../customersupport/customersupport.dart';
import '../../homepage.dart';
import '../inventory/inventory.dart';

class OrdersPage extends StatelessWidget {
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
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                      radius: 30,
                    ),
                  ),
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
                      'Orders',
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
                          hintText: 'Search orders',
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
                    // Order 1
                    Container(
                      margin: EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 15.0),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFEEEEEE),
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
                                  Icon(Icons.local_shipping,
                                      color: Color(0xFFEEEEEE)),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order Dispatched',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFF6C90E)),
                                      ),
                                      Text(
                                        '09/10/2023',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward,
                                  color: Color(0XFFEEEEEE)),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.confirmation_number,
                                      color: Color(0xFFEEEEEE)),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                      Text(
                                        '#A45192',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.date_range,
                                      color: Color(0xFFEEEEEE)),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Estimated Delivery',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                      Text(
                                        '13/10/2023',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 15.0),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFEEEEEE),
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
                                  Icon(Icons.local_shipping,
                                      color: Color(0xFFEEEEEE)),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Delivered',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFF00FF00)),
                                      ),
                                      Text(
                                        '05/10/2023',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward,
                                  color: Color(0XFFEEEEEE)),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.confirmation_number,
                                      color: Color(0xFFEEEEEE)),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                      Text(
                                        '#A33209',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.date_range,
                                      color: Color(0xFFEEEEEE)),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Delivered On',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                      Text(
                                        '08/10/2023',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 15.0),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFEEEEEE),
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
                                  Icon(Icons.local_shipping,
                                      color: Color(0xFFEEEEEE)),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Delivered',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFF00FF00)),
                                      ),
                                      Text(
                                        '01/10/2023',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward,
                                  color: Color(0XFFEEEEEE)),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.confirmation_number,
                                      color: Color(0xFFEEEEEE)),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                      Text(
                                        '#A30412',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.date_range,
                                      color: Color(0xFFEEEEEE)),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Delivered On',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                      Text(
                                        '03/10/2023',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 15.0),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFEEEEEE),
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
                                  Icon(Icons.local_shipping,
                                      color: Color(0xFFEEEEEE)),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Cancelled',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFFF0000)),
                                      ),
                                      Text(
                                        '28/09/2023',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward,
                                  color: Color(0XFFEEEEEE)),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.confirmation_number,
                                      color: Color(0xFFEEEEEE)),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                      Text(
                                        '#A29287',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.date_range,
                                      color: Color(0xFFEEEEEE)),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Estimated Delivery',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                      Text(
                                        '03/10/2023',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 15.0),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFEEEEEE),
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
                                  Icon(Icons.local_shipping,
                                      color: Color(0xFFEEEEEE)),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Delivered',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFF00FF00)),
                                      ),
                                      Text(
                                        '20/09/2023',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward,
                                  color: Color(0XFFEEEEEE)),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.confirmation_number,
                                      color: Color(0xFFEEEEEE)),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                      Text(
                                        '#A25915',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.date_range,
                                      color: Color(0xFFEEEEEE)),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Delivered On',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                      Text(
                                        '26/09/2023',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 15.0),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFEEEEEE),
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
                                  Icon(Icons.local_shipping,
                                      color: Color(0xFFEEEEEE)),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Delivered',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFF00FF00)),
                                      ),
                                      Text(
                                        '16/09/2023',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward,
                                  color: Color(0XFFEEEEEE)),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.confirmation_number,
                                      color: Color(0xFFEEEEEE)),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                      Text(
                                        '#A23894',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.date_range,
                                      color: Color(0xFFEEEEEE)),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Delivered On',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                      Text(
                                        '18/09/2023',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0XFFEEEEEE)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
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
