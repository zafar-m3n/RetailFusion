import 'package:flutter/material.dart';

import '../customersupport/customersupport.dart';
import '../../homepage.dart';
import '../inventory/inventory.dart';
import '../orders/orders.dart';

class AnalyticsPage extends StatelessWidget {
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
                      'Sales Analytics',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFFF6C90E),
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
                      child: Wrap(
                        alignment: WrapAlignment.spaceAround,
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: [
                          _buildStatItem(
                              Icons.people, '1,365', 'Total Customers'),
                          _buildStatItem(
                              Icons.shopping_cart, '21,332', 'Total Orders'),
                          _buildStatItem(
                              Icons.attach_money, '\$268,193', 'Total Revenue'),
                        ],
                      ),
                    ),
                    _buildSalesRevenueSection(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'Top Products',
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
                              _buildActivityItem('watch', 'Cool Black Watch',
                                  '2500 Units Sold'),
                              Divider(
                                color: Color(0xFFEEEEEE),
                              ),
                              _buildActivityItem('doughnut',
                                  'Two Fake Doughnuts', '2000 Units Sold'),
                              Divider(
                                color: Color(0xFFEEEEEE),
                              ),
                              _buildActivityItem('sunglasses',
                                  'Random Sunglasses', '1650 Units Sold'),
                              Divider(
                                color: Color(0xFFEEEEEE),
                              ),
                              _buildActivityItem('knife', 'Dope Pocket Knife',
                                  '1000 Units Sold'),
                              Divider(
                                color: Color(0xFFEEEEEE),
                              ),
                              _buildActivityItem('ring', 'Pretty Pink-ish Ring',
                                  '775 Units Sold'),
                              Divider(
                                color: Color(0xFFEEEEEE),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    _buildRevenueBreakdownSection(),
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

  Widget _buildSalesRevenueSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Sales Revenue 2023',
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

  Widget _buildActivityItem(String image, String name, String amountSold) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/$image.png',
            width: 50,
            height: 50,
          ),
        ),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEEEEEE),
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              amountSold,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFEEEEEE),
                fontFamily: 'Poppins',
              ),
            ),
          ],
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
