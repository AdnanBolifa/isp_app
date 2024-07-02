import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:isp_app/constants.dart';
import 'screens/drawer/balance_page.dart';
import 'screens/drawer/speed_test_page.dart';
import 'screens/profile_page.dart';
import 'screens/statistics_page.dart';
import 'screens/home_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _pageIndex = 1;
  final PageController _pageController = PageController(initialPage: 1);

  final List<Widget> _pages = [
    const StatisticsPage(),
    const ISPHomePage(),
    const ProfilePage(),
  ];

  final List<String> _titles = [
    'Statistics',
    'Home',
    '',
  ];

  void _onDrawerItemTapped(int index) {
    Navigator.pop(context);
    setState(() {
      _pageIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: _pageIndex != 2
          ? AppBar(
              backgroundColor: AppColors.primary,
              title: Text(
                _titles[_pageIndex],
                style: const TextStyle(color: Colors.white),
              ),
            )
          : null,
      drawer: _pageIndex != 2
          ? Drawer(
              backgroundColor: AppColors.primary,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                    ),
                    child: Text(
                      'ISP App',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.bar_chart, color: Colors.white),
                    title: const Text('Statistics',
                        style: TextStyle(color: Colors.white)),
                    onTap: () => _onDrawerItemTapped(0),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home, color: Colors.white),
                    title: const Text('Home',
                        style: TextStyle(color: Colors.white)),
                    onTap: () => _onDrawerItemTapped(1),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.white),
                    title: const Text('Profile',
                        style: TextStyle(color: Colors.white)),
                    onTap: () => _onDrawerItemTapped(2),
                  ),
                  ListTile(
                    leading: const Icon(Icons.speed, color: Colors.white),
                    title: const Text('Speed Test',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SpeedTestPage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_balance_wallet,
                        color: Colors.white),
                    title: const Text('Balance',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BalancePage()),
                      );
                    },
                  ),
                ],
              ),
            )
          : null,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        children: _pages,
      ),
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
    );
  }
}
