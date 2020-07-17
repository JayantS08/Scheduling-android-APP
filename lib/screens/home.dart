import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/screens/Profile.dart';
import 'package:task/screens/Schedule.dart';
import 'package:task/screens/User_Listing.dart';
import 'package:task/pages/gradients_page.dart';
import 'package:task/screens/first.dart';
import 'package:task/screens/list_tasks.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController;
  int pageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F3F6),
      key: _scaffoldKey,
      body: PageView(
        children: <Widget>[
          Scaffold(
            body: ListTasks(),
          ),
          MyGradientsPage(),
          Profile(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
          currentIndex: pageIndex,
          onTap: onTap,
          backgroundColor: Color(0xFF4D70A6),
          activeColor: Colors.white,
          inactiveColor: Colors.black,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.access_time,semanticLabel: "Schedule",),title: new Text("Schedule")),
            BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle,semanticLabel: "User Listing",),title: new Text("User Listing")),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                semanticLabel: "Profile",
              ),
                title: new Text("Profile")
            ),
          ]),
    );
  }
}
