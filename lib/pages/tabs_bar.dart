import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mymcqapp/pages/notification_page.dart';
import 'package:mymcqapp/pages/profile_page.dart';
import 'package:mymcqapp/pages/search-page.dart';
import 'package:mymcqapp/pages/side_bar.dart';
import 'package:mymcqapp/pages/leaderboard_page.dart';

class TabsBar extends StatefulWidget {
  @override
  _TabsBarState createState() => _TabsBarState();
}

class _TabsBarState extends State<TabsBar> {
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

    originalList = [
      SideBar(),
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: tabIndex, children: listScreens),
      bottomNavigationBar: _buildTabBar(),
      backgroundColor: Colors.white,
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
}
