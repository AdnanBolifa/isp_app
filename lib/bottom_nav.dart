import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:isp_app/constants.dart';
import 'screens/profile_page.dart';
import 'screens/statistics_page.dart';
import 'screens/home_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key, required this.title});
  final String title;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _pageIndex = 1;
  final PageController _pageController = PageController(initialPage: 1);

  final List<Widget> _pages = [
    const StatisticsPage(),
    const ISPHomePage(),
    const ProfilePage(title: 'Profile'), // Pass title directly to ProfilePage
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      bottomNavigationBar: CurvedNavigationBar(
        color: AppColors.secondary,
        backgroundColor: AppColors.primary,
        items: const <Widget>[
          Icon(
            Icons.bar_chart,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
          _pageController.jumpToPage(index);
        },
        index: _pageIndex,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        children: _pages,
      ),
    );
  }
}
