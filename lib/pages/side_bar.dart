import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:mymcqapp/pages/home_page.dart';
import 'package:mymcqapp/pages/notification_page.dart';
import 'package:mymcqapp/pages/profile_page.dart';
import 'package:mymcqapp/pages/search-page.dart';
import 'package:mymcqapp/pages/leaderboard_page.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  List<Widget> originalList;
  Map<int, bool> originalDic;
  List<Widget> listScreens;
  List<int> listScreensIndex;
  GlobalKey _bottomNavigationKey = GlobalKey();

  bool isClickSidebar = false;
  int tabIndex = 0;
  Color tabColor = Colors.white;
  Color selectedTabColor = Colors.greenAccent;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);

originalList = [
      HomePage(),
      LeaderboardPage(),
      SearchPage(),
      NotificationPage(),
      ProfilePage()
    ];
    originalDic = {0: true, 1: false, 2: false, 3: false, 4: false};
    listScreens = [originalList.first];
    listScreensIndex = [0];
    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
      bottomNavigationBar: isCollapsed ? _buildTabBar() : null,
    );
  }

  void _selectedTab(int index) {
    print(index);
    if (originalDic[index] == false) {
      listScreensIndex.add(index);
      originalDic[index] = true;
      listScreensIndex.sort();
      listScreens = listScreensIndex.map((index) {
        return originalList[index];
      }).toList();
    }

    setState(() {
      tabIndex = index;
    });
  }

  Widget _buildTabBar() {
    return CurvedNavigationBar(
      color: Colors.blueAccent,
      buttonBackgroundColor: Colors.blueAccent,
      backgroundColor: Colors.white,
      animationCurve: Curves.decelerate,
      height: MediaQuery.of(context).size.height * 0.08,
      key: _bottomNavigationKey,
      items: <Widget>[
        Icon(Icons.home,
            size: MediaQuery.of(context).size.height * 0.04,
            color: Colors.white),
        Icon(Icons.list,
            size: MediaQuery.of(context).size.height * 0.04,
            color: Colors.white),
        Icon(Icons.search,
            size: MediaQuery.of(context).size.height * 0.04,
            color: Colors.white),
        Icon(Icons.notifications,
            size: MediaQuery.of(context).size.height * 0.04,
            color: Colors.white),
        Icon(Icons.person,
            size: MediaQuery.of(context).size.height * 0.04,
            color: Colors.white)
      ],
      onTap: (index) {
        _selectedTab(index);
      },
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Dashboard", style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Messages", style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Utility Bills", style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Funds Transfer", style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Branches", style: TextStyle(color: Colors.white, fontSize: 22)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: isCollapsed ? BorderRadius.all(Radius.circular(0)) : BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: Icon(Icons.menu, color: Colors.blueAccent),
                        onTap: () {
                          setState(() {
                            if (isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();

                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      Text("Home", style: TextStyle(fontSize: 22, color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                      Icon(Icons.settings, color: Colors.white),
                    ],
                  ),
                  // SizedBox(height: 20),
                  // Container(
                  //   height: 200,
                  //   child: PageView(
                  //     controller: PageController(viewportFraction: 0.8),
                  //     scrollDirection: Axis.horizontal,
                  //     pageSnapping: true,
                  //     children: <Widget>[
                  //       Container(
                  //         margin: const EdgeInsets.symmetric(horizontal: 8),
                  //         color: Colors.redAccent,
                  //         width: 100,
                  //       ),
                  //       Container(
                  //         margin: const EdgeInsets.symmetric(horizontal: 8),
                  //         color: Colors.blueAccent,
                  //         width: 100,
                  //       ),
                  //       Container(
                  //         margin: const EdgeInsets.symmetric(horizontal: 8),
                  //         color: Colors.greenAccent,
                  //         width: 100,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  // Text("Transactions", style: TextStyle(color: Colors.white, fontSize: 20),),
                  // ListView.separated(
                  //   shrinkWrap: true,
                  //     itemBuilder: (context, index) {
                  //   return ListTile(
                  //     title: Text("Macbook"),
                  //     subtitle: Text("Apple"),
                  //     trailing: Text("-2900"),
                  //   );
                  // }, separatorBuilder: (context, index) {
                  //   return Divider(height: 16);
                  // }, itemCount: 10),
                  
                  IndexedStack(index: tabIndex, children: listScreens),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}