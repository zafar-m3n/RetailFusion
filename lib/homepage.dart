import 'package:flutter/material.dart';
import 'dart:async';

import 'pages/analytics/analytics.dart';
import 'pages/customersupport/customersupport.dart';
import 'pages/inventory/inventory.dart';
import 'pages/orders/orders.dart';

class HomePage extends StatelessWidget {
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
        body: Column(
          children: [
            // Fixed Section: Wave Image, User Name, and Profile Picture
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
                  top: 30,
                  left: 15,
                  child: Text(
                    'Bruce Wayne',
                    style: TextStyle(
                      color: Color(0xFF252C33),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            // Scrollable Section
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildStatsSection(),
                    _buildRecentActivitiesSection(),
                    _buildQuickActionsSection(),
                    _buildSalesRevenueSection(),
                    _buildRevenueBreakdownSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        // color: Color(0x7FEEEEEE),
        border: Border.all(color: Color(0xFFEEEEEE)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        spacing: 8.0,
        runSpacing: 4.0,
        children: [
          _buildStatItem(Icons.people, '1,365', 'Total Customers'),
          _buildStatItem(Icons.shopping_cart, '21,332', 'Total Orders'),
          _buildStatItem(Icons.attach_money, '\$268,193', 'Total Revenue'),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Color(0xFFF6C90E)),
        Text(value,
            style: TextStyle(color: Color(0xFFF6C90E), fontFamily: 'Poppins')),
        Text(label,
            style: TextStyle(color: Color(0xFFEEEEEE), fontFamily: 'Poppins')),
      ],
    );
  }

  Widget _buildRecentActivitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Recent Activity',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFEEEEEE),
              fontFamily: 'Poppins',
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            // color: Color(0x7FEEEEEE),
            border: Border.all(color: Color(0xFFEEEEEE)),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildActivityItem(
                  'Orders', '09/10/2023', 'John Doe order dispatched'),
              Divider(
                color: Color(0xFFEEEEEE),
              ),
              _buildActivityItem(
                  'Inventory', '08/10/2023', 'Inventory restocked'),
              Divider(
                color: Color(0xFFEEEEEE),
              ),
              _buildActivityItem(
                  'Customer Support', '07/10/2023', 'Jane Doe order refund'),
              Divider(
                color: Color(0xFFEEEEEE),
              ),
              _buildActivityItem(
                  'Orders', '07/10/2023', 'John Doe order cancelled'),
              Divider(
                color: Color(0xFFEEEEEE),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem(String type, String date, String description) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$type\n',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color(0xFFEEEEEE),
            ),
          ),
          TextSpan(
            text: '$date\n$description',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFFEEEEEE),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Take control of your business with quick actions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFEEEEEE),
              fontFamily: 'Poppins',
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(15),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton('View Sales Insights'),
                _buildActionButton('Access Customer Support'),
                _buildActionButton('Manage Inventory'),
                _buildActionButton('Track Inventory Status'),
              ],
            ),
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

  Widget _buildSalesRevenueSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Sales Revenue',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFEEEEEE),
              fontFamily: 'Poppins',
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFEEEEEE)),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            // Placeholder for the line graph.
            // Replace this with your actual line graph widget.
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15), // Border radius of 15
              child: Image.asset(
                'assets/images/salesgraph.png',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRevenueBreakdownSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Revenue Breakdown',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFEEEEEE),
              fontFamily: 'Poppins',
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFEEEEEE)),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            // Placeholder for the line graph.
            // Replace this with your actual line graph widget.
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15), // Border radius of 15
              child: Image.asset(
                'assets/images/productschart.png',
              ),
            ),
          ),
        ),
      ],
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
            // <-- Added Material widget here
            type: MaterialType.transparency, // Makes it transparent
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF252C33),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFFEEEEEE)),
              ),
              child: Stack(
                children: [
                  // Rectangle at the top
                  Column(
                    children: [
                      Container(
                        height: 90, // 2/5 of overlay height
                        decoration: BoxDecoration(
                          color: Color(0xFFF6C90E),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                        ),
                      ),
                      // Profile Image
                      // Username and Edit Icon
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Bruce Wayne',
                            style: TextStyle(
                                color: Color(0xFFF6C90E),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                fontSize: 16),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.edit,
                            color: Color(0xFFF6C90E),
                          ),
                        ],
                      ),
                      // Other Options
                      _buildOption('Notifications', Icons.notifications),
                      _buildOption('Dark Mode', Icons.dark_mode),
                      ListTile(
                        leading: Icon(
                          Icons.language,
                          color: Color(0xFFEEEEEE),
                        ),
                        title: Text(
                          'Language',
                          style: TextStyle(
                            color: Color(0xFFEEEEEE),
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.help,
                          color: Color(0xFFEEEEEE),
                        ),
                        title: Text(
                          'Help',
                          style: TextStyle(
                            color: Color(0xFFEEEEEE),
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      // Sign Out
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                            color: Color(0xFFEEEEEE),
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

  Widget _buildOption(String text, IconData icon) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color(0xFFEEEEEE),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Color(0xFFEEEEEE),
          fontFamily: 'Poppins',
        ),
      ),
      trailing: Switch(
        value: true,
        onChanged: (bool value) {},
      ),
    );
  }
}
