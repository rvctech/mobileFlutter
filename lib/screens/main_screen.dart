import 'package:flutter/material.dart';
import 'package:tunyce/core/common/app_colors.dart';
import 'package:tunyce/screens/account/account_screen.dart';
import 'package:tunyce/screens/home/home_screen.dart';

import 'library/library_screen.dart';
import 'search/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  // Define your pages/screens that correspond to each bottom navigation tab
  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const LibraryScreen(),
    const AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      // Show the current page based on the index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex =
                index; // Update the current index when a tab is tapped
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 24,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.home,
              size: 24,
              color: AppColors.primaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 24,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.search,
              size: 24,
              color: AppColors.primaryColor,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.music_note,
              size: 24,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.music_note,
              size: 24,
              color: AppColors.primaryColor,
            ),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 24,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.person,
              size: 24,
              color: AppColors.primaryColor,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
