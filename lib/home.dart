// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {


  bool _isOnline = true;
  int _currentIndex = 0;
  late TabController _tabController;
  DateTimeRange ? _selectedDateRange;
  DateFormat _dateFormat = DateFormat('MMM d, yyyy');
  

  @override
  void initState(){
    super.initState();
  _tabController = TabController(length: 3, vsync: this);
  _selectedDateRange = DateTimeRange(
    start: DateTime.now().subtract(Duration(days: 7)), 
    end: DateTime.now());
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }



  Future<void> _selectDateRange (BuildContext context) async {
    DateTimeRange ? picked = await showDateRangePicker(
      context: context, 
      firstDate: DateTime(2020), 
      lastDate: DateTime(2030),
      initialDateRange: _selectedDateRange,
      );

      if (picked != null && picked != _selectedDateRange) {
        setState(() {
          _selectedDateRange = picked;
        });
        
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("profile_pic.png"),
                    ),

                    SizedBox(width: 10),
                    Text('Hi, Perpetual',
                     style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,))
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.headphones_outlined, color:Colors.black),
                    SizedBox(width: 15),
                    Icon(Icons.notifications_outlined)
                  ],
                )
              ],
            ),
            SizedBox(height: 30),
            Center(child: Text("Dashboard", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, fontFamily: 'Open Sans'),)),
            SizedBox(height: 15),
            Container(
              
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3)
                  )
                ]
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: _buildDashboardItem(Image.asset('money.png', width: 24, height: 24,), 'Today Earnings', "₦6,000" )),
                    ],
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: _buildDashboardItem(Image.asset('money.png', width: 24, height: 24,), 'My earnings', '₦90,000')),
                      
                      Expanded(child: _buildDashboardItem(Image.asset('delivery_truck.png', width: 24, height: 24, color: Colors.black,), 'Total Deliveries', '₦2,000')),

                    ],
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: _buildDashboardItem(Icon(Icons.hourglass_empty_outlined), 'Today Deliveries', '3')),
                        
                        Expanded(child: _buildDashboardItem(Image.asset('wallet.png', width: 24, height: 24,), 'Withdraw Money', ''))
                        ]
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status : ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Open Sans',
                    ),
                ),

                Text(
                  _isOnline ? "Online" : "Offline",
                  style: TextStyle(fontFamily: 'Open Sans', fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Switch(
                  value: _isOnline,
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.grey, 
                onChanged: (bool value){
                  setState(() {
                    _isOnline = value;
                  });
                },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Delivery Overview',
            style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Open Sans',
                    ),
            ),
            SizedBox(height: 15),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 136, height:36,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: GestureDetector(
                    onTap: () => _selectDateRange(context),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_month_outlined, size: 14, color: Colors.black),
                        SizedBox(width: 5),
                        Text('${_dateFormat.format(_selectedDateRange!.start)} - ${_dateFormat.format(_selectedDateRange!.end)}',
                        style: TextStyle(fontFamily: 'Open Sans', fontWeight: FontWeight.w400, fontSize: 8),),
                        SizedBox(width: 20),
                        Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 14)
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height:20),



            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      color: Colors.blue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs:[
                      Tab(text: 'Today'),
                      Tab(text: 'Last 7 days'),
                      Tab(text: 'Last 30 days'),
                    ]),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 200,
                      child: TabBarView(
                        controller: _tabController,
                        children: 
                        [
                          _buildOverviewDetails("Today's Data"),
                          _buildOverviewDetails("Last 7 day's Data"),
                          _buildOverviewDetails("Last 30 day's Data"),
              
                        ]),)
                ]),
            ),
            SizedBox(height: 20,),


            




            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3)
                  )
                ]
              ),
              child: Column(
                children: [
                  
                  _buildDeliveryDetails(context, 'KFC Kitchen', '₦6,000', true, 'New', 'assets/kfc_kitchen.png'),
                  _buildDeliveryDetails(context, 'Posh Bakery', '₦5,500', true, 'New', 'assets/posh_bakery.png'),
                  _buildDeliveryDetails(context, 'ChenFord Cakes', '₦2,000', false, "Decline", 'assets/chenford_cakes.png'),
                  _buildDeliveryDetails(context, 'Big Tastes', '₦3,500', true, 'New', 'assets/big_tastes.png'),
                ],
              ),
            )
          ],
        ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.black.withOpacity(0.5),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 24,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/delivery_truck.png', width: 24, height: 24),
            label: 'Deliveries',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/wallet.png', width: 24, height: 24),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/profile.png', width: 24, height: 24),
            label: 'Profile',
          )
        ]),
    );
  }
}

Widget _buildDashboardItem(Widget icon, String label, String value){
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(border: Border.all( // Define the border property
      color: Colors.grey, // Color of the border
      width: 0.7, // This controls the thickness of the border
    ),),
    child: Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(width: 10),
              Text(label, style: TextStyle(fontSize: 12, fontFamily: 'Open Sans', fontWeight: FontWeight.w400),),
            ],
          ),
          
          
           SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Open Sans',
              ),)
        ],
      ),
    ),
  );
}



Widget _buildOverviewDetails(String title) {
  return Center(
    
    child: Text(
      title,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    ),
  );
}



Widget _buildDeliveryDetails(BuildContext context, String store, String amount, bool isNew, String status, String imagePath) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                ),
            ],
        ),
        child: Row(
            children: [
                Image.asset(imagePath, width: 50, height: 50),
                SizedBox(width: 10),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(store, style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(height: 5),
                        Text(amount, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                    ],
                ),
                Spacer(),
                if (isNew) // No change here
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                            status,
                            style: TextStyle(color: Colors.white),
                        ),
                    )
                else // Ensure this block is valid
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                            status,
                            style: TextStyle(color: Colors.white),
                        ),
                    ),
            ],
        ),
    );
}
